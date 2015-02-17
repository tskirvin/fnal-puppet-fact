# fact::manager
#
#   Set the system manager via facter.  The system manager is an array of
#   individuals from puppet that are responsible for this system.
#
# == Parameters
#
#   primary   Array of user ids
#   secondary Array of user ids
#   skip      When generating 'manager', skip these IDs.
#
# == Requirements
#
#   stdlib
#
class fact::manager (
  $primary   = [ 'unknown' ],
  $secondary = [ 'unknown' ],
  $skip      = [ 'unknown', 'none', 'skip' ]
) {
  validate_array ($primary)
  validate_array ($secondary)
  validate_array ($skip)

  fact::string { 'primary':   value => join (sort (unique ($primary)), ',') }
  fact::string { 'secondary': value => join (sort (unique ($secondary)), ',') }

  ## Contains both of the above, minus any 'skip' values
  fact::string { 'manager': value => template('fact/manager.erb') }
}
