IOS插件制作流程

前期准备 ios环境 xcode 14及以上 下载开发插件需要的sdk包[](https://nativesupport.dcloud.net.cn/NativePlugin/course/ios.html)
	xcode打包生成插件文件
打开xcode创建新工程
![image-20250320100952304](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320100952304.png)

​	![image-20250320101030455](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101030455.png)

![image-20250320101044932](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101044932.png)

![image-20250320101103280](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101103280.png)

![image-20250320101149936](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101149936.png)

![image-20250320101314217](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101314217.png)

![image-20250320101327252](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101327252.png)

![image-20250320101337840](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101337840.png)

![image-20250320101350389](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101350389.png)

![image-20250320101452460](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101452460.png)

![image-20250320101504897](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101504897.png)

![image-20250320101649138](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101649138.png)

![image-20250320101700438](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101700438.png)

![image-20250320101709992](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101709992.png)

​		将生成的framework集成成uniapp可以使用的插件

插件目录如下图所示

​	![image-20250320101827007](C:\Users\17712\AppData\Roaming\Typora\typora-user-images\image-20250320101827007.png)

package.json示例

	{
  "name": "DCTestUniPlugin", // 插件npm名称（全小写，无空格）
  "id": "DCTestUniPlugin",/ 全局唯一ID（建议反向域名格式）
  "version": "1.0.0",
  "description": "基于官方示例改造的蓝牙插件",
  "_dp_type": "nativeplugin",
  "_dp_nativeplugin": {
    "ios": {
      "plugins": [
        {
          "type": "module",// 模块类型（module/component）
          "name": "DCTestUniPlugin",  // JS调用时的模块名（与uni.requireNativePlugin对应）
          "class": "TestModule"  // 实际OC类名（必须与代码中一致）头文件中的实现名
        }
      ],
      "frameworks": [    // 依赖的系统库
        "MapKit.framework" 
      ],
      "integrateType": "framework",// 集成方式（framework/library）
      "deploymentTarget": "11.0"// 最低支持iOS版本
    }
  }
}