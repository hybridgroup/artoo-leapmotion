# Artoo Adaptor For Leap Motion

This repository contains the Artoo (http://artoo.io/) adaptor for the Leap Motion controller (https://www.leapmotion.com/). 

It borrows code from https://github.com/glejeune/ruby-leap-motion-ws, thanks @glejeune

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

## Installing

```
gem install artoo-leapmotion --pre
```

## Using

```ruby
# example here...
```

## Connecting to Leap Motion

Download the correct version of the Leap Motion software from 

### OSX

Instructions here...

### Ubuntu

The main steps are:
- Connect your computer and the Leap Motion controller
- Connect to the device via Artoo

You will need to run the `leapd` daemon in order to connect your Artoo code to your Leap Motion controller.

```
$ leapd
```

Once your computer is communcating with the Leap Motion controller, the `leapd` program exposes a websocket-based interface to receive data.

### Windows

Instructions go here...
