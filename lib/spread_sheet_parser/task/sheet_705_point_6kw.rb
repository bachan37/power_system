module SpreadSheetParser
  module Task
    module Sheet705Point6kw
      def self.included(base)
        base.include InstanceMethods
      end

      module InstanceMethods
        def process_705_point_6kw
          self.process do |xlsx|
            power_unit = PowerUnit.create(unit: '705.6kW')
            power_unit_row_number = 2
            power_sub_unit_row_number = power_unit_row_number + 1
            power_sub_unit_start_row_number = power_sub_unit_row_number + 1

            power_unit_row = xlsx.row(power_unit_row_number)
            power_sub_unit_row = xlsx.row(power_sub_unit_row_number)
            
            power_unit_items = power_unit_row.compact
            total_rows = xlsx.last_row

            double_units = ["078", "080", "082"]
            power_unit_items.each do |power_unit_item|
              power_sub_unit = power_unit.sub_units.create(unit: power_unit_item)

              (power_sub_unit_start_row_number..total_rows).to_a.each do |row_index|
                row = xlsx.row(row_index)
                index = power_unit_row.index(power_unit_item)
                sub_unit_measurement = power_sub_unit.measurements.new
                sub_unit_measurement.start_date = row[0]
                sub_unit_measurement.end_date = row[1]
                sub_unit_measurement.insolation = row[2]
                
                if double_units.include?(power_unit_item)
                  first_column_name = "unit_#{power_sub_unit_row[index].strip.downcase}"
                  sub_unit_measurement.send("#{first_column_name}=", row[index]) if row[index].to_f > 0
                  second_column_name = "unit_#{power_sub_unit_row[index + 1].strip.downcase}"
                  sub_unit_measurement.send("#{second_column_name}=", row[index + 1])
                else
                  first_column_name = "unit_#{power_sub_unit_row[index].downcase}"
                  sub_unit_measurement.send("#{first_column_name}=", row[index])
                  second_index = index + 1
                  second_column_name = "unit_#{power_sub_unit_row[second_index].downcase}"
                  sub_unit_measurement.send("#{second_column_name}=", row[second_index])
                  third_index = index + 2
                  third_column_name = "unit_#{power_sub_unit_row[third_index].downcase}"
                  sub_unit_measurement.send("#{third_column_name}=", row[third_index])
                  fourth_index = index + 1
                  fourth_column_name = "unit_#{power_sub_unit_row[fourth_index].downcase}"
                  sub_unit_measurement.send("#{fourth_column_name}=", row[fourth_index]) 
                end

                sub_unit_measurement.save
              end
            end
          end
        end
      end
    end    
  end
end
