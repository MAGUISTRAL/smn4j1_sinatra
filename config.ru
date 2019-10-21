require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController   #terminal faire : rackup -p 4567 / rackup pour ouvrir sur le port 9292 //
                              # -p 4567  : ouvrir le port 4567 / port utilisé pour sinatra par convention
