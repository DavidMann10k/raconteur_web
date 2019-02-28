class PagesController < ApplicationController
  def index
  end

  def secret
    respond_to do |format|
      format.html {
        authenticate_user!
      }
      format.json {
        authenticate_user!
        render json: { response: "This is the secret sauce!" }, status: 200
      }
    end
  end
end
