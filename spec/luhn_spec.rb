require_relative 'spec_helper'

describe SimplePay::Luhn do

  VALID_CREDIT_CARDS.each do |card_number|
    it "valid #{card_number} number" do
      valid?(card_number).must_equal true
    end
  end

  INVALID_CREDIT_CARDS.each do |card_number|
    it "#{card_number} is invalid" do
      valid?(card_number).wont_equal true
    end
  end

  private

  def valid?(card_number)
    SimplePay::Luhn.valid?(card_number)
  end
end
