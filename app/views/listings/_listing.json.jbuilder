json.extract! listing, :id, :title, :description, :equipment, :model, :length, :beam, :draft, :displacement, :year, :cabins, :berths, :engine, :fuel, :hours, :horsepower, :location, :zip_code, :public_name, :email, :phone_number, :published, :created_at, :updated_at
json.url listing_url(listing, format: :json)
