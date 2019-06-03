FactoryBot.define do
  factory :event do
    issue            { create :issue }
    event_action     { ["opened", "edited", "deleted", "pinned", "unpinned", "closed"].sample }
    user             { Faker::Games::Dota.player }
    issue_created_at { Faker::Date.between(2.days.ago, Date.today) }
    issue_updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end
end
