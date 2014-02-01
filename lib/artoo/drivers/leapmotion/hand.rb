module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver
      class Hand
        # Public: Iterates through LeapMotion frame data, extracting all Hand
        # JSON into new Leapmotion::Hand objects.
        #
        # data - a LeapMotion frame that may or may not contain hand data
        #
        # Returns an array containing all Hands found in the frame
        def self.list(data)
          return [] unless data["hands"]
          data["hands"].map { |hand| Artoo::Drivers::Leapmotion::Hand.new hand }
        end
        # Public: initialize
        #
        # frame - params
        #
        # Returns nil 
        def initialize(data)
          data.each do |key, value|
            instance_variable_set "@#{key}", value
            self.class.send(
              :define_method,
              key.to_sym,
              lambda { instance_variable_get("@#{key}") }
            )
          end
        end

        # Public: Palm x position
        #
        # Returns nil 
        def palm_x
          palmPosition[0] if palmPosition
        end

        # Public: Palm y position
        #
        # Returns nil 
        def palm_y
          palmPosition[2] if palmPosition
        end

        # Public: Palm z position
        #
        # Returns nil 
        def palm_z
          palmPosition[1] if palmPosition
        end

        # Public: Rotation
        #
        # Returns nil 
        def rotation
          {
            axis: @r[0],
            angle: @r[1],
            matrix: @r[2]
          }
        end
      end
    end
  end
end
