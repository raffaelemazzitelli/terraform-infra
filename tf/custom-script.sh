#!/bin/bash

# Read all environment variables, filter out entries without '=', and convert them to JSON
printenv | grep '=' | jq -Rn '
  [inputs | 
   split("="; 2) | 
   {(.[0]): .[1]}] | add
'
