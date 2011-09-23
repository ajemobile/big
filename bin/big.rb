#!/usr/bin/ruby 
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bigmagic'

puts $LOAD_PATH

big = Bigmagic::Main.new
big.run(ARGV)
