#!/bin/bash

if [ -z `pidof swaylock` ]; then
  swaylock -c "#1e1e2e"
fi
