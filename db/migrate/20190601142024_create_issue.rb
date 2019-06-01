class CreateIssue < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string    :last_action
      t.string    :last_user_action
      t.datetime  :issue_created_at
      t.datetime  :issue_updated_at

      t.timestamps
    end
  end
end
