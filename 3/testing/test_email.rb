require 'test/unit'
require_relative '../lib/email'

# File created 2/11/19 by Celia Tang
# methods that run email method for test plan

class TestEmail < Test::Unit::TestCase

=begin
  Test Plan: run "test" methods below and check that email is correctly send to toAdd given in method
    to_gmail test: sent to personal gmail account using dummy email, was able to find email sent to correct address
                   and had the formatting in the test html file, gmail doesn't support html styling
    to_buckeyemail test: sent to osu email and check that email was correctly formatted using test html file

    to_gmail final_sample: sent to personal gmail account using dummy email, was able to find email sent to correct address
                   and had the formatting in the test final_sample file, gmail doesn't support html styling
    to_buckeyemail final_sample: sent to osu email and check that email was correctly formatted using final_sample html file
=end

  # Created by Celia Tang 2/15/19 test sending an email to gmail email using test html file to populate body of email
  # edited 2/17/19 by Celia Tang - removed hardcoded message
  # edited 2/17/19 by Celia Tang - changed to accomodate change in method
  def test_to_gmail_test_html

    file = "testing/email_test.html"

    Email.mail_file file, 'ct75451@gmail.com'
  end

  # Created by Celia Tang 2/17/19 test sending an email to buckeyemail email using test html file to populate body of email
  # edited 2/17/19 by Celia Tang - changed to accomodate change in method
  def test_to_buckeyemail_test_html
    file = "testing/email_test.html"

    Email.mail_file file, 'tang.1174@buckeyemail.osu.edu'
  end

  # Created by Celia Tang 2/17/19 test sending an email to gmail email using final_sample html file to populate body of email
  # edited 2/17/19 by Celia Tang - changed to accomodate change in method
  def test_to_gmail_final_sample_html


    file = "testing/FinalSampleForTesting.html"

    Email.mail_file file, 'ct75451@gmail.com'
  end

  # Created by Celia Tang 2/17/19 test sending an email to buckeyemail email using final_sample html file to populate body of email
  # edited 2/17/19 by Celia Tang - changed to accomodate change in method
  def test_to_buckeyemail_final_sample_html

    file = "testing/FinalSampleForTesting.html"

    Email.mail_file file, 'tang.1174@buckeyemail.osu.edu'
  end

end