module SimplePay
  class CLI
    def self.start(args = ARGV, argc = ARGV.size)
      @db = DB.new('simplepay.db')
      @db.load! if @db.exist?

      if argc == 1
        read_file
      elsif argc == 3 || argc == 4
        process(args)
      else
        error "wrong number of arguments."
      end

      @db.save!
      @db.to_txt
    end

    def self.read_file()
    end

    def self.process(line)
      cmd = line.shift
      case cmd
      when /charge/i then @db.charge name: line[0], value: line[1].to_i
      when /credit/i then @db.credit name: line[0], value: line[1].to_i
      when /add/i then @db.add name: line[0], number: line[1], value: line[2]
      else error "invalid operation."
      end
    end

    def self.error(msg)
      $stderr.puts "Error: #{msg}"
      exit 1
    end
  end
end
