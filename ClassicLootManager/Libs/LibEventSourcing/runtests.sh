#!/bin/sh

ls tests/ | grep -v '_' | xargs -I {} lua -l tests/_bootstrap tests/{}
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32;1mAll tests passed\e[0m"
else
  echo "\e[31;1mSome tests failed\e[0m"
  exit 1
fi

ls tests/ | grep -v '_' | xargs -I {} lua -l tests/_bootstrap_wow10 tests/{}
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "\e[32;1mAll tests passed\e[0m"
else
  echo "\e[31;1mSome tests failed\e[0m"
  exit 1
fi
