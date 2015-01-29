module SimplePay
  class CLI
    using Extensions

    def self.start(args = ARGV, argc = ARGV.size)
      @db = DB.new('simplepay.db')
      @db.load! if @db.exist?

      if argc == 1
        read_file(args.first)
      elsif argc == 3 || argc == 4
        process(args)
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
      cmd = line.shift
      case cmd
      when /charge/i then @db.charge name: line[0], value: line[1].to_fixnum rescue nil
      when /credit/i then @db.credit name: line[0], value: line[1].to_fixnum
      when /add/i then @db.add name: line[0], number: line[1], limit: line[2]
      else error "invalid operation."
      end
    end

    def self.error(msg)
      $stderr.puts "Error: #{msg}"
      exit 1
    end
  end
end
