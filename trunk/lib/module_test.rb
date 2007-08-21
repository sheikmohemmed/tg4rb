# TODO turn this into a unit test
require 'tg4rb_toolbox'
require 'rubygems'
require 'firewatir'
include FireWatir
include Tg4rbToolbox
@ff = Firefox.new
@ff.goto('http://www.voegol.com.br')
element('/HTML/BODY/TABLE[1]/TBODY[1]/TR[1]/TD[1]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/DIV[1]/TABLE[1]/TBODY[1]/TR[1]/TD[1]/A')
