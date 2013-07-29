require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/leapmotion'

describe Artoo::Drivers::Leapmotion do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::Leapmotion.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
  end

  it 'Leapmotion#on_open' do
    @device.expects(:event_topic_name).with("open").returns("hi_open")
    @driver.on_open
  end

  it 'Leapmotion#on_message' do
    @device.expects(:event_topic_name).with("message").returns("hi_message")
    @driver.on_message("hello")
  end

  it 'Leapmotion#on_close' do
    @device.expects(:event_topic_name).with("close").returns("hi_bye")
    @driver.on_close(2, "huh")
  end
end
