require_relative 'spec_helper'

describe SimplePay::Report do

  let(:card) { SimplePay::Card.new(name: 'Teste') }

  describe '.print' do
    it 'puts the name of each person followed by a colon and balance' do
      stdout = ""

      Object.stub :puts, proc {|v| stdout << v } do
        described_class.print([card])
      end

      stdout.must_equal "Teste: $0"
    end
  end

end
