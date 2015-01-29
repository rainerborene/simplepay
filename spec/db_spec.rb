require_relative 'spec_helper'

describe SimplePay::DB do

  subject { described_class.new tempfile.path }

  let(:tempfile) do
    Tempfile.new('db').tap {|t| t. close }
  end

  after do
    tempfile.unlink
  end

  describe '#initialize' do
    it 'pass path argument' do
      subject.path.must_equal tempfile.path
    end
  end

  describe '#save!' do
    it 'save marshalled objects to the specified path' do
      subject.save!

      file = File.open(tempfile.path)
      records = Marshal.load(file)
      records.must_equal []
      file.close
    end
  end

  describe '#load!' do
    it 'load dump file into memory' do
      subject.save!
      subject.instance_variable_set :@records, nil

      subject.load!
      subject.instance_variable_get(:@records).must_equal []
    end
  end

  describe '#add?' do
    it 'create a new credit card for a given name, card number, and limit' do
      item = ['Tom', 4111111111111111, '$1000']
      record = subject.add?(name: item[0], number: item[1], limit: item[2])
      record.name.must_equal item[0]
      record.number.must_equal item[1]
      record.limit.must_equal 1000
      record.must_be :valid?
    end
  end

  describe '#charge' do

  end

  describe '#credit' do

  end

  describe '#to_txt' do

  end

end
