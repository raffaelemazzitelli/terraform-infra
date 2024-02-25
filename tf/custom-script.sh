function output(){
    echo "{\"test\":\"$(env | base64)\"}"
}

output | jq