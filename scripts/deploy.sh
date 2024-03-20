#!/usr/bin/env zsh

while (( $# )); do
  case $1 in
    -d|--down) down=true;;
  esac
  shift
done

if [[ -n "$down" ]]; then
  docker --context mk-prod compose down
else
  docker --context mk-prod compose up --build -d
fi
