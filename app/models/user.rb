class User < Model
  belongs_to :entity, optional: true
  accepts_nested_attributes_for :entity

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  # buscar um usuário de redesocial, se não existir criar
  def self.find_or_create_with_omniauth auth
    # buscamos o usuario caso ja esteja cadastrado
    user = User.where({socialpage_uid: auth.uid, socialpage: auth.provider}).first

    # salvamos se o usuário ainda não existe neste recurso
    if user.nil?
      user = User.new ({
        name: auth.info.name,
        email: auth.info.email,
        # senha aleatoria que ninguem sabe
        password: Digest::SHA1.hexdigest(Random.new_seed.to_s),
        socialpage: auth.provider,
        socialpage_uid: auth.uid,
        socialpage_photo_url: auth.info.image,
        socialpage_access_token: auth.credentials.token,
        confirmed_at: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
        entity_attributes: {
          name: auth.info.name,
          emails_attributes: [{
            email: auth.info.email,
            description: "Cadastrado pelo #{auth.provider}."
          }]
        }
      })

      user.skip_confirmation!
      user.save!
    end

    user
  end
end
