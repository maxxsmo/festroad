# -*- encoding: utf-8 -*-
# stub: smtpapi 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "smtpapi".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Wataru Sato".freeze, "SendGrid".freeze]
  s.date = "2015-04-06"
  s.description = "Smtpapi library for SendGrid.".freeze
  s.email = ["awwa500@gmail.com".freeze, "community@sendgrid.com".freeze]
  s.homepage = "https://github.com/sendgrid/smtpapi-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.9".freeze
  s.summary = "Smtpapi library for SendGrid.".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0.29.0", "< 0.30.0"])
      s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0.29.0", "< 0.30.0"])
      s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0.29.0", "< 0.30.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
  end
end
