class Category < Model
  has_and_belongs_to_many :products
end
