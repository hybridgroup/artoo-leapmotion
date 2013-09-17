require 'artoo/drivers/driver'
require 'artoo/drivers/leapmotion/frame'
require 'json'

module Artoo
  module Drivers
    # The leapmotion driver behaviors
    class Leapmotion < Driver

      # Start driver and any required connections
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

      def on_open
        publish(event_topic_name("open"))
        data = JSON.dump("enableGestures" => true)
        connection.text(data)
      end

      def on_message(data)
        message = JSON.parse(data)
        if message.key?("id") and message.key?("timestamp")
          frame = Artoo::Drivers::Leapmotion::Frame.new(message)
          publish(event_topic_name("frame"), frame)

          frame.hands.each {|h| publish(event_topic_name("hand"), h)}
          frame.gestures.each {|g| publish(event_topic_name("gesture"), g)}
          frame.pointables.each {|p| publish(event_topic_name("pointable"), p)}
        else
          publish(event_topic_name("error"), data)
        end
      rescue Exception => e
        publish(event_topic_name("error"), data)
      end

      def on_close(code, reason)
        publish(event_topic_name("close"), code, reason)
      end
    end
  end
end
