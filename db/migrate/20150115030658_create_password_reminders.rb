class CreatePasswordReminders < ActiveRecord::Migration
  def change
    create_table :password_reminders do |t|
      t.string :token
      t.references :user, index: true
      t.timestamps
    end
  end
end
