class RandomString < ActiveRecord::Base
  
  def self.to_csv
    CSV.generate do |csv|
      csv << ['Random Value', 'Date Generated']
      
      all.each do |random_string|
        csv << [random_string.random_value, random_string.created_at]
      end
    end
  end
  
  def self.to_xls
    p = Axlsx::Package.new
    p.workbook.add_worksheet(name: 'Random Values') do |sheet|
      sheet.add_row ["Random Value", "Date Generated"]
      
      all.each do |random_string|
        sheet.add_row [random_string.random_value, random_string.created_at]
      end
    end
    
    p.serialize('tmp/random.xls')
    'tmp/random.xls'
  end
end
