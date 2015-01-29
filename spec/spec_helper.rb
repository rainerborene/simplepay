$:.unshift File.expand_path("../../lib", __FILE__)
require 'tempfile'
require 'minitest/spec'
require 'minitest/autorun'
require 'simple_pay'

VALID_CREDIT_CARDS = [79927398713, "79927398713", 4111111111111111, 5454545454545454]

INVALID_CREDIT_CARDS = [1234567890123456]

class MiniTest::Spec
  def described_class
    @described_class ||= self.class.ancestors.select {|c| c.respond_to? :desc }[-2].desc
  end
end
