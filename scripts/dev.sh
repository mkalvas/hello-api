#!/usr/bin/env zsh

ls src/**/*.rs | entr -r cargo run
