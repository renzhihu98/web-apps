##Test plan for scrapper
######Created 2/17/2019 by Leslie Zhou
######Edited 2/17/2019 by Renzhi Hu

Test using irb. Fill in the form and submit with a valid input. Check each attributes in the mechanize object. 
Use .link_with method to test the first "View Details" link.
Then click on it and check if it has the same url and title as the url and title on the actual page.

Examples:

Sample page 1: https://www.jobsatosu.com/postings/92849

Keyword: 'it'

irb(main):001:0> <code>jobpage = page.links_with(:text => 'View Details')[1]</code>

irb(main):001:0> <code>jobpage.title => "The Ohio State University Application Portal | Systems Specialist-A&P"</code>

Expected title: The Ohio State University Application Portal | Systems Specialist-A&P

irb(main):001:0> <code>jobpage.uri.to_s => "https://www.jobsatosu.com/postings/92849"</code>

Expected URL: https://www.jobsatosu.com/postings/92849

#

Sample page 2: https://www.jobsatosu.com/postings/92839

Keyword: 'teaching'

irb(main):001:0> <code>jobpage = page.links_with(:text => 'View Details')[3]</code>

irb(main):001:0> <code>jobpage.title => "The Ohio State University Application Portal | Assistant Professor-Clinical"</code>

Expected title: The Ohio State University Application Portal | Assistant Professor-Clinical

irb(main):001:0> <code>jobpage.uri.to_s => "https://www.jobsatosu.com/postings/92839"</code>

Expected URL: https://www.jobsatosu.com/postings/92839