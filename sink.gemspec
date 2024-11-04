# frozen_string_literal: true

require_relative "lib/sink/version"

Gem::Specification.new do |s|
  s.name = "test-test-sink-test-test2"
  s.version = Sink::VERSION
  s.summary = "Ruby library to access the Sink API"
  s.authors = ["Sink"]
  s.email = "dev@stainlessapi.com"
  s.files = Dir["lib/**/*.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://rubydoc.info/github/stainless-sdks/sink-ruby-public"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/sink-ruby-public"
  s.metadata["rubygems_mfa_required"] = "true"
end
