module SpreadSheetParser
  class Base
    attr_accessor :xlsx, :process_block
    
    def initialize(options)
      @xlsx = Roo::Spreadsheet.open(options[:file_path])
      @xlsx.default_sheet = options[:default_sheet]
    end

    def process
      if block_given?
        yield(self.xlsx)  
      else  
        puts "nothing to process."  
      end  
    end  
  end
end
