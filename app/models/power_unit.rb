class PowerUnit < ActiveRecord::Base
  has_many :sub_units, class_name: 'PowerSubUnit', foreign_key: 'power_unit_id'

  class << self

    private

    def reset
      ActiveRecord::Base.connection.execute('truncate table power_units')
    end
  end
end
