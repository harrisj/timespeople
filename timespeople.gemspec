# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{timespeople}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Harris"]
  s.date = %q{2009-03-03}
  s.description = %q{TODO}
  s.email = %q{jharris@nytimes.com}
  s.files = ["VERSION.yml", "lib/times_people", "lib/times_people/base.rb", "lib/times_people/exceptions.rb", "lib/times_people/user.rb", "lib/times_people.rb", "lib/timespeople.rb", "test/test_helper.rb", "test/times_people", "test/times_people/test_base.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/harrisj/timespeople}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A simple gem for the TimesPeople API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
