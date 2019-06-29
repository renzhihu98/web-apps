# Created 2/15/19 by Kordell Stewart
# This file is just a simple way to test mass input into the erb template without having to scrape.

# This class is a sample listing with a title, a dummy link, and a description
class EasyLinkTest
    def initialize
      @title = "THIS IS A TITLE"
      @link = "https://www.netflix.com/"
      @descriptBody = "This is a netflix link! Go watch some movies!"
    end
    attr_reader :title, :link, :descriptBody
end