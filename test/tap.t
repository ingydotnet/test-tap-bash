#!/bin/bash

source lib/test/tap.bash

Test::Tap:init tests 2

Test::Tap:pass 'pass with label'
Test::Tap:pass
