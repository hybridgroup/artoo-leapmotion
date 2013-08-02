require File.expand_path(File.dirname(__FILE__) + "/../test_helper")
require 'artoo/drivers/leapmotion'

def valid_frame
  {
    id: '123',
    timestamp: '123456789'
  }
end

describe Artoo::Drivers::Leapmotion do
  before do
    @device = mock('device')
    @driver = Artoo::Drivers::Leapmotion.new(:parent => @device)
    @connection = mock('connection')
    @device.stubs(:connection).returns(@connection)
    @frame = mock('frame')
    @frame.stubs(:gestures).returns([])
    Artoo::Drivers::Leapmotion::Frame.stubs(:new).returns(@frame)
  end

  it 'Leapmotion#on_open' do
    @device.expects(:event_topic_name).with("open").returns("hi_open")
    @connection.expects(:text)
    @driver.on_open
  end

  it 'Leapmotion#on_message with a frame but no gesture' do
    @device.expects(:event_topic_name).with("frame")
    @device.expects(:event_topic_name).with("gesture").never
    @driver.on_message(JSON.dump(valid_frame))
  end

  it 'Leapmotion#on_message with a gesture' do
    @device.expects(:event_topic_name).with("frame")
    @device.expects(:event_topic_name).with("gesture")
    @frame.stubs(:gestures).returns(['123'])
    @driver.on_message(JSON.dump(valid_frame))
  end

  it 'Leapmotion#error' do
    @device.expects(:event_topic_name).with("error")
    @driver.on_message("no good")
  end

  it 'Leapmotion#on_close' do
    @device.expects(:event_topic_name).with("close").returns("hi_bye")
    @driver.on_close(2, "huh")
  end
end
