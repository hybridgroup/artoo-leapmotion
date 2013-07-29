require 'artoo/adaptors/adaptor'
require 'celluloid/websocket/client'

module Artoo
  module Adaptors
    # Connect to a leapmotion device
    # @see device documentation for more information
    class Leapmotion < Adaptor
      finalizer :finalize
      attr_reader :leap

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        #@leap = Celluloid::WebSocket::Client.new("ws://127.0.0.1:6437", current_actor)

        super
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        leap.close

        super
      end

      def on_open
        debug("websocket connection opened")
      end

      def on_message(data)
        @counter += 1
        info("message: #{data.inspect}")

        @client.close if @counter > 5
      end

      def on_close(code, reason)
        debug("websocket connection closed: #{code.inspect}, #{reason.inspect}")
      end

      # Uses method missing to call device actions
      # @see device documentation
      def method_missing(method_name, *arguments, &block)
        leap.send(method_name, *arguments, &block)
      end
    end
  end
end
