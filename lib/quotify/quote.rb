require 'yaml'
require 'json'

module Quotify

  ##
  # This class represents a quote object
  class Quote

    # Generates a quote
    # @param quote [#to_s] A specified quote
    # @param author [#to_s] A specified author
    # @return [Quote] quote with author
    def initialize(quote: nil, author: nil)
      @quote = quote || Quotify.config[:quotes].sample
      @author = author || Quotify.config[:authors].sample
    end

    # Returns the quote and author in a string format
    # @option spacer [#to_s] Characters between quote and author
    def to_s(spacer: Quotify.config[:default_spacer])
      "#{@quote}#{spacer}#{@author}"
    end


    # Returns the quote and author in a string format
    # @option spacer [#to_s] Characters between quote and author
    def to_str(spacer: Quotify.config[:default_spacer])
      to_s(spacer: spacer)
    end

    # Returns the quote and author in a hash
    # @return [Hash]
    def to_hash
      { quote: @quote, author: @author }
    end

    # Returns the quote and author in a JSON structured String
    # @return [String]
    def to_json
      to_hash.to_json
    end

    # Returns the author
    # @return [#to_s]
    def author
      @author
    end

    # Returns the quote
    # @return [#to_s]
    def quote
      @quote
    end

    alias_method :to_h, :to_hash
  end
end
