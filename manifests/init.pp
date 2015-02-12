# p_fact
#
#   Manage /etc/facter/facts.d, mostly setting purge => true
#
class p_fact {
  file { '/etc/facter': ensure => directory }
  file { '/etc/facter/facts.d':
    ensure  => directory,
    purge   => true,
    recurse => true
  }
}
