class WebhooksController < ApplicationController
  before_action :github_auth, :set_issue, only: [:github]

  def github
    begin
      @issue.new_event(event_params)
      head :ok
    rescue => error
      render json: { "error": "BadRequest", status: 400 }, status: 400
    end
  end

  private

  def set_issue
    @issue = Issue.find_or_initialize_by(id: params[:webhook][:issue][:number])
  end

  def event_params
    {
      issue_id:         params[:webhook][:issue][:number],
      event_action:     params[:webhook][:action],
      user:             params[:webhook][:issue][:user][:login],
      issue_created_at: params[:webhook][:issue][:created_at],
      issue_updated_at: params[:webhook][:issue][:updated_at]
    }
  end

  def github_auth
    github_hash = request.headers['X-Hub-Signature']
    local_hash  = 'sha1=' + OpenSSL::HMAC.hexdigest(
      OpenSSL::Digest.new('sha1'), ENV['GIT_HASH'], request.body.read)

    hashs_present = github_hash.present? and local_hash.present?

    unless hashs_present and Rack::Utils.secure_compare(github_hash, local_hash)
      render json: { "error": "NotAuthorized", status: 401 }, status: 401
    end
  end
end
