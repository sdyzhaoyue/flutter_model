
import 'package:flutter/services.dart';

class ChannelUtil {
  static const BasicMessageChannel messageChannel = BasicMessageChannel("com.supplinkcloud.merchant", StandardMessageCodec());

  // 发送消息
  static sendMethod() {
    messageChannel.send("AAA");
  }
}