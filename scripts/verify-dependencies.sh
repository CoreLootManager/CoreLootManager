#!/bin/bash

set -e
verify_file()
{
  echo "Verify: ${1}"
  if [[ ! -f "${1}" ]]; then
    echo "File ${1} does not exist"
    exit 1
  fi

  if [ "${1: -4}" == ".xml" ]; then
    xq -r '.Ui.Script | if type=="array" then .[]."@file" else ."@file" end' "$1" | tr '\\' "/" | tr -d "\r" | while IFS="" read -r line || [ -n "$line" ]; do
      if [[ "$line" != "null" ]]; then
        verify_file "$(dirname $1)/$line"
      fi
    done
  elif [ "${1: -4}" == ".toc" ]; then
    cat $1 | grep -v '^#' | grep -v '^Libs' | grep -v '^\s*$' | tr '\\' "/" | tr -d "\r" | while IFS="" read -r line || [ -n "$line" ]; do
        verify_file "$line"
    done
  fi
}


verify_file "${PWD}/${1}"
