# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "aeroplane"
  spec.version       = "0.1.0"
  spec.authors       = ["Emil Kovacev"]
  spec.email         = ["emilkovacev@gmail.com"]

  spec.summary       = "A simple academic theme + blog"
  spec.homepage      = "https://github.com/emilkovacev/aeroplane"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
