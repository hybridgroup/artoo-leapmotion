module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver
      class Pointable
        # Public: Iterates through LeapMotion frame data, extracting all Hand
        # JSON into new Leapmotion::Hand objects.
        #
        # data - a LeapMotion frame that may or may not contain hand data
        #
        # Returns an array containing all Hands found in the frame
        def self.list(data)
          return [] unless data["pointables"]
          data["pointables"].map do |pointable|
            Artoo::Drivers::Leapmotion::Pointable.new(pointable)
          end
        end

        # Public: initialize
        #
        # data - params
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

        # Public: Touch zone
        #
        # Returns nil 
        def touch_zone
          @touchZone
        end

        # Public: tip position
        #
        # Returns nil 
        def tip_position
          @tipPosition
        end
      end
    end
  end
end
