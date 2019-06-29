#Tseting the Job_mailer class's initialization method
#Created 2/15/19 by Anna Yu
require 'test/unit'
require_relative '../../job_mailer'

class TestInput < Test::Unit::TestCase


  # Given non existent input file, should not open.
  # Created 2/15/19 by Anna Yu
  # Edited 2/17/19 by Anna Yu: added assert nil, added relative path
  def test_notExistInput
    a = Job_mail.new("testing/input_tests/Input")
    assert_nil(a.file, "empty but opened")
  end

  # Given existent input file with nothing, should not open.
  # Created 2/15/19 by Anna Yu
  # Edited 2/16/19 by Anna Yu: assert nil
  # Edited 2/17/19 by Anna Yu: fixed relative path to txt
  def test_noInput
    a = Job_mail.new("testing/input_tests/input0")
    assert_nil(a.file, "empty but opened")
  end

  # valid values mixed in with wrong values, should take in right values
  # Created 2/16/19 by Anna Yu: assert statements added
  # Edited 2/17/19 by Anna Yu: fixed relative path to txt
  def test_averageInput
    a = Job_mail.new("testing/input_tests/input1")
    assert(a.file, "file not opened")
    assert_equal("one", a.keyword, "not expected keyword one")
    assert_equal(1, a.numList, "not expected num 1")
    assert_equal("yu.1989@osu.edu",a.email, "not expected email input1")

  end

  # All the wrong keywords, should not take in any
  # Created 2/17/19 by Anna Yu: assert_nil made
  def test_wrongKey
    a = Job_mail.new("testing/input_tests/inputFakeKey")
    assert_nil(a.keyword, "keyword worked!")
  end

  # All wrong number, none should be taken in
  # Created 2/17/19 by Anna Yu: assert_nil made
  def test_wrongNum
    a = Job_mail.new("testing/input_tests/inputFakeNum")
    assert_nil(a.numList, "took in wrong num!")
  end

  # All wrong email format, none should be taken in
  # Created 2/17/19 by Anna Yu: assert_nil made
  def test_wrongEmail
    a = Job_mail.new("testing/input_tests/inputFakeEmail")
    assert_nil(a.email, "took in wrong email!")
  end

  # Check for all valid keys meaning must be a string but can be anything. Further checking
  # is done by scraping.rb.
  # Created 2/17/19 by Anna Yu: tested 2 edge cases
  def test_validKey
    File.open("testing/input_tests/inputValidKey", 'w'){|file| file.write("Keyword:testing, two\n")}
    a = Job_mail.new("testing/input_tests/inputValidKey")
    assert_equal("testing, two", a.keyword, "keyword should be accepted")
    File.open("testing/input_tests/inputValidKey", 'w'){|file| file.write("Keyword: :.,)(*&^%$#!\n")}
    b = Job_mail.new("testing/input_tests/inputValidKey")
    assert_equal(":.,)(*&^%$#!", b.keyword, "keyword should be accepted")
  end

  # Check for edge testing cases of 0, 10 and 9
  # Created 2/17/19 by Anna Yu: tested 0, 10, 9
  def test_validNum
    File.open("testing/input_tests/inputValidNum", 'w'){|file| file.write("number: 0")}
    a = Job_mail.new("testing/input_tests/inputValidNum")
    assert_equal(0, a.numList, "number should be accepted")

    File.open("testing/input_tests/inputValidNum", 'w'){|file| file.write("number: 10")}
    b = Job_mail.new("testing/input_tests/inputValidNum")
    assert_equal(10, b.numList, "number should be accepted")

    File.open("testing/input_tests/inputValidNum", 'w'){|file| file.write("number: 9")}
    c = Job_mail.new("testing/input_tests/inputValidNum")
    assert_equal(9, c.numList, "number should be accepted")
  end

  # Check for valid edge cases
  # Created 2/17/19 by Anna Yu: tested big .num, weird uppercase.
  def test_vaildEmail
    File.open("testing/input_tests/inputValidEmail", 'w'){|file| file.write("email: smith.983743@osu.edu")}
    a = Job_mail.new("testing/input_tests/inputValidEmail")
    assert_equal("smith.983743@osu.edu", a.email, "email should be accepted")
    File.open("testing/input_tests/inputValidEmail", 'w'){|file| file.write("email: SmItH.1@OsU.EdU")}
    b = Job_mail.new("testing/input_tests/inputValidEmail")
    assert_equal("SmItH.1@OsU.EdU", b.email, "email should be accepted")
    File.open("testing/input_tests/inputValidEmail", 'w'){|file| file.write("email: SMITH.999999@OSU.EDU")}
    c = Job_mail.new("testing/input_tests/inputValidEmail")
    assert_equal("SMITH.999999@OSU.EDU", c.email, "email should be accepted")

  end

end
