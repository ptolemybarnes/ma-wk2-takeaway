require './lib/user'

describe User do

let(:phone) {double(:phone, number: "+4407752436740", send: 'Message sent to phone')}
let(:user) { User.new(phone) }
let(:menu) { double(:menu, dish_list: {
      "Kimchi-jigae"   => 3.00,
      "Dolsotbibimbap" => 4.50,
      "Sundubu"        => 3.25
    })}

  
  context 'when initialized' do
    it 'should have a mobile phone number' do
      expect(user.phone.number).to eq("+4407752436740")
    end
  end

  context 'can choose some dishes' do
    it 'should make a hash with choices and the total cost' do
      expect(user.make(["Kimchi-jigae", "Sundubu"], 6.25)).to eq({dishes: ["Kimchi-jigae", "Sundubu"], cost: 6.25})
    end
  end

  context 'should receive a message and send it to the mobile phone number' do
    it 'should return a confirmation that message was sent' do
      time    = (Time.now + (60*60)).to_s.match(/(\d\d:\d\d)/)
      message = "Thank you! Your order was placed and will be delivered before #{time}."
      expect(user.receive message).to eq('Message sent to phone')
    end
  end

end