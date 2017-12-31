# Quotify [![Build Status](https://travis-ci.org/jusleg/quotify-ruby.svg?branch=master)](https://travis-ci.org/jusleg/quotify-ruby) [![codecov](https://codecov.io/gh/jusleg/quotify-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/jusleg/quotify-ruby) [![Maintainability](https://api.codeclimate.com/v1/badges/972d13f147a8cc352acc/maintainability)](https://codeclimate.com/github/jusleg/quotify-ruby/maintainability)

Add random quotes to your app effortlessly

## How to install

Install via:
```
gem install quotify
```

Then start using it:
```
require 'quotify'
```

## Usage

You can generate a new quote quickly by calling the `generate` function:
```
puts Quotify.generate
=> You must be the change you wish to see in the world. - Logan Paul

super_fancy_quote = Quotify.generate
puts super_fancy_quote.author
=> Sarah Palin
puts super_fancy_quote.quote
=> C++ supports OOP
```

generate returns a [`Quotify::Quote`](https://github.com/jusleg/quotify-ruby/blob/master/lib/quotify/quote.rb) object. You can then use your favorite methods on it (`to_s`, `to_h`, `to_json`). Currently XML is not supported. If there is a demand, we will consider adding it in the next release.

You can also use the fancy `spacer` option in `to_s` to create majestic quotes:
```
Quote.new.to_s(spacer: " 🔥 ")
 => Those were alternative facts 🔥 Soulja Boy
 ```

## Contributing
You can run all the tests with:
```
bundle exec rake tests
```

If you wish to add new quotes, head over to [`quotes.yml`](https://github.com/jusleg/quotify-ruby/blob/master/lib/quotify/quotes.yml) and do a PR to add new ones. I'll merge pretty much everything for this file (given that it doesn't mess up the yaml).

## Tip Jar
Since maintaining quotify is my full time job, I need money to pay the bills. Please donate your crypto pocket change to these addresses.

**ETH: 0x67833AA7fa3eA8a515860C70c4b99dAe028D81da**

**BTC: 15TsW6spmpY71qq5V14mq2CzCxasnap94v**

**LTC: LZsHU9mp7C4wn7g1MxKRpjeJogbkajSRoe**

**BCH: LOL**

## LICENSE

This gem is MIT licensed, please see LICENSE for more information.
