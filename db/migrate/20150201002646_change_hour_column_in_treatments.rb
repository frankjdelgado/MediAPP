class ChangeHourColumnInTreatments < ActiveRecord::Migration
  def change
	change_column :treatments, :hour, :string
  end
end
