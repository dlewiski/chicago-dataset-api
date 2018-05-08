class CreateInspectionViolations < ActiveRecord::Migration[5.2]
  def change
    create_table :inspection_violations do |t|
      t.integer :inspection_id
      t.integer :violaiton_id
      t.string :comments

      t.timestamps
    end
  end
end
