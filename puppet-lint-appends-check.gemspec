Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-appends-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://github.com/voxpupuli/puppet-lint-appends-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Vox Pupuli'
  spec.email       = 'voxpupuli@groups.io'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.summary     = 'A puppet-lint plugin to check that the appends operator (+=) is not used (removed in Puppet 4.0.0).'
  spec.description = <<-EOF
    A puppet-lint plugin to check that the appends operator (+=) is not used (removed in Puppet 4.0.0).
  EOF

  spec.required_ruby_version = '>= 2.7.0'

  spec.add_dependency 'puppet-lint', '>= 3', '< 5'
  spec.add_development_dependency 'mime-types', '~> 3.4', '>= 3.4.1'
end
