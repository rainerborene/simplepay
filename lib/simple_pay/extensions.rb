module SimplePay
  module Extensions
    refine String do
      def to_number
        gsub(/\D/, '').to_i
      end
    end
  end
end
