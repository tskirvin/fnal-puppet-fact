# fnal-puppet-p\_fact

p\_fact manages system facts using the 'facts.d' system.

## Classes

### p_fact

Sets up and manages `/etc/facter/facts.d`.

### p_fact::manager

Manages three system facts: `primary`, `secondary`, and `manager`.  These
should define who is involved in managing the system.

## Definitions

### p_fact::string

Creates a simple file in /etc/facter/facts.d with a key/value pair.
