require 'quotify/quote'

##
# This module generates quotes on demand. Welcome to the future.
module Quotify

  @default_config = YAML.load_file(File.join(__dir__, 'quotify/quotes.yml'))

  @config = @default_config.clone

  @valid_config_keys = @config.keys

  # Generates a quote
  # @param quote [#to_s] A specified quote
  # @param author [#to_s] A specified author
  # @return [Quotify::Quote] quote with author
  def self.generate(quote: nil, author: nil)
    Quote.new(quote: quote, author: author)
  end

  # Outputs the configs of quotify-ruby
  # @return [Hash]
  def self.config
    @config
  end

  # Configure through hash
  # @param opts [Hash] A Hash of configurations
  def self.configure(opts = {})
    opts.each do |k,v|
      @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym
    end
  end

  # Configure through yaml file
  # @param path_to_yaml_file [Path] Path of the configuration file
  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML.load_file(path_to_yaml_file)
    rescue Errno::ENOENT
      puts "YAML configuration file couldn't be found. Using defaults."; return
    rescue Psych::SyntaxError
      puts "YAML configuration file contains invalid syntax. Using defaults."; return
    end

    configure(config)
  end

  # Resets the configurations
  def self.reset_config
    @config = @default_config.clone
  end
end
