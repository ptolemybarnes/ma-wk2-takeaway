require 'twilio-ruby'

class OrderHandler

  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIOSID'], ENV['TWILIOAUTH']
  end
 
  def view_orders
    @client.account.messages.list({
      :to => ENV['TWILIONUM']}).map do |message|
      message.body
    end
  end

  def make_order order_string
    order = order_string.split
    dishes, price = order[0..-2], order.last.to_i
    {dishes: dishes, cost: price}
  end

end