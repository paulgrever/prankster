class HomeController < ApplicationController
  def index
    @prankees = Prankee.all
    message="hi"
    number = "hi"

    @messages = TwilioNotifier.new(message, number).get_messages
    @prankee = Prankee.new
  end

  def message
    number = Prankee.find(params[:message][:number][:id].to_i).phone_number
    message = params[:message][:body]
    TwilioNotifier.new(message, number).notify
    redirect_to root_path
  end
end
