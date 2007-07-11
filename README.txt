tg4rb
    by Helder Ribeiro
    (http://code.google.com/p/tg4rb)

== DESCRIPTION:
  
This is a translator from TestGen4Web to FireWatir. TestGen4Web is a Firefox
extension that records user actions on websites and outputs them as XML.
FireWatir is a library that allows one to programatically control a Firefox
instance. *tg4rb* reads XML and outputs Ruby code that uses FireWatir to
reproduce the actions recorded with TestGen4Web.

== FEATURES:
  
* takes an XML with actions from tg4w and outputs stand-alone Ruby code that can be run directly or embedded into existing code (e.g. for test automation).
* can be used as a library or as an executable script.
* takes the xpath from tg4w and uses only enough info to guarantee the uniqueness of the referenced element, allowing the generated script to keep working even with some change on page structure.

== PROBLEMS:

* the generated code is damn ugly.
* a few action types from the XML input still aren't recognized.
* some dependencies aren't very clearly sorted out yet. you might find you need something that is not specified. if yes, please report this as an issue in our issue tracker.
* i don't know, find more and let me know =)

== SYNOPSIS:

  doc = Document.new(File.read(xml_file))
  actions = Tg4wToFirewatir.parse_xml(doc)
  translator = Tg4wToFirewatir.new(actions)
  File.open('output.rb','w') {|f| f << translator.translate}


== REQUIREMENTS:

* rexml
* hoe
* rubyforge
* rake

== INSTALL:

* sudo gem install tg4rb

(for more details: http://code.google.com/p/tg4rb/wiki/GettingStarted)

== LICENSE:

(GNU General Public License)

Copyright (C) 2007  Helder dos Santos Ribeiro

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
