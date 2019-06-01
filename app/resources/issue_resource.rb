class IssueResource < JSONAPI::Resource
  attributes :last_action, :last_user_action, :issue_created_at, :issue_updated_at\

  has_many :events

  filter :last_action, :last_user_action
end
