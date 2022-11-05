#!/bin/sh

ls tests/ | grep -v '_' | xargs -I {} lua -l tests/_bootstrap tests/{}
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32;1mAll tests passed"
else
  echo "\e[31;1mSome tests failed"
  exit 1
fi
