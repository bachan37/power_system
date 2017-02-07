class Measurement < ActiveRecord::Base
  belongs_to :power_sub_unit

  class << self

    private

    def reset
      ActiveRecord::Base.connection.execute('truncate table measurements')
    end
  end
end
