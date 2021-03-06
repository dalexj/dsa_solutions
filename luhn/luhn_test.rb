gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'luhn_validator'

class LuhnTest < Minitest::Test
  attr_reader :validator

  def setup
    @validator = LuhnValidator.new
  end

  def test_it_validates_the_example_account_number
    assert validator.validate('79927398713')
  end

  def test_it_finds_the_check_digit_for_an_identifier
    assert_equal '3', validator.check_digit_for('7992739871')
  end
end
