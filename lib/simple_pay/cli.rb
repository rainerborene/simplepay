module SimplePay
  class CLI
    using Extensions

    def self.start
      @db = DB.new('simplepay.db')
      @db.load! if File.exists? @db.path

      if !STDIN.tty?
        STDIN.read.split("\n").each do |line|
          process line.split(' ')
        end
      elsif ARGV.size == 1
        read_file(ARGV.first)
      elsif ARGV.size.between?(3, 4)
        process(ARGV)
      else
        error "wrong number of arguments."
      end

      @db.save!
      @db.to_txt
    end

    def self.read_file(path)
      IO.foreach(path) do |line|
        process line.split(' ')
      end
    end

    def self.process(line)
      case line.shift
      when /charge/i then @db.charge name: line[0], value: line[1].to_number rescue nil
      when /credit/i then @db.credit name: line[0], value: line[1].to_number
      when /add/i then @db.add? name: line[0], number: line[1], limit: line[2]
      else error "invalid operation."
      end
    end

    def self.error(msg)
      $stderr.puts "Error: #{msg}"
      exit 1
    end
  end
end
