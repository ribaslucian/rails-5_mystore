json.extract! entity, :id, :name, :documentation, :person, :corporate, :user, :emails, :addresses, :phones, :images, :created_at, :updated_at
json.url entity_url(entity, format: :json)