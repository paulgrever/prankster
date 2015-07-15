class HomeController < ApplicationController
  def index
    message="hi"
    number = "hi"
    @messages = TwilioNotifier.new(message, number).get_messages
    @prankee = Prankee.new
  end

  def message
    number = params[:message][:number]
    message = params[:message][:body]
    TwilioNotifier.new(message, number).notify
    redirect_to root_path
  end
end
