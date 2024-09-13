class CreateInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :inspections do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.integer :score
      t.date :inspection_date
      t.string :inspection_type

      t.timestamps
    end
  end
end
