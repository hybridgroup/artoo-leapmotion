require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")
require 'artoo/drivers/leapmotion'

describe Artoo::Drivers::Leapmotion::Pointable do
  frame = JSON.parse frame_json
  pointable = Artoo::Drivers::Leapmotion::Pointable.list(frame)[0]

  it "extracts the length of the pointable" do
    assert pointable.length.is_a?(Float)
  end

  it "extracts the position of the tip of the pointable" do
    assert pointable.tip_position.is_a?(Array)
    for number in pointable.tip_position
      assert number.is_a?(Float)
    end
  end

  it "extracts the pointable's touch zone" do
    assert pointable.touch_zone.is_a?(String)
  end

  it "extracts whether or not the pointable is a tool" do
    assert [true, false].include?(pointable.tool)
  end
end
