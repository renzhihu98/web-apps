# Project 3
### Web Scraping

### Roles
* Overall Project Manager: Leslie Zhou 
* Coding Manager: Kordell Stewart
* Testing Manager: Renzhi Hu
* Documentation: Anna Yu

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

Anna Yu - cron job scheduling and input testing<br>
Leslie Zhou & Renzhi Hu - scraping of jobs website<br>
Kordell Stewart - embedded ruby and html/css styling<br>
Leslie Zhou - integration of various parts<br>
Celia Tang - sending email from created dummy email

#### Scheduling by Anna Yu (2/12/19 - 2/14/19):
To create a cron job in your own Ubuntu virtual machine. (p.s. I used nano editor so my steps are based in nano)
1. Enter  <code>crontab -e</code> into your terminal. You should see an option to open with a editor if it's 
your first time using cron.
2. Write <code>0,2,4,6,8,10 * * * * ruby your/path/to/the/job_mailer.rb</code>. My line of code was 
<code>0,2,4,6,8,10 * * * * ruby /home/annayu06/RubymineProjects/Project-3-The-Dining-Philosophers/job_mailer.rb</code>
MAKE SURE THIS IS ALL IN ONE LINE.
3. Next to save the results <code>ctrl x</code> to exit, enter <code>y</code> to save buffer, then <code>enter</code>.

 If you want to test if the cron job is working then edit your line to redirect the output to a log file like 
<code>0,2,4,6,8,10 * * * * ruby your/path/to/the/job_mailer.rb >> /some/place/cron.log 2>&1</code>.

<p>To change the schedule from executing every 2 minutes for the first 10 minutes of every hour each day.
<blockquote>* * * * * command to be executed

            - - - - -
            | | | | |
            | | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
            | | | ------- Month (1 - 12)
            | | --------- Day of month (1 - 31)
            | ----------- Hour (0 - 23)
            ------------- Minute (0 - 59)
            
And * means every, like every minute, every hour and such. </blockquote></p>

#### Run Instructions
This program generates job listings based on a keyword and sends listings by email to one person. To change search keyword, email, or number of jobs listed, edit the text file called "input" inside lib folder. Please only input one value for each section. This program can only send listings to one email<br><br>
Prior to running the program, please install the Ruby gems Mail, Mechanize, and Nokogiri by 
<p><code>gem install mail</code></p>
<p><code>gem install mechanize</code></p>
<p><code>gem install nokogiri</code></p>

Then please run job_mailer.rb.
<p>To schedule the sending email follow the previous scheduling instructions.</p>
