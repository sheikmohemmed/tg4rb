require 'rubygems'
require 'hpricot'

module Tg4rbToolbox

  # Returns the element referred to by xpath
  def element(xpath)
    puts "### Original xpath: #{xpath}"
    xpath = fix_link_text_xpath(Hpricot(@ff.html),xpath) if xpath.include? 'CDATA'
    element_by_least_restrictive_xpath(xpath)
  end

  private
  # Finds the element referred to by xpath, but using the least information it
  # can from the xpath that is enough to guarantee the uniqueness of the
  # element, allowing an element to be found even if the page structures
  # changes a bit.
  def element_by_least_restrictive_xpath(xpath)
    puts '## full xpath:'
    puts xpath
    last_element = []; ele = []
    xpath.split(/\//).reverse.each do |element|
      ele = @ff.elements_by_xpath('//' + last_element.push(element).reverse.join('/'))
      puts '-- current xpath: //' + last_element.reverse.join('/')
      puts "-- number of elements: #{ele.length}"
      if ele.length == 1
        puts '## least restrictive xpath that guarantees uniqueness:'
        puts '//'+last_element.reverse.join('/')
        return ele.first
      end
    end
    puts '## no unique element found. using first occurence.'
    ele.first
  end

  # Works around the faulty xpath that comes from TestGen4Web where a link is
  # referred to by its inner text (all the text between <a> tags, excluding the
  # tags inside it, e.g.: 'I love <b>bold</b>!' becomes 'I love bold!'). Tg4w
  # gives a link xpath with CDATA as a tag attribute with the flattened-out
  # text, which isn't official xpath and isn't recognized by Firewatir. This
  # method takes the page's html document(HPricot::Doc), finds the links,
  # flattens them out and compares them to the flattened-out text given by
  # tg4w. When a match is found, it returns the propper xpath for that link.

  def fix_link_text_xpath(doc,xpath)
    cdata_text = xpath =~ /"(.*)\\"/ ? $1 : ''
    puts "### cdata_text: #{cdata_text}"
    links = doc.search('//a')
    true_xpath = ''
    links.each {|l| puts l.inner_text + '; ' + cdata_text; if l.inner_text == cdata_text then true_xpath = l.xpath end}
    true_xpath
  end

end

