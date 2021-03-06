# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # no authenticity token in API
  skip_before_action :verify_authenticity_token

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
