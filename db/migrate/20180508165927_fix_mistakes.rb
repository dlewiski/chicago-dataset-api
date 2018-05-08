class FixMistakes < ActiveRecord::Migration[5.2]
  def change
    remove_column :inspection_violations, :violaiton_id
    add_column :inspection_violations, :violation_id, :integer

    remove_column :inspections, :inspection_id
    add_column :inspections, :facility_id, :integer
  end
end
