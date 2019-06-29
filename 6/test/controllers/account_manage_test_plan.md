##Testing Account Management

**In all cases, if not Success, log in NOT successful**

####Forgot password
While sent forget password, correct password and email will still work
* normal_tests: click "Forget your Password" -> enter confirmed email -> success redirect to log in page, msg: You will receive an email with instructions on how to reset your password in a few minutes.
* unconfirmed_tests: click "Forget your Password" -> enter unconfirmed email -> success redirect to log in page, msg: You will receive an email with instructions on how to reset your password in a few minutes.
* not_exist_tests: click "Forget your Password" -> enter new email or non-emails -> fail but on same page msg:email not found
* blank_test: click "Forget your Password" -> enter blank email -> fail but on same page msg:email can't be blank

####Confirmation (must be done on same device)
Assume sign up was successful: email= "yu.1989@osu.edu", password="password"

* fail_test: log in with email and password => NOT LOGGED IN, msg: You have to confirm your email address before continuing.
* success_test: enter email, find "Confirmation instructions" from dummy.email.3901@gmail.com-> click 'confirm my account' -> log in page, 
msg: Your email address has been successfully confirmed.
* retry_copy_test: press "didn't receive confirmation instructions" -> enter already confirmed email -> msg: Email was already confirmed, please try signing in.
* retry_notExist_test: press "didn't receive confirmation instructions" -> enter never used email -> msg: Email not found
* retry_exist_test: press "didn't receive confirmation instructions" -> enter not-confirmed email -> sent another email, redirect to log in page,
 msg: You will receive an email with instructions for how to confirm your email address in a few minutes.
* expire_test: waited 3 days later or old confirmation email -> redirected to resend instructions page, msg: Confirmation token is invalid.

####Fail with Log In (Success is in sign_in_out_integration.rb)
* fail_tests: wrong email or wrong password or (blank for either or both) -> log in -> msg: Invalid Email or password. -> click StudyBreak or account ->
redirect to log in page


