#!/bin/bash
set -e

cd ${GITHUB_WORKSPACE}
export PYLINTRC=/app/.pylintrc

# --- Parameters --- #
# $1: scan-folders
# $2: override parametewrs
# $3: html-file

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

set +e
pylint $1 $2 > report.json
exit_status=$?
set -e
mkdir -p $(dirname "$3")
pylint_report.py report.json --html-file $3

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "Exist Status=${exit_status}"