require 'csv'

namespace :import do
  desc "Import restaurant data from CSV"
  task restaurants: :environment do
    filepath = Rails.root.join('lib', 'sf_restaurants.csv')

    CSV.foreach(filepath, headers: true) do |row|
      restaurant = Restaurant.find_or_create_by(name: row['restaurant_name'], address: row['restaurant_address'])
      inspection = restaurant.inspections.create!(
        inspection_date: row['inspection_date'],
        score: row['score'],
        inspection_type: row['inspection_type']
      )
      inspection.violations.create!(
        violation_code: row['violation_code'],
        description: row['violation_description'],
        severity: row['violation_severity']
      )
    end

    puts "Data import complete!"
  end
end
