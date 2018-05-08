class PingController < ApplicationController
  def index
    render json: {"PONG" => "Yay it works!"}
  end
end