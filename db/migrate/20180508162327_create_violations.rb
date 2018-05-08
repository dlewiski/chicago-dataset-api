class CreateViolations < ActiveRecord::Migration[5.2]
  def change
    create_table :violations do |t|
      t.integer :official_id
      t.string :body

      t.timestamps
    end
  end
end
