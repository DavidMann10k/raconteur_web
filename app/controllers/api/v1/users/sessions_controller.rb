# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  prepend_before_action :require_no_authentication, only: [:create]
  skip_before_action :verify_signed_out_user, only: [:destroy]
  respond_to :json

  def destroy
    authenticate_user!
    puts "LOG OUT"
    super
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
