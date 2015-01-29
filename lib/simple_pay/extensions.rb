module SimplePay
  module Extensions
    refine String do
      def to_fixnum
        gsub(/\D/, '').to_i
      end
    end
  end
end
