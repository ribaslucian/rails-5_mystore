class Users::SessionsController < Devise::SessionsController
  def facebook_failure
    redirect_to sign_in_path
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?
    respond_to_on_destroy
  end

  def after_sign_in_path_for resource
    entities_path
  end
end
