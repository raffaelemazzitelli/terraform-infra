printenv | jq -Rn '
  [inputs | 
   split("=") | 
   {(.[0]): .[1]}] | add
'