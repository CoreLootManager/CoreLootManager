#!/bin/sh

ls tests/ | grep -v '_' | xargs -I {} lua -l tests/_bootstrap tests/{}
