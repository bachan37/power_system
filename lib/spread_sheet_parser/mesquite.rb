module SpreadSheetParser
  class Mesquite < Base
    include ::SpreadSheetParser::Task::Sheet728kw
    include ::SpreadSheetParser::Task::Sheet683Point2kw
    include ::SpreadSheetParser::Task::Sheet620Point6kw
    include ::SpreadSheetParser::Task::Sheet603Point2kw
    include ::SpreadSheetParser::Task::Sheet690Point3kw
    include ::SpreadSheetParser::Task::Sheet613Point6kw
    include ::SpreadSheetParser::Task::Sheet743Point4kw
    
    class << self
      def process(options)
        file_path = options[:file_path]
        default_sheet = options[:sheet]
        method_name = "process_#{default_sheet.downcase}"
        method_name.gsub!(" ", "")
        method_name.gsub!(".", "_point_")
        method_name = method_name.to_sym
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
