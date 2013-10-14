#!/bin/bash

source lib/test/tap.bash

Test::Tap:init
Test::Tap:plan tests 2

Test::Tap:pass 'pass with label'
Test::Tap:pass

# vim: set sw=2 ft=sh:
