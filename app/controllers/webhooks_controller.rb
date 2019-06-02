class WebhooksController < ApplicationController
  before_action :github_auth, :set_issue, only: [:github]

  def github
    head :ok if @issue.new_event(event_params)
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
      issue_updated_at: params[:webhook][:issue][:updated_at],
      full_json:        params[:webhook]
    }
  end

  def github_auth
    github_hash = request.headers['X-Hub-Signature']
    local_hash  = 'sha1=' + OpenSSL::HMAC.hexdigest(
      OpenSSL::Digest.new('sha1'), ENV['GIT_HASH'], request.body.read)

    raise "NotAuthorized" if github_hash != local_hash
  end
end
