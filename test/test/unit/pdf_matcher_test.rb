# frozen_string_literal: true

require 'test_helper'
require 'tempfile'

class Test::Unit::PdfMatcherTest < Test::Unit::TestCase
  test 'pass' do
    pdf1_data = Prawn::Document.new { text 'Hello' }.render
    assert_match_pdf pdf1_data, pdf1_data
  end

  test 'fail' do
    pdf1_data = Prawn::Document.new { text 'Hello' }.render
    pdf2_data = Prawn::Document.new { text 'Hi' }.render

    open_tempfile do |diff_pdf_file|
      assert_raise ::Test::Unit::AssertionFailedError do
        assert_match_pdf pdf1_data, pdf2_data, output_diff_path: diff_pdf_file.path
      end
      assert_match %r|^%PDF-|, File.binread(diff_pdf_file.path)
    end
  end

  def open_tempfile
    tmpfile = Tempfile.open
    yield tmpfile
  ensure
    tmpfile.close!
  end
end
