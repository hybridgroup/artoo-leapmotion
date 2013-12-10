require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")
require 'artoo/drivers/leapmotion'

describe Artoo::Drivers::Leapmotion::Hand do
  hand = Artoo::Drivers::Leapmotion::Hand.list(JSON.parse(frame_json))[0]

  it "extracts the palm position" do
    assert hand.palm_x.is_a?(Float)
    assert hand.palm_y.is_a?(Float)
    assert hand.palm_z.is_a?(Float)
  end

  it "extracts the rotation information" do
    assert hand.rotation.is_a?(Hash)
    assert hand.rotation[:axis].is_a?(Array)
    assert hand.rotation[:angle].is_a?(Array)
    assert hand.rotation[:matrix].is_a?(Array)
  end
end
