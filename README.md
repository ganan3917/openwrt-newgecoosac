### luci-app-newgecoosac 25.1.6

### 使用方法
> 下载源码
``` bash
 git clone https://github.com/ganan3917/luci-app-newgecoosac.git newgecoosac/luci-app-newgecoosac
 ./scripts/feeds update -a
 ./scripts/feeds install -a
 make menuconfig
 # 找到 LuCI -> Applications, 选择 luci-app-newgecoosac, 保存后退出。
 make V=s -j2
```
