require "rails_helper"

RSpec.describe Event, type: :model do
  describe "Should Respond" do
    it { should respond_to :issue_id }
    it { should respond_to :event_action }
    it { should respond_to :user }
    it { should respond_to :issue_created_at }
    it { should respond_to :issue_updated_at }
  end

  describe "Associations" do
    it { should belong_to(:issue) }
  end

  context "Validations" do
    it { should validate_presence_of(:event_action) }
    it { should validate_presence_of(:user) }
  end

  describe "Factory" do
    it { expect(build :event).to be_a Event }
    it { expect(build :event).to be_valid }
  end
end
