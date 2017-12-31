require 'minitest/autorun'
require 'mocha/mini_test'
require 'quotify/quote'

class QuoteTest < Minitest::Test
  def test_valid_quotes
    stub_yaml_quotes
    super_quote = Quotify::Quote.new
    assert super_quote.author == 'Justin Leger'
    assert super_quote.quote == 'WOW'
  end

  def test_valid_custom_quote
    super_quote = Quotify::Quote.new(author: 'Justin Leger', quote: 'WOW')
    assert super_quote.author == 'Justin Leger'
    assert super_quote.quote == 'WOW'
  end

  def test_yaml_read_if_necessary
    YAML.expects(:load_file).once.returns(stub_hash)
    Quotify::Quote.new
  end

  def test_should_not_load_yaml
    YAML.expects(:load_file).never
    Quotify::Quote.new(author: 'Michel Chatmajian', quote: 'WUUUSH')
  end

  def test_return_proper_author
    quote = Quotify::Quote.new(author: 'Kevin Camellini', quote: 'Crossfit4lyf')
    assert_equal 'Kevin Camellini', quote.author
  end

  def test_return_proper_quote
    quote = Quotify::Quote.new(author: 'Kevin Zhang', quote: 'CaliOrBust')
    assert_equal 'CaliOrBust', quote.quote
  end

  def test_hash_return_proper_value
    quote = Quotify::Quote.new(author: 'Justin Leger', quote: 'WOW')
    assert_equal quote.to_hash, { quote: 'WOW', author: 'Justin Leger' }
  end

  def test_json_return_value
    quote = Quotify::Quote.new(author: 'CENA', quote: 'WOW')
    assert_equal quote.to_json, "{\"quote\":\"WOW\",\"author\":\"CENA\"}"
  end

  def test_to_s_method
    quote = Quotify::Quote.new(author: 'Aaron', quote: 'Send it')
    assert_equal quote.to_s, 'Send it - Aaron'
  end

  def test_to_str_method_with_custom_spacer
    quote = Quotify::Quote.new(author: 'Reeon', quote: 'My real loo friends')
    assert_equal quote.to_str(spacer: " 🔥 "), 'My real loo friends 🔥 Reeon'
  end

  def stub_yaml_quotes
    YAML.stubs(load_file: stub_hash)
  end

  def stub_hash
    {'authors' => ['Justin Leger'], 'quotes' => ['WOW']}
  end
end
