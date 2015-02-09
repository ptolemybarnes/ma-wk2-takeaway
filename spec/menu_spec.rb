require './lib/menu'

describe Menu do

dish_list = {
      "Kimchi-jigae"   => 3.00,
      "Dolsotbibimbap" => 4.5,
      "Sundubu"        => 3.25
    }

let(:menu) { Menu.new(dish_list) }
  
  context 'when initialized' do
    
  end

  context 'when an order is received' do

    it 'should build the order as a hash' do
      expect(menu.match_menu_to(["Kimchi-jigae","Dolsotbibimbap"])).to eq({"Kimchi-jigae" => 3.00, "Dolsotbibimbap" => 4.50})
    end

    it 'should raise an error if the stated cost does not match the actual cost' do
      expect( lambda { menu.receive_order(dishes: ["Kimchi-jigae","Dolsotbibimbap"], cost: 7.00)}).to raise_error("Error: incorrect price quoted")
    end

    it 'should not raise an error if the stated cost matches the actual cost' do
      menu.receive_order(dishes: ["Kimchi-jigae","Dolsotbibimbap"], cost: 7.50)
    end

    it 'should raise an error if user orders items that are not on the menu' do
      expect( lambda { menu.match_menu_to(["Kimchi-jigae","Dolsotbibimbap","Pizza"])}).to raise_error("Error: Pizza is not on the menu")
    end

    it 'should return a message saying that the order has been placed and when it will be delivered by' do
      (Time.now + (60*60)).to_s.match(/(\d\d:\d\d)/)
      order         = {dishes: ["Kimchi-jigae","Dolsotbibimbap"], cost: 7.0 }
      expect(menu.confirm(order)).to eq("Thank you! Your order of Kimchi-jigae, Dolsotbibimbap at a cost of 7.0 has been placed and will be delivered before #{$1}.")
    end

  end
end