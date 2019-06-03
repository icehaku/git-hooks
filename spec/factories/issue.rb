FactoryBot.define do
  factory :issue do
    last_action      { ["opened", "edited", "deleted", "pinned", "unpinned", "closed"].sample }
    last_user_action { Faker::Games::Dota.player }
    issue_created_at { Faker::Date.between(2.days.ago, Date.today) }
    issue_updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end
end
