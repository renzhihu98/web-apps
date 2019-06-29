# The main purpose of this job_mailer class is to send a email message about jobs to a destination.
# It should read from a input file to know what jobs to search for, which email to send to,
# and how many job listings wanted.
#
# Created file 2/15/19 by Anna Yu
# Edited 2/17/19 by Anna Yu
# Edited 2/17/2019 by Leslie Zhou: Integrated all the parts together and required all the classes
# Edited 2/17/2019 by Leslie Zhou: method sendMail created and implemented
# Edited 2/18/19 by Anna Yu: simplified attr_reader
require 'erb'
require 'mechanize'
require 'mail'
require_relative 'lib/email'
require_relative 'lib/scraping'

class Job_mail
  attr_reader :email, :keyword, :numList, :file #For testing purposes

  # Created 2/15/19 by Anna Yu: read from file
  # Edited  2/16/19 by Anna Yu using RE verify input
  # Edited 2/17/19 by Celia Tang: deleted calls to scraping and call send email
  def initialize(file)
    if File.size?(file) then
      @file = true
      File.foreach(file) do |line| #check requirement
        line.chomp!
        @keyword = line.split(/^keyword:\s?/i)[1] if line.match?(/^keyword:\s?.+\z/i)
        @numList = line.split(/^number:\s?/i)[1].to_i if line.match?(/^number:\s?([0-9]|10)\z/i)
        @email = line.split(/^email:\s?/i)[1] if line.match?(/^email:\s?[a-z]+\.[1-9]\d*@osu\.edu\z/i)
      end
    else
      puts "ERROR!: cannot open file or file is empty!"
    end
    if @keyword == nil|| @numList == nil|| @email == nil then
      puts "ERROR! missing or wrong inputs:\n 'keyword: anything'\n'number: [0-10]'\n 'email: lastName.digits@osu.edu'"
    else
      sendMail
    end
  end


  #Created and editied 2/17/2019 by Leslie Zhou: after getting everything call this method to successfully scrape from the website and then send the email
  #This is the main method of calling all the classes and then send out the email
  # Edited 2/17/19 by Celia Tang - changed scraping call to class method and get class var and writes using the results of the result object
  # Edited 2/18/19 by Leslie Zhou: polished the format
  private def sendMail
    Scraping.scraping_jobs(@keyword,@numList)
    @results = Scraping.class_variable_get :@@jobs
    result = ERB.new File.read "lib/template.html.erb", nil, "%"
    File.open'lib/email.html','w+' do |f|
      f.write result.result binding
    end
    Email.mail_file 'lib/email.html', @email
  end

end
Job_mail.new'lib/input'