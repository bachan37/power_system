namespace :import do
  desc "import the data from 728k sheet of mesquite"

  task :data => :environment do
    PowerUnit.send(:reset)
    PowerSubUnit.send(:reset)
    Measurement.send(:reset)
    file_path = File.join(Rails.root, "/public/power_log/#{Rails.env}/Mesquite\ Total\ Production\ Analysis\ v2.xlsx")
    sheets = ["728kW", "683.2kW", "620.6kW", "603.2kW", "690.3 kW", "613.6 kW", "743.4 kW"]

    sheets.each do |sheet|
      puts "Processing #{sheet}"
      SpreadSheetParser::Mesquite.process(file_path: file_path, sheet: sheet)
    end
  end
  
  task :data_728kw => :environment do
    file_path = File.join(Rails.root, "/public/power_log/#{Rails.env}/Mesquite\ Total\ Production\ Analysis\ v2.xlsx")
    sheet = "728kW"

    SpreadSheetParser::Mesquite.process(file_path: file_path, sheet: sheet)
  end

  task :data_683_2kw => :environment do
    file_path = File.join(Rails.root, "/public/power_log/#{Rails.env}/Mesquite\ Total\ Production\ Analysis\ v2.xlsx")
    sheet = "683.2kW"

    SpreadSheetParser::Mesquite.process(file_path: file_path, sheet: sheet)
  end

  task :data_620_6kw => :environment do
    file_path = File.join(Rails.root, "/public/power_log/#{Rails.env}/Mesquite\ Total\ Production\ Analysis\ v2.xlsx")
    sheet = "620.6kW"

    SpreadSheetParser::Mesquite.process(file_path: file_path, sheet: sheet)
  end
end
