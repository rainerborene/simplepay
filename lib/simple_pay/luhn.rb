module SimplePay
  module Luhn extend self
    def valid?(card_number)
      number = card_number.to_s.each_char.map(&:to_i).reverse
      total = number.each_with_index.inject(0) do |sum, (value, index)|
        value *= 2 if index.odd?
        value = 1 + (value - 10) if value >= 10
        sum + value
      end
      (total % 10).zero?
    end
  end
end
