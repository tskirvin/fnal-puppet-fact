# p_fact::string
#
#   Definition to set a system fact to a string.  This drops a file into
#   /etc/facter/fact.d/${name}.txt containing 'name=value'.
#
# == Parameters
#
#   ensure    Defaults to 'present'
#   basedir   Defaults to '/etc/facter/facts.d'
#   hide_diff If true, suppress the diff message.
#   value     Value of the fact.  Defaults to 'UNDEFINED'.
#
# == Usage
#
#   p_fact::string { 'status': value => 'testing' }
#
define p_fact::string (
  $basedir   = '/etc/facter/facts.d',
  $ensure    = 'present',
  $hide_diff = false,
  $value     = 'UNDEFINED'
) {
  include p_fact

  $file    = "${basedir}/${name}.txt"
  $content = "${name}=${value}"
  if str2bool ($hide_diff) { $show_diff = false }
  else                     { $show_diff = true }

  file { $file:
    ensure    => $ensure,
    content   => $content,
    show_diff => $show_diff
  }
}
