    ./jq -r '.Objects[] | select(.b | type == "string") | select(.b | startswith("x")) | .a'
