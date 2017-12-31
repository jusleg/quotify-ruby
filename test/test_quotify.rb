require 'minitest/autorun'
require 'mocha/mini_test'
require 'quotify'
require 'yaml'

class QuotifyTest < Minitest::Test
  def test_valid_quotes
    super_quote = Quotify.generate
    quote_list = YAML.load_file(File.join(__dir__, '../lib/quotify/quotes.yml'))
    assert quote_list["quotes"].include?(super_quote.quote)
    assert quote_list["authors"].include?(super_quote.author)
  end

  def test_valid_custom_quote
    super_quote = Quotify.generate(author: 'Justin Leger', quote: 'WOW')
    assert super_quote.author == 'Justin Leger'
    assert super_quote.quote == 'WOW'
  end
end
