class Issue < ApplicationRecord
  has_many :events

  accepts_nested_attributes_for :events

  def new_event params
    event = Event.new(params)
    self.update_issue_by_event(event)

    ActiveRecord::Base.transaction do
      self.save
      event.save
    end
  end

  def update_issue_by_event event
    self.assign_attributes(
      last_action: event.event_action,
      last_user_action: event.user,
      issue_created_at: event.issue_created_at,
      issue_updated_at: event.issue_updated_at )
  end
end
