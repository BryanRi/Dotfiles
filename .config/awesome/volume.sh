#!/bin/bash

amixer -D pulse get Master | grep Left: | cut -f 2 -d '[' | cut -f 1 -d '%'
