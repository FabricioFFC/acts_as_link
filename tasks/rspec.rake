require 'rubygems'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:test) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts << '--format specdoc'
end
