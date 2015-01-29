module SimplePay
  class CardError < StandardError
  end

  class Card
    attr_accessor :name, :number, :balance, :limit

    def initialize(attributes={})
      attributes.each do |key, value|
        method_name = "#{key}="
        send(method_name, value) if respond_to? method_name
      end
      @balance ||= 0
    end

    def amount
      "$#{balance.round}"
    end

    def charge(value)
      if @balance + value > limit
        raise CardError.new("charge declined")
      end

      @balance += value
    end

    def credit(value)
      @balance -= value
    end

    def valid?
      !number.to_s.match(/^\d{,19}$/).nil? && Luhn.valid?(number)
    end
  end
end
