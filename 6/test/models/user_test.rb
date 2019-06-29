# Created 4-13-19 by Anna Yu
# Edited 4-14-19 by Anna Yu: added all sign up test, tested username, email, and password
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: 'John', email: 'john@ex.com', password: 'password')
  end

  # user should be valid
  # Created 4-15-19 by Anna Yu
  test 'valid user' do
    assert @user.valid?, 'user should be valid'
  end
  # user must have a username
  # Created 4-15-19 by Anna Yu
  test 'invalid without username' do
    @user.username = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:username], 'no validation error for username present'
  end
  # user must have a email
  # Created 4-15-19 by Anna Yu
  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end
  # user must have a password
  # Created 4-15-19 by Anna Yu
  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password], 'no validation error for password present'
  end
  # username must not pass 36
  # Created 4-15-19 by Anna Yu
  test 'username should not be too long' do
    @user.username = 'a' * 37
    assert_not @user.valid?, 'username length should not be past 36'
  end
  # user username must be unique not case sensitive, different username will work
  # Created 4-15-19 by Anna Yu
  test 'username should be unique' do
    # a used username is 'Anna'
    @user1 = User.new(username: 'Anna', email: 'jo@ex.com', password: 'password')
    assert_not @user1.valid?, 'Anna is taken, should not pass'
    @user1.username = 'ANNA'
    assert_not @user1.valid?, 'Anna is taken, should not pass'
    @user1.username = 'anna'
    assert_not @user1.valid?, 'Anna is taken, should not pass'
    @user1.username = 'aNnA'
    assert_not @user1.valid?, 'Anna is taken, should not pass'
    @user1.username = 'anna123'
    assert @user1.valid?, 'anna123 is not taken, should pass'
  end
  # username cannot be empty
  # Created 4-15-19 by Anna Yu
  test 'username should not be empty' do
    @user.username = '      '
    assert_not @user.valid?
  end
  # username cannot contain any spaces
  # Created 4-15-19 by Anna Yu
  test 'username should not contain spaces' do
    @user.username = ' Ann'
    assert_not @user.valid?
    @user.username = 'Ann '
    assert_not @user.valid?
    @user.username = ' Ann '
    assert_not @user.valid?
    @user.username = 'Ann A'
    assert_not @user.valid?
  end
  # normal valid usernames
  # Created 4-15-19 by Anna Yu
  test 'normal valid usernames' do
    @user.username = 'Ann'
    assert @user.valid?
    @user.username = '123'
    assert @user.valid?
    @user.username = '12Anns'
    assert @user.valid?
    @user.username = 'hi12'
    assert @user.valid?
  end
  # valid small usernames
  # Created 4-15-19 by Anna Yu
  test 'small valid usernames' do
    @user.username = 'a'
    assert @user.valid?
    @user.username = 'P'
    assert @user.valid?
    @user.username = '1'
    assert @user.valid?
    @user.username = '0'
    assert @user.valid?
    @user.username = 'v'
    assert @user.valid?

  end
  # usernames should not have special characters
  # Created 4-15-19 by Anna Yu
  test 'username with special character' do
    @user.username = '+'
    assert_not @user.valid?
    @user.username = '-'
    assert_not @user.valid?
    @user.username = '!'
    assert_not @user.valid?
    @user.username = 'ann!'
    assert_not @user.valid?
    @user.username = '(123)'
    assert_not @user.valid?
    @user.username = 'asdah2214+'
    assert_not @user.valid?
    @user.username = 'aaa+222'
    assert_not @user.valid?
  end
  # email length must be under 254
  # Created 4-15-19 by Anna Yu
  test 'email should not be too long' do
    @user.email = 'a' * 255 + '@example.com'
    assert_not @user.valid?
  end

  # emails that do not fit convention
  # Created 4-15-19 by Anna Yu
  test 'emails that should not pass' do
    @user.email = '@gmail.com'
    assert_not @user.valid?, '@gmail.com is not valid'
    @user.email = '@com'
    assert_not @user.valid?, '@com is not valid'
    @user.email = '123.ann21gmail.com'
    assert_not @user.valid?, '123.ann21gmail.com is not valid'
    @user.email = 'asdj@dssfe'
    assert_not @user.valid?, 'asdj@dssfe is not valid'
  end
  # email cannot be empty
  # Created 4-15-19 by Anna Yu
  test 'email should not be empty' do
    @user.email = '      '
    assert_not @user.valid?
  end
  # emails that should pass extreme cases
  # Created 4-15-19 by Anna Yu
  test 'emails weird but valid' do
    @user.email = 'a2@gmail.com'
    assert @user.valid?, 'a@gmail.com is valid'
    @user.email = 'yu.1989@osu.edu'
    assert @user.valid?, 'yu.1989@osu.edu is valid'
    @user.email = 'yu.1989@buckeyemail.osu.edu'
    assert @user.valid?, 'yu.1989@buckeyemail.osu.edu is valid'
    @user.email = '123@qq.com'
    assert @user.valid?, '123@qq.com'
  end
  # email extreme case
  # Created 4-15-19 by Anna Yu
  test 'email max valid length' do
    @user.email = 'a' * 26 + '@gmail.com'
    assert @user.valid?, 'max length email should pass'
  end
  # password cannot be empty
  # created 4-15-19 by Anna Yu
  test 'password cannot be empty' do
    @user.password = '      '
    assert_not @user.valid?
  end
  # password cannot be less than 6 letters
  # created 4-15-19 by Anna Yu
  test 'password must be at least 6 letters' do
    @user.password = 'a'
    assert_not @user.valid?, '1 letter not valid'
    @user.password = 'aa'
    assert_not @user.valid?, '2 letters not valid'
    @user.password = 'aaa'
    assert_not @user.valid?, '3 letters not valid'
    @user.password = 'aaaa'
    assert_not @user.valid?, '4 letters not valid'
    @user.password = 'aaaaa'
    assert_not @user.valid?, '5 letters not valid'
    @user.password = 'aaaaaa'
    assert @user.valid?, '6 letters valid'
  end
  # password max length
  # created 4-15-19 by Anna Yu
  test 'password max length 128' do
    @user.password = 'a' * 128
    assert @user.valid?, 'password is 128 should pass'
    @user.password = 'a' * 129
    assert_not @user.valid?, 'password is pass 128, fail'
  end
end
