class Issue < ApplicationRecord
  has_many :events

  #validate uniq of issue_number

  def new_event params
    event = Event.new(params)
    self.update_issue_by_event(event)
    self.assign_attributes(events: [event])
  end

  def update_issue_by_event event
    self.assign_attributes(
      last_action: event.event_action,
      last_user_action: event.user,
      issue_created_at: event.issue_created_at,
      issue_updated_at: event.issue_updated_at )
  end
end
