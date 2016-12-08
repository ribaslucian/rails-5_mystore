class Users::RegistrationsController < Devise::RegistrationsController

  def facebook_create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_omniauth auth
    sign_in 'user', user
    redirect_to entities_path
  end

  # POST /resource
  def create
    params = sign_up_params;

    # montamos a Entidade repectiva ao usuario
    params = {
        email: params['email'],
        password: params['password'],
        password_confirmation: params['password_confirmation'],
        entity_attributes: {
          emails_attributes: [{
            priority: 1,
            email: params['email'],
            description: 'Cadastrado pelo Site'
          }]
        }
    }

    build_resource(params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
