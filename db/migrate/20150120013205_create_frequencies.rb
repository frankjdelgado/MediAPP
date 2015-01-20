class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :value

      t.timestamps
    end
    add_index :frequencies, :value, unique: true
  end
end
