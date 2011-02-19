Gem::Specification.new do |s|
  s.name        = "acts_as_link"
  s.version     = "0.0.6"
  s.author      = "Fabrício Ferrari de Campos"
  s.email       = "fabricio@vizir.com.br"
  s.homepage    = "http://github.com/fabricioffc/acts_as_link"
  s.summary     = "An easy way to make your link acts as link"
  s.description = "ActsAsLink provides: verification if a link is broken; verification if a link is to an image; shortening links with bit.ly. Enjoy! ;)"

  s.files = Dir["{lib,spec}/**/*"]
  s.files += %w(Rakefile .gemtest)
  s.require_path = "lib"

  s.add_dependency 'bitly', '0.6.1'

  s.add_development_dependency 'rspec', '~> 1.3.0'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
