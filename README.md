# fnal-puppet-fact

The `fact` module manages system facts using the 'facts.d' system.
Basically, puppet creates files that facter then uses to create system
facts down the road.

More information about facter is at https://github.com/puppetlabs/facter .

## Classes

### fact

Sets up and manages `/etc/facter/facts.d`, primarily by setting 'purge
=> true' - that is, facts not managed by puppet will be automatically
deleted.

### fact::manager

This is a combination of a sample fact and a way to track who is in charge
of your hosts.  This manifest manages three system facts: `primary`,
`secondary`, and `manager`, based on three passed-in arrays:

    * primary   - array of user ids
    * secondary - array of user ids
    * skip - when generating the 'manager' fact, skip these IDs.

Duplicate entries are discarded.

## Definitions

### fact::string

Definition to set a system fact to a string.  This drops a file into
/etc/facter/fact.d/${name}.txt containing 'name=value'.

Parameters:

    * ensure - defaults to 'present'
    * basedir - defaults to '/etc/facter/facts.d'
    * hide_diff - if true, suppress the diff message.  Default: false.
    * value - value of the fact.  Defaults to 'UNDEFINED'.

Sample usage:

    fact::string { 'status': value => 'testing' }
