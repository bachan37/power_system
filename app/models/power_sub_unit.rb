class PowerSubUnit < ActiveRecord::Base
  belongs_to :power_unit

  class << self

    private

    def reset
      ActiveRecord::Base.connection.execute('truncate table power_sub_units')
    end
  end
end
