class Entity < Model
  has_one :person, dependent: :destroy
  has_one :corporate, dependent: :destroy
  has_one :user, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :phones, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :person, :corporate, :user, :addresses, :emails,
                                :phones, allow_destroy: true

  # default_scope { order('name') }
end
