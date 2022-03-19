local cjson = require "cjson.safe"
-- local symmetric = require "symmetric"
-- local allowedkeys = {"abc123", "def456", "hij789"}
-- local function badAuth()
--     ngx.status = 401
--     ngx.say(cjson.encode({status="error",errmessage="Authentication Failed"}))
--     ngx.exit(401)
-- end

-- local function isAuthorised (key)
--     for index, value in ipairs(allowedkeys) do
--         if value == key then
--             return true
--         end
--     end
--     return false
-- end
local hash = ngx.req.get_uri_args()["hash"]
if hash == nil then
    ngx.status = 401
    ngx.say(cjson.encode({status="error",errmessage="Authentication Failed"}))
    ngx.exit(401)
end