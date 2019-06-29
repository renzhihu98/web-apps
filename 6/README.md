# Project 6
### Ruby on Rails Project

### Roles
* Overall Project Manager: Celia Tang
* Coding Manager: Leslie Zhou
* Testing Manager: Anna Yu
* Documentation: Renzhi Hu
---
### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

* Celia Tang: search controller and view using Ransack gem, basic stying
* Leslie Zhou: reviews and comments model, view and controller

* Anna Yu: account management with devise, added username to login, about, help, contact page. **associated routes**: devise_for, 
static pages routes. **associated controllers**: application, static_pages, ones for logging in are included with devise gem, not visible. **associated model**: User

* Renzhi Hu: basic header and footers using bootstrap, user views and controller
* Kordell Stewart: Books model, view, and controller and routes. Image uploading using MiniMagick and general bootstrap stying
---
### Testing
Unit Testing
* (Anna) **Sign up**: For forget password and confirming account functionality I have a test plan inside test/controllers folder called *account_manage_test_plan.md*
 because those functionality requires a email to respond.
For sign up functionality tests are inside *model/user_test.rb*.
* (Anna) **Static Pages**: testing access inside test/controllers/static_pages_controller_test.rb
* (Celia) **Search**: Test plan in test/controllers/searches_test_plan.md
* (Kordell) **Books**: test cases in "test/controllers/books_controller_test.rb, test plan for images in test/Image Uploader Test Plan"
* (Renzhi) **User**: test cases in "test/controllers/users_controller_test.rb"
* (Leslie) **Comment & Reviews**: Not possible to test comment and review individually since they are dependent on book, see book and reviews and comments integrated test plan below



Integration
* **Base Site Layout, Sign In/Out link access**: inside test/Integration/sign_in_out_integration_test.rb for the root page with header and footer.
* **Search inside Header**: inside test/controllers/searches_test_plan.md
* **Book with comments and reviews**: inside inside test/Integration/book_review_comment_int_test_plan.rb
* **User profile with Book**: inside inside test/Integration/user_book_test_plan.rb
* **User profile with reviews and comments**: inside inside test/Integration/user_review_comment_test_plan.rb


---
### Getting started

To get started with the app, clone the repo then install the needed gems:
`$ bundle install`

Since the mini-magick gem is used, ImageMagick needs to be installed:
 `sudo apt-get install imagemagick` 

<div>Before running anything, we need to migrate the database
<p>$ rails db:migrate</p></div>
<div>Finally, run the test suite to verify that everything is working correctly
<p>$ rails test</p></div>
<div>If the test suite passes, you will be ready to run the app in a local server:
<p>$ rails server</p></div>
<div>Then open any desired browser on this device and type in the search bar to reach our page:
<p>localhost:3000</p></div>

