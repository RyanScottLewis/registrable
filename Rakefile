require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/version_task'
require 'rubocop/rake_task'
require 'yard'
require 'erb'

RSpec::Core::RakeTask.new(:test)

Rake::VersionTask.new

RuboCop::RakeTask.new(:lint)

YARD::Rake::YardocTask.new(:docs)

TEMPLATES_PATH = Pathname.new('templates')
TEMPLATE_PATHS = FileList[TEMPLATES_PATH.join('**', '*').to_s]
README_INPUT   = TEMPLATES_PATH.join('README.md.erb')
README_OUTPUT  = Pathname.new('README.md')

class RenderContext

  def self.render(input_path, output_path)
    new(input_path).render(output_path)
  end

  def initialize(path)
    @erb = ERB.new(path.read)
  end

  def file(path)
    File.read(path).strip
  end

  def render(path)
    contents = @erb.result(binding)

    README_OUTPUT.open('w+') { |file| file.write(contents) }
  end

end

file README_OUTPUT => [README_INPUT, TEMPLATE_PATHS] do
  RenderContext.render(README_INPUT, README_OUTPUT)
end

task default: [:spec, 'lint:auto_correct', :docs, README_OUTPUT]
