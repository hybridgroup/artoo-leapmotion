require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")
require 'artoo/drivers/leapmotion'

describe Artoo::Drivers::Leapmotion::Frame do
  frame = Artoo::Drivers::Leapmotion::Frame.new JSON.parse(frame_json)

  it "extracts the frame's ID" do
    assert frame.id.is_a?(Integer)
    assert_equal frame.id, 99943
  end

  it "extracts the frame's timestamp" do
    assert frame.timestamp.is_a?(Integer)
    assert_equal frame.timestamp, 4729292670
  end

  it "stores the raw frame data" do
    assert_equal frame.raw, JSON.parse(frame_json)
  end

  it "extracts rotation data from the frame" do
    assert frame.rotation.is_a?(Hash)
    assert frame.rotation[:axis].is_a?(Array)
    assert frame.rotation[:angle].is_a?(Array)
    assert frame.rotation[:matrix].is_a?(Array)
  end

  it "extracts scale factor data from the frame" do
    assert frame.scale_factor.is_a?(Float)
  end

  it "extracts translation factor data from the frame" do
    assert frame.translation.is_a?(Array)
  end

  it "stores the detected hands in an array" do
    assert frame.hands.is_a?(Array)
  end

  it "stores the detected gestures in an array" do
    assert frame.gestures.is_a?(Array)
  end

  it "stores the detected pointables in an array" do
    assert frame.pointables.is_a?(Array)
  end
end
