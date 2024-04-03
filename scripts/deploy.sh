#!/usr/bin/env zsh

while (( $# )); do
  case $1 in
    -d|--down) down=true;;
    -r|--restart) restart=true;;
  esac
  shift
done

if [[ -n "$down" ]]; then
  docker --context mk-prod compose down
elif [[ -n "$restart" ]]; then
  docker --context mk-prod compose up -d
else
  docker --context mk-prod compose up --build -d
fi
