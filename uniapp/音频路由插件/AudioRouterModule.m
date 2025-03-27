#import "AudioRouterModule.h"

@implementation AudioRouterModule

// 导出方法给JS调用（方法名需与JS侧一致）
UNI_EXPORT_METHOD(@selector(switchAudioOutput:callback:));

// 核心方法：切换音频输出路由
- (void)switchAudioOutput:(NSDictionary *)params callback:(UniModuleKeepAliveCallback)callback {
    // 解析参数
    BOOL useBluetooth = [[params objectForKey:@"useBluetooth"] boolValue];
    NSError *error = nil;
    
    // 获取音频会话实例
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 1. 配置音频会话类别
    [session setCategory:AVAudioSessionCategoryPlayAndRecord
            withOptions:AVAudioSessionCategoryOptionAllowBluetoothA2DP | AVAudioSessionCategoryOptionDefaultToSpeaker
                  error:&error];
    
    // 2. 切换输出设备
    if (useBluetooth) {
        // 优先使用已连接的蓝牙设备
        [session overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error];
    } else {
        // 强制切换到扬声器
        [session overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:&error];
    }
    
    // 3. 回调结果
    if (error) {
        NSDictionary *result = @{
            @"success": @NO,
            @"error": error.localizedDescription ?: @"Unknown error"
        };
        callback(result, NO); // NO表示不保持回调存活
    } else {
        callback(@{@"success": @YES}, NO);
    }
}

@end