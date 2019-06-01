class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references    :issue
      t.string        :event_action
      t.string        :user
      t.string        :full_json
      t.datetime      :issue_created_at
      t.datetime      :issue_updated_at

      t.timestamps
    end
  end
end
