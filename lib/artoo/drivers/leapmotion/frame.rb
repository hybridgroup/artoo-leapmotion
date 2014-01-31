require 'artoo/drivers/leapmotion/gesture'
require 'artoo/drivers/leapmotion/pointable'
require 'artoo/drivers/leapmotion/hand'

module Artoo
  module Drivers
    class Leapmotion < Driver
      class Frame
        attr_reader :id, :timestamp, :raw, :gestures, :hands, :pointables,
                    :rotation, :scale_factor, :translation

        # Public: initialize
        #
        # frame - params
        #
        # Returns nil 
        def initialize(frame)
          @id = frame["id"]
          @timestamp = frame["timestamp"]
          @raw = frame

          @hands = Artoo::Drivers::Leapmotion::Hand.list(frame)
          @gestures = Artoo::Drivers::Leapmotion::Gesture.list(frame)
          @pointables = Artoo::Drivers::Leapmotion::Pointable.list(frame)

          @rotation = {
            axis: frame['r'][0],
            angle: frame['r'][1],
            matrix: frame['r'][2]
          }

          @scale_factor = frame["s"]
          @translation = frame["t"]
        end
      end
    end
  end
end
