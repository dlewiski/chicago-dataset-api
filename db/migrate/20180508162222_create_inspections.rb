class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.integer :official_id
      t.integer :inspection_id
      t.string :type
      t.string :date
      t.string :results

      t.timestamps
    end
  end
end
