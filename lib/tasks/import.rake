namespace :import do
  desc "import the data from 728k sheet of mesquite"

  task :data_728kw => :environment do
    file_path = File.join(Rails.root, "/public/power_log/#{Rails.env}/Mesquite\ Total\ Production\ Analysis\ v2.xlsx")
    sheet = "728kW"

    SpreadSheetParser::Mesquite.process(file_path: file_path, sheet: sheet)
  end
end
