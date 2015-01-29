module SimplePay
  class Report
    def self.print(records)
      records.each do |record|
        puts "#{record.name}: #{record.valid?? record.amount : 'Error'}"
      end
    end
  end
end
