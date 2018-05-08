class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :dba_name
      t.string :aka_name
      t.integer :license
      t.string :type
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
