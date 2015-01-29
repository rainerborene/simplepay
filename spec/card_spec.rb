require_relative 'spec_helper'

describe SimplePay::Card do

  subject { described_class.new limit: 100 }

  describe '#valid?' do
    it 'validate credit card format' do
      credit_card = described_class.new(number: VALID_CREDIT_CARDS.sample)
      credit_card.must_be :valid?

      credit_card.number = "dsa192039d2"
      credit_card.wont_be :valid?

      credit_card.number = 32198390893089309030983219083219083210
      credit_card.wont_be :valid?
    end
  end

  describe '#amount' do
    it 'prefix balance with "$" and no decimals' do
      subject.balance = 50.21
      subject.amount.must_equal "$#{subject.balance.round}"
    end
  end

  describe '#balance' do
    it 'start with a $0 balance' do
      subject.balance.must_equal 0
    end
  end

  describe '#charge' do
    it 'increase the balance' do
      subject.charge(100)
      subject.balance.must_equal 100
    end

    it 'ignore raise over the limit' do
      subject.charge(50)
      subject.balance.must_equal 50

      proc { subject.charge(60) }.must_raise SimplePay::CardError
      subject.balance.must_equal 50
    end
  end

  describe '#credit' do
    it 'decrease the balance' do
      subject.credit(50)
      subject.balance.must_equal(-50)
    end
  end

end
