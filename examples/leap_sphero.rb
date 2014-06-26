require 'artoo'

connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
device     :leapmotion, :driver  => :leapmotion

connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-YBW-RN-SPP'
device     :sphero, :driver  => :sphero

work do
	
	on leapmotion, :hand => :on_hand

	every (0.1) do
		puts "speed :#{speed}, heading :#{heading}"
		sphero.roll speed, heading
	end

end


def on_hand(sender, hand)
	x = hand.palm_x
	y = hand.palm_y

	@speed   = [x.abs, y.abs].max
	@heading = ( 180.0 - ( Math.atan2(x,y) * (180.0 / Math::PI) ) )
end

def speed
	@speed || 0
end

def heading
	@heading || 0
end
