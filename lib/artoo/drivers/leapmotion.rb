require 'artoo/drivers/driver'

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
        debug("websocket connection opened")
        publish(event_topic_name("open"))
      end

      def on_message(data)
        info("message: #{data.inspect}")
        publish(event_topic_name("message"), data)
      end

      def on_close(code, reason)
        debug("websocket connection closed: #{code.inspect}, #{reason.inspect}")
        publish(event_topic_name("close"), code, reason)
      end
    end
  end
end
