require 'twilio-ruby'

# Phone class is responsible for sending order confirmation messages to a real phone number.
class Phone
  attr_reader :number
  
  def initialize(phone_number)
    @number = phone_number
    @client = Twilio::REST::Client.new ENV['TWILIOSID'], ENV['TWILIOAUTH']
  end

  def send message
    message = @client.account.messages.create(
        :body => message,
        :to => @number,
        :from => ENV['TWILIONUM'])
    puts message.sid
  end

  

end