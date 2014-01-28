require 'artoo/drivers/driver'
require 'artoo/drivers/leapmotion/frame'
require 'json'

module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver

      # Start driver and any required connections

      # Public: Starts the driver
      #
      # Returns nil 
      def start_driver
        begin
          connection.handler = current_actor
          connection.start

          super
        rescue Exception => e
          Logger.error "Error starting Leapmotion driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      # Public: On open
      #
      # Returns nil 
      def on_open
        publish(event_topic_name("open"))
        data = JSON.dump("enableGestures" => true)
        connection.text(data)
      end

      # Public: On message
      #
      # data - params
      #
      # Returns nil 
      def on_message(data)
        message = JSON.parse(data)
        if message.key?("id") and message.key?("timestamp")
          frame = Artoo::Drivers::Leapmotion::Frame.new(message)
          publish(event_topic_name("frame"), frame)

          frame.hands.each {|h| publish(event_topic_name("hand"), h)} if frame.hands
          frame.gestures.each {|g| publish(event_topic_name("gesture"), g)} if frame.gestures
          frame.pointables.each {|p| publish(event_topic_name("pointable"), p)} if frame.pointables
        else
          publish(event_topic_name("error"), data)
        end
      rescue Exception => e
        publish(event_topic_name("error"), data)
      end

      # Public: On close
      #
      # code - params
      # reason - params
      #
      # Returns nil 
      def on_close(code, reason)
        publish(event_topic_name("close"), code, reason)
      end
    end
  end
end
