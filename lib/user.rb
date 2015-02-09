require 'twilio-ruby'

# User class is responsible for reading the menu and placing orders.
# It initializes with a phone and can relay confirmation messages to it.
class User
attr_reader :phone

  def initialize phone
    @phone = phone
  end

  def make choice, cost
    {dishes: choice, cost: cost}
  end

  def receive message
    phone.send message
  end
  
end