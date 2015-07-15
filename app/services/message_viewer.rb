require 'twilio-ruby'

class MessageViewer
  def initialize
  end

  def get_messages
    messages = @client.account.messages.get('SMcff82de7dd8e4003bd5c8991954734d6') 
  end


  private

  def client
     @client ||= Twilio::REST::Client.new(ENV['twilio_account_sid'], ENV['twilio_auth_token'])
  end
end