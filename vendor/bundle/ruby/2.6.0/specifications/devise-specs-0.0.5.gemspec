# -*- encoding: utf-8 -*-
# stub: devise-specs 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "devise-specs".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrii Ponomarov".freeze]
  s.date = "2021-07-26"
  s.email = "andrii.ponomarov@gmail.com".freeze
  s.homepage = "https://github.com/ponosoft/devise-specs".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.2.28".freeze
  s.summary = "Generates the Devise acceptance tests.".freeze

  s.installed_by_version = "3.2.28" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<devise>.freeze, ["~> 4.8"])
    s.add_development_dependency(%q<aruba>.freeze, ["~> 1.1", ">= 1.1.2"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0", ">= 13.0.6"])
  else
    s.add_dependency(%q<devise>.freeze, ["~> 4.8"])
    s.add_dependency(%q<aruba>.freeze, ["~> 1.1", ">= 1.1.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0", ">= 13.0.6"])
  end
end
