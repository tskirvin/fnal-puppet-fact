# fnal-puppet-_fact

`fact` manages system facts using the 'facts.d' system.

## Classes

### fact

Sets up and manages `/etc/facter/facts.d`.

### fact::manager

Manages three system facts: `primary`, `secondary`, and `manager`.  These
should define who is involved in managing the system.

## Definitions

### fact::string

Creates a simple file in /etc/facter/facts.d with a key/value pair.
