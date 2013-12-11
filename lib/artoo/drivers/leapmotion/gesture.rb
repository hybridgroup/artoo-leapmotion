module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver
      # Recognized movement by the user
      #
      # There is 4 Gesture subclasses :
      #
      #   Circle - A circular movement by a finger.
      #   Swipe - A straight line movement by the hand with fingers extended.
      #   KeyTap -  A downward tapping movement by a finger.
      #   ScreenTap - A forward tapping movement by a finger.
      class Gesture
        class Error < StandardError; end

        # Public: Iterates through LeapMotion frame data, extracting all Hand
        # JSON into new Leapmotion::Hand objects.
        #
        # data - a LeapMotion frame that may or may not contain hand data
        #
        # Returns an array containing all Hands found in the frame
        def self.list(data)
          return [] unless data["gestures"]
          data["gestures"].map { |gesture| make_gesture gesture }
        end

        def self.make_gesture(data)
          unless data.has_key? "type"
            raise Error, "gesture type unknown"
          end

          name = data["type"][0].upcase << data["type"][1..-1]

          unless class_exists?(name)
            raise Error, "gesture class `#{self}::#{name}' invalid"
          end

          const_get(name).new(data)
        end

        def start_position
          @startPosition
        end

        def initialize(data)
          data.each do |key, value|
            instance_variable_set("@#{key}", value)
            self.class.send(
              :define_method,
              key.to_sym,
              lambda { instance_variable_get("@#{key}") }
            )
          end
        end

        private

        def self.class_exists?(class_name)
          const_get(class_name).is_a?(Class)
        rescue NameError
          false
        end

        def self.define_gesture(*names)
          names.each do |name|
            const_set name, Class.new(self) unless class_exists?(name)
          end
        end

        define_gesture :Circle, :KeyTap, :ScreenTap, :Swipe
      end
    end
  end
end
