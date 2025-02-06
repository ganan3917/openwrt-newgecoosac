# luci-app-newgecoosac 1.0

### 使用方法
> 下载源码
``` bash
 git clone https://github.com/ganan3917/luci-app-newgecoosac.git package/luci-app-newgecoosac
 ./scripts/feeds update -a
 ./scripts/feeds install -a
 make menuconfig
 # 找到 LuCI -> Applications, 选择 luci-app-newgecoosac, 保存后退出。
 make package/luci-app-newgecoosac/compile V=s
```