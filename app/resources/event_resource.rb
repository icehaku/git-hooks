class EventResource < JSONAPI::Resource
  attributes :issue_id, :event_action, :user, :issue_created_at, :issue_updated_at#, :full_json

  has_one :issue

  filter :issue_id, :event_action, :user
end
