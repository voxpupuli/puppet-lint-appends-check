puppet-lint-appends-check
====================================

[![Gem Version](https://img.shields.io/gem/v/puppet-lint-absolute_classname-check.svg)](https://rubygems.org/gems/puppet-lint-appends-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-absolute_classname-check.svg)](https://rubygems.org/gems/puppet-lint-appends-check)
[![Coverage Status](https://img.shields.io/coveralls/puppet-community/puppet-lint-absolute_classname-check.svg)](https://coveralls.io/r/puppet-community/puppet-lint-appends-check?branch=master)

A puppet-lint plugin to check that classes are included by their absolute name.

## Installing

### From the command line

```shell
$ gem install puppet-lint-appends-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-appends-check', :require => false
```

## Checks

### Relative class name inclusion

Including a class by a relative name might lead to unexpected results.

#### What you have done

```puppet
$ssh_users = ['myself', 'someone']

class test {
  $ssh_users += ['someone_else']
}
```

#### What you should have done

```puppet
$ssh_users = ['myself', 'someone', 'someone_else']

# OR
$ssh_users = hiera('ssh_users')
```

#### Disabling the check

To disable this check, you can add `--no-appends-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-appends-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_appends')
```

