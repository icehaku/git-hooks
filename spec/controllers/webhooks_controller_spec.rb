require "rails_helper"

RSpec.describe WebhooksController, type: :controller do
  it { is_expected.to use_before_action :github_auth }

  let(:github_hit_params) {
    {
      issue: {
        number: 1,
        created_at: Time.now,
        updated_at: Time.now,
        user: { login: "ice" }
      },
      action: "open"
    }
  }

  describe "#github" do
    context "github hash valid" do
      before { allow_any_instance_of(WebhooksController).to receive(
        :github_auth).and_return(true) }

      context "event was saved" do
        it "has a 200 status code" do
          post :github, params: { webhook: github_hit_params }

          expect(response.status).to eq(200)
          expect(assigns(:issue).persisted?).to be_truthy
        end
      end

      context "error saving the event" do
        before { allow_any_instance_of(Issue).to receive(:new_event).and_raise("Error") }

        it "render json error" do
          post :github, params: { webhook: github_hit_params }

          expect(response.status).to eq(400)
        end
      end
    end

    context "github hash invalid" do
      it "has a 401 status code" do
        post :github, params: { webhook: github_hit_params }

        expect(response.status).to eq(401)
      end
    end
  end

  describe "#github_auth" do
    before { allow_any_instance_of(WebhooksController).to receive(
      :github).and_return(true) }

    context "valid" do
      let(:headers) { { 'X-Hub-Signature': ENV['GIT_HASH'] } }

      before { allow(Rack::Utils).to receive(:secure_compare).and_return(true) }

      it "has a 204 status code" do
        request.headers.merge! headers
        post :github, params: { webhook: github_hit_params }

        expect(response.status).to eq(204)
      end
    end

    context "invalid" do
      it "has a 401 status code" do
        post :github, params: { webhook: github_hit_params }

        expect(response.status).to eq(401)
      end
    end
  end
end
