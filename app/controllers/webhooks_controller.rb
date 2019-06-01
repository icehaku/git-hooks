class WebhooksController < ApplicationController
  before_action :set_issue, only: [:github]

  def github
    @issue.new_event event_params
    head :ok if @issue.save
  end

  private

  def set_issue
    @issue = Issue.find_or_initialize_by(id: params[:webhook][:issue][:number])
  end

  def event_params
    {
      event_action:     params[:webhook][:action],
      user:             params[:webhook][:issue][:user][:login],
      issue_created_at: params[:webhook][:issue][:created_at],
      issue_updated_at: params[:webhook][:issue][:updated_at],
      full_json:        params[:webhook]
    }
  end
end
