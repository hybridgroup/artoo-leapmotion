require 'artoo/drivers/leapmotion/gesture'
require 'artoo/drivers/leapmotion/pointable'
require 'artoo/drivers/leapmotion/hand'

module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver
      class Frame
        attr_reader :gestures, :pointables, :hands, :id, :timestamp, :r, :s, :t
        def initialize(data)
          @hands = Artoo::Drivers::Leapmotion::Hand.list(data)
          @gestures = Artoo::Drivers::Leapmotion::Gesture.list(data)
          @pointables = Artoo::Drivers::Leapmotion::Pointable.list(data)
          @id = data["id"]
          @timestamp = data["timestamp"]
          @r = data["r"]
          @s = data["s"]
          @t = data["t"]
        end
      end
    end
  end
end