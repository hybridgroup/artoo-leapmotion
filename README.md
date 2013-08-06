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

This driver works out of the box with the vanilla installation of the Leap Motion Software that you get in their [Setup Guide](https://www.leapmotion.com/setup ).

The main steps are:

- Run `Leap Motion.app`
- Connect your Computer and Leap Motion Controller.
- Connect to the device via Artoo.

### Ubuntu

The Linux download of the Leap Motion software can be obtained from [Leap Motion Dev Center](https://developer.leapmotion.com/downloads) (requires free signup)

The main steps are:

- Run the `leapd` daemon.
- Connect your computer and the Leap Motion controller
- Connect to the device via Artoo

### Windows

The normal Windows download of the Leap Motion software from https://www.leapmotion.com/setup should work with Artoo.

More instructions need to go here...
