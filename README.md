puppet-lint-appends-check
====================================

[![Build Status](https://img.shields.io/travis/puppet-community/puppet-lint-appends-check.svg)](https://travis-ci.org/puppet-community/puppet-lint-appends-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-lint-appends-check.svg)](https://rubygems.org/gems/puppet-lint-appends-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-appends-check.svg)](https://rubygems.org/gems/puppet-lint-appends-check)
[![Coverage Status](https://img.shields.io/coveralls/puppet-community/puppet-lint-appends-check.svg)](https://coveralls.io/r/puppet-community/puppet-lint-appends-check?branch=master)
[![Gemnasium](https://img.shields.io/gemnasium/puppet-community/puppet-lint-appends-check.svg)](https://gemnasium.com/puppet-community/puppet-lint-appends-check)

A puppet-lint plugin to check that the append (+=) operator is unused.

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

### Append operator use

Use of the append operator can lead to unexpected behavior.

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

#### Auto fixing

There is not one way to properly fix this type of style error, so
running puppet-lint's fix feature will not have any effect.

#### Disabling the check

To disable this check, you can add `--no-appends-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-appends-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_appends')
```

