module SimplePay
  class DB
    attr_reader :path

    def initialize(path)
      @path = path
      @records = []
    end

    def save!
      File.open(path, 'w') do |f|
        f.write Marshal.dump(@records)
      end
    end

    def exist?
      File.exists? path
    end

    def load!
      file = File.open(path)
      @records = Marshal.load(file)
      file.close
    end

    def add(name:, number:, limit:)
      Card.new({ name: name, number: number, limit: limit }).tap do |card|
        @records << card
      end
    end

    def charge(name:, value:)
      find_by_name name do |card|
        card.charge value
      end
    end

    def credit(name:, value:)
      find_by_name name do |card|
        card.credit value
      end
    end

    def to_txt
      Report.print(@records)
    end

    private

    def find_by_name name, &block
      @records.find {|r| r.name.eql? name }.tap do |record|
        block.call(record) unless record.nil?
      end
    end
  end
end
