-- local name = ngx.var.arg_name or "Anonymous"
-- ngx.say("Hello, ", os.getenv("SIGNATURE"), "!")
ngx.say("Hello, ",ngx.req.get_uri_args()["hash"], "!")