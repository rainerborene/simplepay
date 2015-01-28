module SimplePay
  class CreditCard
    attr_accessor :name, :number, :balance

    def initialize(attributes={})
      attributes.each do |key, value|
        method_name = "#{key}="
        send(method_name, value) if respond_to? method_name
      end
    end

    def valid?
      number.to_s.match(/^\d{,19}$/) && Luhn.valid?(number)
    end
  end
end
