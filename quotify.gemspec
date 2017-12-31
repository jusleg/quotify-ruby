Gem::Specification.new do |s|
  s.name        = 'quotify'
  s.version     = '0.1.0'
  s.date        = '2017-12-30'
  s.summary     = 'Generates random quotes'
  s.description = 'Generates random quotes. Perfect placeholder text.'
  s.author      = 'Justin Leger'
  s.email       = 'hey@justinleger.ca'
  s.files       = ['lib/**/*', 'LICENSE', 'CHANGELOG.md']
  s.homepage    = 'https://github.com/jusleg/quotify-ruby'
  s.license     = 'MIT'

  s.metadata = {
    "source_code_uri" => "https://github.com/jusleg/quotify-ruby",
    "changelog_uri"   => "https://github.com/jusleg/quotify-ruby/blob/master/CHANGELOG.md"
  }

  s.add_dependency 'json'
  s.add_development_dependency "rake"
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'codecov'
end
