function program_exists(program)
    local handle = io.popen('which ' .. program)
    if not handle then
        -- 处理打开失败的情况
        return false
    end
    local result = handle:read('*a')
    handle:close()
    return result ~= ''
end

local m
if program_exists("/usr/bin/newgecoosac") then
    m = Map("newgecoosac", translate("New Gecoos AC"), translate("Batch management Gecoos AP,Default password:admin"))
else
    m = Map("newgecoosac", translate("New Gecoos AC"), translate("Batch management Gecoos AP,Default password:admin") .. "<br>" .. translate("The AC program does not exist, please check."))
end

m:section(SimpleSection).template  = "newgecoosac/newgecoosac_status"

local s = m:section(TypedSection, "newgecoosac", translate("Global Settings"))
s.addremove = false
s.anonymous = true

-- 启用开关
local enable = s:option(Flag, "enabled", translate("Enabled AC"))
enable.rmempty = false

-- 程序路径
local o = s:option(Value, "program_path", translate("Program Path"))
o.placeholder = translate("/usr/bin/newgecoosac")
o.default = "/usr/bin/newgecoosac"
o.rmempty = false

-- 监听端口
o = s:option(Value, "port", translate("Set interface port"))
o.placeholder = 60650
o.default = 60650
o.datatype = "port"
o.rmempty = false

-- 数据目录
o = s:option(Value, "data_dir", translate("Data Directory"))
o.placeholder = translate("/etc/newgecoosac/")
o.default = "/etc/newgecoosac/"
o.rmempty = false

-- 错误日志
o = s:option(Value, "error_log", translate("Error Log"))
o.placeholder = translate("/var/log/newgecoosac.log")
o.default = "/var/log/newgecoosac.log"
o.rmempty = false

-- 上传按钮
local upload = s:option(FileUpload, "upload", translate("Upload File"))
upload.title = translate("Upload File")
upload.description = translate("Upload AP upgrade firmware")

-- 新增运行参数设置项
o = s:option(Value, "run_params", translate("Running Parameters"))
o.placeholder = translate("Enter additional running parameters")
o.default = ""
o.rmempty = true

return m