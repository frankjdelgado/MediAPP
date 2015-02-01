class ChangeColumnFrequencyName < ActiveRecord::Migration
  def change
  	rename_column :treatments, :frequency, :frequency_quantity
  end
end
