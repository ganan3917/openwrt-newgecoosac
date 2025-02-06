local fs = require "nixio.fs"
local sys = require "luci.sys"
local http = require "luci.http"

local M = {}

function M.index()
    if not fs.access("/etc/config/newgecoosac") then
        return
    end

    local page
    page = entry({"admin", "services", "newgecoosac"}, cbi("newgecoosac"), _("New Gecoos AC"), 100)
    page.dependent = true
    page = entry({"admin", "services", "newgecoosac", "status"}, call("act_status"))
    page.leaf = true
end

function M.act_status()
    local e = {}
    local binpath = sys.exec("uci get newgecoosac.@newgecoosac[0].program_path")
    if binpath then
        e = {
            running = sys.call("pgrep " .. binpath .. " >/dev/null") == 0
        }
    else
        e = { running = false }
    end
    http.prepare_content("application/json")
    http.write_json(e)
end

return M