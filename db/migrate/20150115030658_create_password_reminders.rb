class CreatePasswordReminders < ActiveRecord::Migration
  def change
    create_table :password_reminders do |t|
      t.string :token
      t.integer :user_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
