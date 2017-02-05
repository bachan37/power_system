module SpreadSheetParser
  class Mesquite < Base
    include ::SpreadSheetParser::Task::Sheet728kw
    
    class << self
      def process(options)
        file_path = options[:file_path]
        default_sheet = options[:sheet]
        method_name = "process_#{default_sheet.gsub(" ", "_").downcase.to_sym}".to_sym
        if self.instance_methods.include?(method_name)
          object = self.new({
                              file_path: file_path,
                              default_sheet: default_sheet
                            })
          
          object.send(method_name)
        else
          puts "We don't have logic to process this sheet(#{default_sheet})"
        end
      end
    end
  end
end
