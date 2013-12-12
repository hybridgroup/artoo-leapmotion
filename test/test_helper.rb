require 'artoo/robot'

require 'minitest/autorun'
require 'mocha/setup'

Celluloid.logger = nil

MiniTest::Spec.before do
  Celluloid.shutdown
  Celluloid.boot
end

def frame_json
  @frame_json ||= begin
    File.read File.join(File.dirname(__FILE__), "./support/frame.json")
  end
end
