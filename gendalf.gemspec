# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gendalf}
  s.version = "0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Kasatenko"]
  s.date = %q{2011-03-09}
  s.description = %q{Trivial gem to support wizard application style creation.}
  s.email = %q{sky.31338@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "README.markdown", "lib/controllers/wizard_controller.rb", "lib/extensions/routes.rb", "lib/gendalf.rb", "lib/models/wizard_model.rb"]
  s.files = ["CHANGELOG", "Manifest", "README.markdown", "Rakefile", "gendalf.gemspec", "lib/controllers/wizard_controller.rb", "lib/extensions/routes.rb", "lib/gendalf.rb", "lib/models/wizard_model.rb"]
  s.homepage = %q{http://github.com/skywriter/gendalf}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gendalf", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gendalf}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Trivial gem to support wizard application style creation.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0.4"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0.4"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<activemodel>, [">= 3.0.4"])
      s.add_dependency(%q<actionpack>, [">= 3.0.4"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<activemodel>, [">= 3.0.4"])
    s.add_dependency(%q<actionpack>, [">= 3.0.4"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
