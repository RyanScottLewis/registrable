guard :rspec, cmd: 'bin/rspec' do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  watch(%r{lib/(.+)\.rb$}) { |match| "spec/unit/#{match[1]}_spec.rb" }
end

guard :rubocop, all_on_start: false, cli: '--config .rubocop.yml --auto-correct --format fuubar' do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :yard, server: false do
  watch(/^(README|LICENSE|CODE_OF_CONDUCT)/)
  watch(%r{lib\/.+\.rb})
  watch(/.yardopts/)
end
