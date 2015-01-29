module SimplePay
  class CardError < StandardError
  end

  class Card
    attr_accessor :name
    attr_reader :number, :balance, :limit

    def initialize(attributes={})
      attributes.each do |key, value|
        method_name = "#{key}="
        send(method_name, value) if respond_to? method_name
      end
      @balance ||= 0
    end

    def amount
      "$#{balance}"
    end

    def charge(value)
      raise CardError.new("charge declined") if @balance + value > limit

      @balance += value
    end

    def credit(value)
      @balance -= value
    end

    def valid?
      !number.to_s.match(/^\d{,19}$/).nil? && Luhn.valid?(number)
    end

    # type cast writer methods
    %i(number balance limit).each do |name|
      define_method("#{name}=") do |value|
        value = value.to_s.gsub(/\D/, '').to_i unless value.is_a? Fixnum
        instance_variable_set(:"@#{name}", value)
      end
    end
  end
end
