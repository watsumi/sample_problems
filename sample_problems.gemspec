# frozen_string_literal: true

require_relative "lib/sample_problems/version"

Gem::Specification.new do |spec|
  spec.name          = "sample_problems"
  spec.version       = SampleProblems::VERSION
  spec.authors       = ["watsumi"]
  spec.email         = [""]

  spec.summary       = ["sample gem for my product"]
  spec.description   = ["sample gem for my product"]
  spec.homepage      = "https://github.com/watsumi/sample_problems"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.2")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/watsumi/sample_problems"
  spec.metadata["changelog_uri"] = "https://github.com/watsumi/sample_problems"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
