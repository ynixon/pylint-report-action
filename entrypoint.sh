#!/bin/bash
set -e

# --- Parameters --- #
# $1: scan-folders
# $2: override parametewrs
# $3: html-file

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

pylint "$1" "$2"| pylint_report.py > "$3"

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
