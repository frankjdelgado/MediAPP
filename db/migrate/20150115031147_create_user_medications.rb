class CreateUserMedications < ActiveRecord::Migration
  def change
    create_table :user_medications do |t|
      t.string :value
      t.integer :user_id
      t.integer :medication_id
      t.integer :type_id
      t.integer :unit_id
      t.references :user, index: true
      t.references :medication, index: true
      t.references :unit, index: true
      t.references :medication_type, index: true

      t.timestamps
    end
  end
end
