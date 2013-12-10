require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")
require 'artoo/drivers/leapmotion'

describe Artoo::Drivers::Leapmotion::Gesture do
  gesture = Artoo::Drivers::Leapmotion::Gesture.list(JSON.parse(frame_json))[0]

  it "extracts the gesture position" do
    assert gesture.position.is_a?(Array)
    gesture.position.each do |number|
      assert number.is_a?(Float)
    end
  end

  it "extracts the gesture direction" do
    assert gesture.direction.is_a?(Array)
    gesture.direction.each do |number|
      assert number.is_a?(Float)
    end
  end

  it "extracts the gesture's starting position" do
    assert gesture.start_position.is_a?(Array)
    gesture.start_position.each do |number|
      assert number.is_a?(Float)
    end
  end

  it "extracts the gesture type" do
    assert gesture.type.is_a?(String)
  end

  it "extracts the gesture state" do
    assert gesture.state.is_a?(String)
  end

  it "creates an instance of a Gesture subclass to the gesture type" do
    assert_equal gesture.type, 'swipe'
    assert gesture.is_a?(Artoo::Drivers::Leapmotion::Gesture::Swipe)
  end
end
