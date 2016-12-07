class Person < Model
  belongs_to :entity, optional: true
  accepts_nested_attributes_for :entity, allow_destroy: true
end
