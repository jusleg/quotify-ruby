require 'quotify/quote'

##
# This module generates quotes on demand. Welcome to the future.
module Quotify

  # Generates a quote
  # @param quote [#to_s] A specified quote
  # @param author [#to_s] A specified author
  # @return [Quotify::Quote] quote with author
  # <br>
  # Example:
  #   >> Quotify.generate
  #   => #<Quotify::Quote:0x00007f8a44053978 @quote="You must be the change you wish to see in the world.", @author="Logan Paul">
  def self.generate(quote: nil, author: nil)
    Quote.new(quote: quote, author: author)
  end
end
