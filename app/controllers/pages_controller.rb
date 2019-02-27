class PagesController < ApplicationController
  def index
  end

  def secret
    authenticate_user!
  end
end
