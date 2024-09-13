class CreateViolations < ActiveRecord::Migration[6.1]
  def change
    create_table :violations do |t|
      t.references :inspection, null: false, foreign_key: true
      t.date :violation_date
      t.string :violation_type
      t.string :risk_category
      t.text :description

      t.timestamps
    end
  end
end
