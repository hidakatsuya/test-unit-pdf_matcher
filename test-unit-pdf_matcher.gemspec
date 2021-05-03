require_relative 'lib/test/unit/pdf_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'test-unit-pdf_matcher'
  spec.version       = Test::Unit::PdfMatcher::VERSION
  spec.authors       = ['Katsuya Hidaka']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.summary       = 'PdfMatcher for Test::Unit'
  spec.description   = 'This gem provides assert_match_pdf assertion by PdfMatcher to Test::Unit.'
  spec.homepage      = 'https://github.com/hidakatsuya/pdf_matcher-test_adapters/test-unit-pdf_matcher'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'pdf_matcher', '>= 1.0.0'
  spec.add_dependency 'test-unit', '>= 3.4.0'
end
