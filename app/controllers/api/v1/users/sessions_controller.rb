# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  include Devise::Controllers::Helpers
  skip_before_action :verify_authenticity_token
  prepend_before_action :require_no_authentication, only: [:create]

  def new
    render json: { response: "Authentication required" }, status: 401
  end

  # POST /resource/sign_in
  def create
    puts "auth_options: " + auth_options.inspect
    self.resource = warden.authenticate!(auth_options)
    puts "resource_name: " + resource_name.inspect
    puts "resource: " + resource.inspect
    sign_in(resource_name, resource)
    yield resource if block_given?
     render json: {success: true, jwt: request.env['warden-jwt_auth.token'], response: "Authentication successful" }
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
