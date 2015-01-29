module SimplePay
  class CLI
    def self.start(args = ARGV, argc = ARGV.size)
      @db = DB.new('simplepay.db')

      if argc == 1
        read_file
      elsif argc == 3 || argc == 4
        process(args)
      else
        error "wrong number of arguments."
      end
    end

    def self.read_file()
    end

    def self.process(line)
      cmd = line.shift
      case cmd
      when /add/i then @db.add(line)
      when /charge/i then @db.charge(line)
      when /credit/i then @db.credit(line)
      else error "invalid operation."
      end
    end

    def self.error(msg)
      $stderr.puts "Error: #{msg}"
      exit 1
    end
  end
end
