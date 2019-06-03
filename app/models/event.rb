class Event < ApplicationRecord
  belongs_to :issue

  validates :event_action, :user, presence: true
end
