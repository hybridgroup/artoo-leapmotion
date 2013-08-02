# Artoo Adaptor For Leap Motion

This repository contains the Artoo (http://artoo.io/) adaptor for the Leap Motion controller (https://www.leapmotion.com/). 

It borrows code from https://github.com/glejeune/ruby-leap-motion-ws, thanks @glejeune

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-leapmotion.png)](https://codeclimate.com/github/hybridgroup/artoo-leapmotion) [![Build Status](https://travis-ci.org/hybridgroup/artoo-leapmotion.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-leapmotion)

## Installing

```
gem install artoo-leapmotion --pre
```

## Using

```ruby
require 'artoo'

connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
device :leapmotion, :driver => :leapmotion
  
work do
  on leapmotion, :open => :on_open
  on leapmotion, :frame => :on_frame
  on leapmotion, :close => :on_close
end

def on_open(*args)
  puts args
end

def on_frame(*args)
  frame = args[1]
  puts frame
  puts frame.hands
  puts frame.gestures
  puts frame.pointables
end

def on_close(*args)
  puts args
end
```

## Connecting to Leap Motion

### OSX

The normal OSX download of the Leap Motion software from https://www.leapmotion.com/setup should work with Artoo.

More instructions need to go here...

### Ubuntu

The Linux download of the Leap Motion software can be obtained from https://developer.leapmotion.com/downloads (requires free signup)

The main steps are:
- Connect your computer and the Leap Motion controller
- Connect to the device via Artoo

You will need to run the `leapd` daemon in order to connect your Artoo code to your Leap Motion controller.

```
$ leapd
```

Once your computer is communcating with the Leap Motion controller, the `leapd` program exposes a websocket-based interface to receive data.

### Windows

The normal Windows download of the Leap Motion software from https://www.leapmotion.com/setup should work with Artoo.

More instructions need to go here...
