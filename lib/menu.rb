require 'byebug'

# This class is responsible for storing a list of available dishes with prices, receiving orders, and validating them.
class Menu
  attr_reader :dish_list

  def initialize dish_list
    @dish_list = dish_list
  end

  def match_menu_to dishes
             order = dish_list.keep_if {|key, value| dishes.include?(key) }
    invalid_orders = dishes - dish_list.keys
    raise "Error: #{invalid_orders.join(", ")} is not on the menu" unless invalid_orders.empty?
    order
  end

  def receive_order(order = {})
    user_order = match_menu_to order[:dishes]
    raise "Error: incorrect price quoted" if order[:cost] != user_order.values.inject(:+)
    confirm order
  end

  def confirm order
    (Time.now + (60*60)).to_s.match(/(\d\d:\d\d)/) # gets delivery time.
    "Thank you! Your order of #{order[:dishes].join(", ")} at a cost of #{order[:cost]} has been placed and will be delivered before #{$1}."
  end

end