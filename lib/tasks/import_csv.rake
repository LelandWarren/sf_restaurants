require 'csv'

namespace :import do
  desc "Import restaurant data from CSV"
  task restaurants: :environment do
    filepath = Rails.root.join('lib', 'sf_restaurants.csv')

    CSV.foreach(filepath, headers: true) do |row|
      # Clean up data by stripping leading/trailing spaces
      name = row['name'].strip
      address = row['address'].strip
      city = row['city'].strip
      postal_code = row['postal_code'].strip

      #strip phone number of leading/trailing spaces and nil values

      phone_number = row['phone_number']&.strip

      # Find or create the restaurant
      restaurant = Restaurant.find_or_create_by(
        name: name,
        address: address,
        city: city,
        postal_code: postal_code,
        phone_number: phone_number
      )

      # Log restaurant creation for debugging purposes
      if restaurant.persisted?
        puts "Imported restaurant: #{restaurant.name}"
      end

      # Create the inspection for this restaurant
      inspection = restaurant.inspections.create!(
        score: row['inspection_score'],
        inspection_date: row['inspection_date'],
        inspection_type: row['inspection_type']
      )

      # Create the violation for this inspection
      inspection.violations.create!(
        violation_date: row['violation_date'],
        violation_type: row['violation_type'],
        risk_category: row['risk_category'],
        description: row['description']
      )
      
      # Log inspection and violation creation for debugging purposes
      puts "Inspection and violations added for restaurant: #{restaurant.name}"
    end

    puts "Data import complete!"
  end
end
