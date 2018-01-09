require 'minitest/autorun'
require 'mocha/mini_test'
require 'quotify'
require 'yaml'

class QuotifyTest < Minitest::Test
  def setup
    Quotify.configure_with(File.join(__dir__, 'default_quotes.yml'))
  end

  def test_valid_quotes
    super_quote = Quotify.generate
    quote_list = YAML.load_file(File.join(__dir__, 'default_quotes.yml'))
    assert quote_list[:quotes].include?(super_quote.quote)
    assert quote_list[:authors].include?(super_quote.author)
  end

  def test_valid_custom_quote
    super_quote = Quotify.generate(author: 'Justin Leger', quote: 'WOW')
    assert super_quote.author == 'Justin Leger'
    assert super_quote.quote == 'WOW'
  end

  def test_default_config_value
    quote_list = YAML.load_file(File.join(__dir__, 'default_quotes.yml'))
    assert_equal ' - ', Quotify.config[:default_spacer]
    assert_equal quote_list[:quotes], Quotify.config[:quotes]
  end

  def test_configure_method_does_not_change_if_key_not_valid
    Quotify.configure(spacer: ' lolwut ')
    assert_equal Quotify.config[:default_spacer], ' - '
  end

  def test_configure_with_yaml_with_dummy_flag_to_check_yaml
    Quotify.configure_with(File.join(__dir__, 'custom_quotes.yml'))
    assert_equal Date.new(1000,1,1), Quotify.config[:updated_at]
  end

  def test_configure_with_yaml_error_does_not_exist
    assert_output "YAML configuration file couldn't be found. Using defaults.\n" do
      Quotify.configure_with(File.join(__dir__, 'does_not_exist.yml'))
    end
  end

  def test_configure_with_yaml_error_broken
    assert_output "YAML configuration file contains invalid syntax. Using defaults.\n" do
      Quotify.configure_with(File.join(__dir__, 'broken_yaml.yml'))
    end
  end

  def test_reset_config
    Quotify.configure_with(File.join(__dir__, 'custom_quotes.yml'))
    Quotify.reset_config
    refute_equal Date.new(1000,1,1), Quotify.config[:updated_at]
  end
end
