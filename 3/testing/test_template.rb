# Created 2/14/19 by Kordell Stewart
# Edited 2/17/19 by Kordell Stewart - Finalized testing
# This is the file used to ensure that our .erb file outputs the correct format for html

require 'erb'
require_relative 'targets'

r1 = EasyLinkTest.new
r2 = EasyLinkTest.new
r3 = EasyLinkTest.new
@results = [r1, r2, r3]

template = ERB.new File.read("lib/template.html.erb"), nil, "%"
puts template.result(binding)