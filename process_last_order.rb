require './lib/menu'
require './lib/user'
require './lib/phone'
require './lib/order_handler'

menu    = Menu.new(dish_list = {
              "Kimchi-jigae"   => 3,
              "Dolsotbibimbap" => 4,
              "Sundubu"        => 3
            })
phone   = Phone.new("+4407752436740")
user    = User.new(phone)
handler = OrderHandler.new

order   = handler.make_order handler.view_orders.first
puts order
message = menu.receive_order order
user.receive message
