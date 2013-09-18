require 'artoo'

connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
device :leapmotion, :driver => :leapmotion
  
work do
  on leapmotion, :open => :on_open
  on leapmotion, :hand => :on_hand
  on leapmotion, :close => :on_close
end

def on_open(*args)
  puts args
end

def on_hand(sender, hand)
  puts "#{hand.palm_x},#{hand.palm_y},#{hand.palm_z}" if hand
end

def on_close(*args)
  puts args
end
