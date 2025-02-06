module("luci.controller.newgecoosac", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/newgecoosac") then
        return
    end

    local page
    page = entry({"admin", "services", "newgecoosac"}, cbi("newgecoosac"), _("New Gecoos AC"), 100)
    page.dependent = true
    page = entry({"admin", "services", "newgecoosac", "status"}, call("act_status"))
    page.leaf = true
end

function act_status()
    local e = {}
    local binpath = luci.sys.exec("uci get newgecoosac.@newgecoosac[0].program_path")
    e = {
        running = luci.sys.call("pgrep " .. binpath .. " >/dev/null") == 0
    }
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end