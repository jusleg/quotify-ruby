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
      quote_list = YAML.load_file(File.join(__dir__, 'quotes.yml')) unless quote && author
      @quote = quote || quote_list['quotes'].sample
      @author = author || quote_list['authors'].sample
    end

    # Returns the quote and author in a string format
    # @option spacer [#to_s] Characters between quote and author
    # <br>
    # Example:
    #   >> Quote.new.to_s(spacer: " 🔥 ")
    #   => You must be the change you wish to see in the world. 🔥 Logan Paul
    def to_s(spacer: " - ")
      "#{@quote}#{spacer}#{@author}"
    end


    # Returns the quote and author in a string format
    # @option spacer [#to_s] Characters between quote and author
    # <br>
    # Example:
    #   >> Quote.new.to_s(spacer: " 🔥 ")
    #   => You must be the change you wish to see in the world. 🔥 Logan Paul
    def to_str(spacer: " - ")
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
