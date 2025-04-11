curl_post_simple() {
    local url="{$1:-}"
    # -X specifies the request method
    # -H specifies the request header, must be a large string (e.g. -H "Content-Type: application/json; charset=UTF-8")
    # To include a JSON payload,
    # example {'foo':'bar', 'fizz': 'buzz'} => -d foo=bar -d fizz=buzz
    curl -X POST $url
}
