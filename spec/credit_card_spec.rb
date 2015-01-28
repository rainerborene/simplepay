describe CreditCard do

  describe '#valid?' do
    it 'validate credit card using Luhn 10 algorithm' do
    end

    it 'validate credit card number format' do
      credit_card = CreditCard.new(number: 20329109)
      credit_card.must_be :valid?

      credit_card.number = "dsa192039d2"
      credit_card.wont_be :valid?

      credit_card.number = 32198390893089309030983219083219083210
      credit_card.wont_be :valid?
    end
  end

end
