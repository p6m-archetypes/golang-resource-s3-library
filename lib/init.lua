-- golang-resource-s3-library main module.
-- Renders S3 client setup into the service's storage package.
--
-- The calling archetype is responsible for adding the corresponding
-- Go module dependencies:
--   github.com/aws/aws-sdk-go-v2
--   github.com/aws/aws-sdk-go-v2/config
--   github.com/aws/aws-sdk-go-v2/credentials
--   github.com/aws/aws-sdk-go-v2/service/s3
--
-- API (called from a parent archetype):
--   local s3 = require("golang-resource-s3")
--   s3.render(context, { destination = context:get("project-name") })

local M = {}

function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
