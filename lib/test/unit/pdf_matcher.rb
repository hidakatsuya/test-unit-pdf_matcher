# frozen_string_literal: true

require 'test/unit'

require_relative 'pdf_matcher/version'
require_relative 'pdf_matcher/assertions'

module Test
  module Unit
    TestCase.include PdfMatcher::Assertions
  end
end
