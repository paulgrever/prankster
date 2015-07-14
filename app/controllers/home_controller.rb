class HomeController < ApplicationController
  def index
  end

  def message
    number = params[:message][:number]
    message = params[:message][:body]
    TwilioNotifier.new(message, number).notify
    redirect_to root_path
  end
end
