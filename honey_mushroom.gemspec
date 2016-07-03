Gem::Specification.new do |s|
  s.name        = 'honey_mushroom'
  s.version     = '0.0.1'
  s.default_executable = 'honey_mushroom'
  s.platform    = Gem::Platform::RUBY

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors       = ["Riley Scheid"]
  s.date          = %q{2016-05-04}
  s.license       = %q{MIT}
  s.summary       = %q{Graphs & Traversals}
  s.description   = %q{Honey Mushroom builds and traverses common abstract data structures in Ruby}
  s.email         = %q{riley.k.scheid@gmail.com}
  s.files         = Dir['lib/**/*.rb']
  s.homepage      = 'http://www.github.com/sp33drac3r/honey_mushroom'
  s.test_files    = Dir['spec/**/*.rb']
  s.require_paths = ["lib"]
end

