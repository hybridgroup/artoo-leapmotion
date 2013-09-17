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

def on_hand(*args)
  hand = args[1]
  puts "#{scale_to_servo(hand.palm_x, -200, 200)},#{scale_to_servo(hand.palm_y, -130, 130)}" if hand
end

def on_close(*args)
  puts args
end

def scale_to_servo(val, min, max)
  (((val - min) / (max - min)) * 180).ceil
end
