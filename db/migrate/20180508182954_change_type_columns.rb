class ChangeTypeColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :facilities, :type
    add_column :facilities, :facility_type, :string

    remove_column :inspections, :type
    add_column :inspections, :inspection_type, :string
  end
end
