class Product < Model
  has_and_belongs_to_many :categories

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
