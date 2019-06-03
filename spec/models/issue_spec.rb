require "rails_helper"

RSpec.describe Issue, type: :model do
  describe "Should Respond" do
    it { should respond_to :last_action }
    it { should respond_to :last_user_action }
    it { should respond_to :issue_created_at }
    it { should respond_to :issue_updated_at }
  end

  describe "Associations" do
    it { should have_many(:events) }
  end

  context "Validations" do
    it { should validate_presence_of(:last_action) }
    it { should validate_presence_of(:last_user_action) }
  end

  describe "Factory" do
    it { expect(build :issue).to be_a Issue }
    it { expect(build :issue).to be_valid }
  end
end
