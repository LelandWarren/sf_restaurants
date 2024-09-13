class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone_number
      t.string :owner_name
      t.string :owner_address
      t.string :owner_city
      t.string :owner_state
      t.string :owner_zip

      t.timestamps
    end
  end
end
