Created by Kordell Stewart 2/15/19

Edited by Kordell Stewart 2/17/19 - Added additional tests

## Test Plan For the ERB HTML ## 
For the actual message we are sending, 
we are using an ERB template to dynamically generate the 
formatted HTML in Ruby. 

  `test_template.rb` is the main file that was used in this testing 
  process. It outputs the plaintext html for the dummy input. 
  
  `targets.rb` was a class to quickly generate as many "dummy" results 
  to speed up testing while the scraper was being worked on. 
  
  **Case 1**: Empty Input
  The first test was empty results. When passed an empty array of results
  The html generated was correct and listed no links/descriptions.
  
  **Case 2**: Small Input (1 results)
  A single result yielded the correctly formatted HTML. Spacing 
  was ok. 
   
  **Case 3**: Max Input (10 results)
  With the full output of ten potential results, the page looked 
  correct, with all results being successfully output. 
  
 **Email Client Test:**
 In outlook, the html and styling was formatted correctly,
 but clients such as gmail don't support styling. Basic html was 
 still formatted plainly and correctly in these cases though. 
