# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gendalf}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Kasatenko"]
  s.date = %q{2011-02-16}
  s.description = %q{Trivial gem to support wizard application style creation.}
  s.email = %q{sky.31338@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/controllers/wizard_controller.rb", "lib/extensions/routes.rb", "lib/gendalf.rb", "lib/models/wizard_model.rb"]
  s.files = ["CHANGELOG", "Manifest", "Rakefile", "lib/controllers/wizard_controller.rb", "lib/extensions/routes.rb", "lib/gendalf.rb", "lib/models/wizard_model.rb", "gendalf.gemspec"]
  s.homepage = %q{http://github.com/skywriter/gendalf}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gendalf"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gendalf}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Trivial gem to support wizard application style creation.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, [">= 0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<activemodel>, [">= 0"])
      s.add_dependency(%q<actionpack>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<activemodel>, [">= 0"])
    s.add_dependency(%q<actionpack>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
