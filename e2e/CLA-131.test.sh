#!/bin/bash
# Test: CLA-131 comment should exist in README.md with date, year, and author
set -e

README="$(dirname "$0")/../README.md"

PASS=true

if grep -q "CLA-131" "$README"; then
  echo "PASS: CLA-131 comment found in README.md"
else
  echo "FAIL: CLA-131 comment not found in README.md"
  PASS=false
fi

if grep "CLA-131" "$README" | grep -q "Date:"; then
  echo "PASS: CLA-131 comment contains date"
else
  echo "FAIL: CLA-131 comment does not contain date"
  PASS=false
fi

if grep "CLA-131" "$README" | grep -q "Year:"; then
  echo "PASS: CLA-131 comment contains year"
else
  echo "FAIL: CLA-131 comment does not contain year"
  PASS=false
fi

if grep "CLA-131" "$README" | grep -q "Author:"; then
  echo "PASS: CLA-131 comment contains author"
else
  echo "FAIL: CLA-131 comment does not contain author"
  PASS=false
fi

if [ "$PASS" = true ]; then
  exit 0
else
  exit 1
fi
