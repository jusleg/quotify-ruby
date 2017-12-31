require 'quotify/quote'

##
# This module generates quotes on demand. Welcome to the future.
module Quotify

  # Generates a quote
  # @param quote [#to_s] A specified quote
  # @param author [#to_s] A specified author
  # @return [Quotify::Quote] quote with author
  def self.generate(quote: nil, author: nil)
    Quote.new(quote: quote, author: author)
  end
end
