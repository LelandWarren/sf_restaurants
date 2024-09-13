class CreateViolations < ActiveRecord::Migration[6.1]
  def change
    create_table :violations do |t|
      t.references :inspection, null: false, foreign_key: true
      t.string :violation_code
      t.text :description
      t.string :severity
      t.timestamps
    end
  end
end
