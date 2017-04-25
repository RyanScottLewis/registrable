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
TEMPLATE_PATHS = Pathname.glob(TEMPLATES_PATH.join('**', '*').to_s)
template_output_paths = []

class RenderContext

  def self.render(input_path, output_path)
    new(input_path).render(output_path)
  end

  def initialize(path)
    @path = path
    @erb  = ERB.new(@path.read)
  end

  def file(path)
    File.read(path).strip
  end

  def render(path)
    contents = @erb.result(binding)

    path.open('w+') { |file| file.write(contents) }

    puts "Rendered #{@path} to #{path}"
  end

end

TEMPLATE_PATHS.each do |input_path|
  output_path = input_path.sub('templates/', '').sub_ext('')
  template_output_paths << output_path.to_s

  file output_path => input_path do
    RenderContext.render(input_path, output_path)
  end
end

desc 'Render templates'
task templates: template_output_paths

task default: [:spec, 'lint:auto_correct', :templates, :docs]
