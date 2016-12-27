# json.extract! @entity, :id, :name, :is_juridic, include: [:person, :emails, :phones, :addresses]
# json.url entity_url(entity, format: :json)
# @entity.to_json(include: [:person, :emails, :phones, :addresses])

if @entity.is_juridic
  json.(@entity, :id, :name, :is_juridic, :corporate, :emails, :addresses, :phones)
else
  json.(@entity, :id, :name, :is_juridic, :person, :emails, :addresses, :phones)
end
