#!/usr/bin/env zsh

while (( $# )); do
  case $1 in
    -d|--down) down=true;;
  esac
  shift
done

if [[ -n "$down" ]]; then
  docker compose down
else
  docker compose up -d
fi
