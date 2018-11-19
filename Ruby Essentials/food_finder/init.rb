# Food Finder
# Launch this Ruby file from the command line to start

APP_ROOT = File.dirname(__FILE__)

# `$:`contains an array of all the folders Ruby will look in
# here I'm adding my lib folder to that list so I can require
# modules in it without having to define a path each time
$:.unshift( File.join(APP_ROOT, 'lib') )
require 'guide'

guide = Guide.new('restaurants.txt')
guide.launch