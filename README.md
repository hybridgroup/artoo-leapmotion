# Artoo Adaptor For Leap Motion

This repository contains the Artoo (http://artoo.io/) adaptor for the Leap Motion controller (https://www.leapmotion.com/). 

It borrows code from https://github.com/glejeune/ruby-leap-motion-ws, thanks @glejeune

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-leapmotion.png)](https://codeclimate.com/github/hybridgroup/artoo-leapmotion) [![Build Status](https://travis-ci.org/hybridgroup/artoo-leapmotion.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-leapmotion)

## Installing

```
gem install artoo-leapmotion
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

- Run `Leap Motion.app`, it will open a websocket connection in port 6437.
- Connect your Computer and Leap Motion Controller.
- Connect to the device via Artoo.

### Ubuntu

The Linux download of the Leap Motion software can be obtained from [Leap Motion Dev Center](https://developer.leapmotion.com/downloads) (requires free signup)

The main steps are:

- Run the `leapd` daemon, it will open a websocket connection in port 6437.
- Connect your computer and the Leap Motion controller
- Connect to the device via Artoo

### Windows

The normal Windows download of the Leap Motion software from https://www.leapmotion.com/setup should work with Artoo.

We are currently working with the Celluloid team to add Windows support. Please check back soon!

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing

* All active development is in the dev branch. New or updated features must be added to the dev branch. Hotfixes will be considered on the master branch in situations where it does not alter behaviour or features, only fixes a bug.
* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
