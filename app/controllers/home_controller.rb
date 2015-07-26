class HomeController < ApplicationController
  def index
    @prankees = Prankee.all

    @messages = TwilioNotifier.new("message", "number", "from").get_messages
    @prankee = Prankee.new
  end

  def message
    from = params[:message][:from_number]
    prankee_number = Prankee.find(params[:message][:number][:id].to_i).phone_number
    message = params[:message][:body]
    TwilioNotifier.new(message, prankee_number, from).notify
    redirect_to root_path
  end
end
