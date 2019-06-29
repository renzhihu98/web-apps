
# File created 2/11/19 by Celia Tang
# module that contains method that sends email
# please install Mail Ruby gem prior to running

require 'rubygems'
require 'mail'

module Email

  # Created by Celia Tang 2/15/19
  # sends email with passed in arguments using Mail gem populated body using HTML file, requires html file exists at
  # given file path and fromAdd has correct corresponding password, server, port and domain values and toAdd is existing
  # email address, also requires that fromAdd is gmail address with "less secure apps access" turned on
  # edited 2/17/19 by Celia Tang - sends only from specific dummy email created prior, changed subject of email
  def self.mail_file(file,toAdd)

    server = "smtp.gmail.com"
    fromAdd = "dummy.email.3901@gmail.com"
    password = "OSUCSE3901"
    domain = "gmail.com"
    port = 587

    mail = Mail.new do
      from    fromAdd
      to      toAdd
      subject 'Job Search Listings'

      html_part do
        content_type 'text/html; charset=UTF-8'
        body File.read file
      end
    end
    options = { :address              => server,
                :port                 => port,
                :domain               => domain,
                :user_name            => fromAdd,
                :password             => password,
                :authentication       => 'plain',
                :enable_starttls_auto => true  }
    mail.delivery_method :smtp, options
    mail.deliver
  end
end