# Test::Unit::PdfMatcher

[![Test](https://github.com/hidakatsuya/test-unit-pdf_matcher/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/hidakatsuya/test-unit-pdf_matcher/actions/workflows/test.yml)

This gem provides `assert_match_pdf` assertion by [PdfMatcher](https://github.com/hidakatsuya/pdf_matcher) to Test::Unit.

## Prerequisites

This gem requires `diff-pdf`. See [the documentation of PdfMatcher](https://github.com/hidakatsuya/pdf_matcher#prerequisites) for details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'test-unit-pdf_matcher'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install test-unit-pdf_matcher

## Usage

Add this line to your `test_helper.rb`:

```ruby
require 'test/unit/pdf_matcher`
```

### assert_match_pdf

```ruby
assert_match_pdf pdf1_data, pdf2_data
assert_match_pdf '/path/to/1.pdf', '/path/to/2.pdf'
assert_match_pdf Pathnae('/path/to/1.pdf'), Pathname('/path/to/2.pdf')
```

You can generate a difference PDF by `output_diff_path` option:

```ruby
assert_match_pdf pdf1_data, pdf2_data, output_diff_path: '/path/to/diff.pdf'
```

### Configuring diff-pdf command options

```ruby
::PdfMatcher.config.diff_pdf_opts = %w(--dpi=300 --grayscale)
```

See `diff-pdf --help` for the available diff-pdf options.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
