    ./jq -r '.Objects[] | select(.b | type == "string") | select(.b == "x") | .a'
