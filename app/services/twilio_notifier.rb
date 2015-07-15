require 'twilio-ruby'

class TwilioNotifier
  def initialize(message, number)
    @number = number
    @message = message
  end

  def notify
    client.messages.create(
      from: '+1 202-759-0466',
      to: "#{@number}" ,
      body: "#{@message}"
    )
  end
  def get_messages
    client.account.messages.list({ }).each do |message| 
    end
  end

  def call 
    @call = client.account.calls.create({:to => "9991231234",
                              :from => "9991231234",
                              :url => "http://foo.com/call.xml"})
  end

  private

  def client
     @client ||= Twilio::REST::Client.new(ENV['twilio_account_sid'], ENV['twilio_auth_token'])
  end
end