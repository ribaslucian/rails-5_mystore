class Image < Model
  include Paperclip::Glue

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/assets/original/generic_product.png'

  # has_attached_file :image,
  #   :path => ":rails_root/public/images/:id/:filename",
  #   :url  => "/images/:id/:filename"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/,
  :reject_if => lambda { |t| t['avatar'].nil? }

end
