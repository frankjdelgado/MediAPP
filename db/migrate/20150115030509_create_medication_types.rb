class CreateMedicationTypes < ActiveRecord::Migration
  def change
    create_table :medication_types do |t|
      t.string :value

      t.timestamps
    end
    add_index :medication_types, :value, unique: true
  end
end
