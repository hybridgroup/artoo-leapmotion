module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver
      class Hand
        def self.list(data)
          hands = []
          if data["hands"]
            data["hands"].each do |hand|
              hands << Artoo::Drivers::Leapmotion::Hand.new(hand)
            end
          end
          return hands
        end

        def initialize(data)
          data.each do |k, v|
            instance_variable_set("@#{k}", v)
            self.class.send(:define_method, k.to_sym, lambda { instance_variable_get("@#{k}") })
          end
        end

        def palm_x
          palmPosition[0] if palmPosition
        end

        def palm_y
          palmPosition[2] if palmPosition
        end

        def palm_z
          palmPosition[1] if palmPosition
        end
      end
    end
  end
end
