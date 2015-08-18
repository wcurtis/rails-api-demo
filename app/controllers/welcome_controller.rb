class WelcomeController < ApplicationController
  def index
    render json: { message: "Wohoo!" }
  end
end
