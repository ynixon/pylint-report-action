#!/bin/bash
set -e

cd ${GITHUB_WORKSPACE}

# --- Parameters --- #
# $1: scan-folders
# $2: override parametewrs
# $3: html-file

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

mkdir $(dirname "$3")
export PYTHONPATH=$(which python)
echo -e "pylint \"$1\" \"$2\" \| pylint_report.py \> \"$3\""
pwd
ls -la
ls -la /
pylint "$1" "$2"| pylint_report.py > "$3"

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
