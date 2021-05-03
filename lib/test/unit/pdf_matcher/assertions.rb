# frozen_string_literal: true

require 'pdf_matcher'

module Test
  module Unit
    module PdfMatcher
      module Assertions
        # Passes if PdfMatcher.match?(`expected_pdf`, `actual_pdf`).
        # See https://github.com/hidakatsuya/pdf_matcher for details about PdfMatcher.
        #
        # @example
        #   assert_match_pdf pdf1_data, pdf2_data, output_diff_path: '/path/to/diff.pdf'
        #   assert_match_pdf '/path/to/1.pdf', '/path/to/2.pdf'
        #   assert_match_pdf Pathname('/path/to/1.pdf'), Pathname('/path/to/2.pdf')
        #
        def assert_match_pdf(expected_pdf, actual_pdf, output_diff_path: nil)
          full_messages = ['The PDF contents did not match.'].tap { |msgs|
            msgs << "Check #{output_diff_path} for details of the differences." if output_diff_path
          }
          assert_block(full_messages.join(' ')) do
            ::PdfMatcher.match?(expected_pdf, actual_pdf, output_diff: output_diff_path)
          end
        end
      end
    end
  end
end
