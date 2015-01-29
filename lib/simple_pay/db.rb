module SimplePay
  class DB
    attr_reader :path, :records

    def initialize(path)
      @path = path
      @records = []
    end

    def save!
      File.open(path, 'w') do |f|
        f.write Marshal.dump(@records)
      end
    end

    def load!
      file = File.open(path)
      @records = Marshal.load(file)
      file.close
    end

    def add(attrs)
      record = Card.new({ name: attrs[0], number: attrs[1], limit: attrs[2] })
      @records.push(record)
      record
    end

    def charge(attrs)
    end

    def credit(attrs)
    end
  end
end
