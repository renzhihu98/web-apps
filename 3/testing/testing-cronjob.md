Created 2/14/19 by Anna Yu

Test plan for testing cron job.

#### Test schedule output of a message as a string to a file


1. Created a cron job to redirect output to a log file. The script to be executed only contained
<code>puts "writing scheduled by cron"</code>. My cron job was <code>0,2,4,6,8,10 * * * * ruby /home/annayu06/RubymineProjects/Project-3-The-Dining-Philosophers/used_for_cron.rb >> /home/annayu06/cron.log 2>&1
</code> Once written to crontab, I looked in cron.log and saw "writing scheduled by cron". Came back 5 minutes later
and I see 3 lines of the same message in log.

