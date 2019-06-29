# File created 02/10/2019 by Leslie Zhou and Renzhi Hu
# The main purpose of this file is to scrape the osu job postings website by keywords and store the result.
# Also checks for the keyword input for both valid and invalid string cases

require 'mechanize'
require 'nokogiri'
# Created 02/10/2019 by Leslie Zhou and Renzhi Hu
# Edited 2/18/2019 by Leslie Zhou: polished the format
class Scraping
  mechanize = Mechanize.new
  @@page = mechanize.get ('https://www.jobsatosu.com/postings/search')
  @@jobs = []
  # Created 2/10/2019 by Leslie Zhou and Renzhi Hu
  # Edited 2/15/2019 by Renzhi Hu: Scraped the page and added to the array of Result
  # Edited 2/17/2019 by Leslie Zhou: Scraped the description title and the descriptioin body and check if there is no or less than 5 results
  # Edited 2/17/2019 by Renzhi Hu: edited the if statement
  # Edited 2/17/2019 by Leslie Zhou: added the num as the number of how many jobs hould be listed
  # Edited 2/17/2019 by Celia Tang: changed method to class method and variables to class variables
  def self.scraping_jobs(keyword, num)
    @@page.forms.first.query = keyword
    job = @@page.forms.first.submit
    num.times do |i|
      if job.links_with(:text => 'View Details')[i] == nil then break
      else
        job_link = job.links_with(:text => 'View Details')[i].click
        @@jobs.push(Result.new(job_link.title, job_link.uri.to_s, job_link.search('div.containers/div.form_container/table/tr/td')[8].text))
      end
    end
  end


  # Class created 2/15/2019 by Renzhi Hu: created a result object
  # Class edited 2/17/2019 by Leslie Zhou: Added and initialized 2 parameters (descriptTitle, descriptBody)
  # Edited 2/17/2019 by Leslie Zhou: deleted the descriptTitle parameter
  # Edited 2/17/2019 by Renzhi Hu: added descriptTitle and descriptBody to attr_reader
  # Editied 2/17/2019 by Leslie Zhou: deleted attr_reader descriptTitle
  class Result
    attr_reader :title, :link, :descriptBody
    def initialize(title, link, descriptBody)
      @title = title
      @link = link
      @descriptBody = descriptBody
    end
  end
end
