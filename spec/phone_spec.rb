require './lib/phone'

describe Phone do

  let(:phone) {Phone.new("+4407752436740")}

  context 'when initialized' do

    it 'has a phone number' do
      expect(phone.number).to eq("+4407752436740")
    end
  end
end