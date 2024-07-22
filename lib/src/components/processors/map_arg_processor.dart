import 'package:widget_dynamic/widget_dynamic.dart';

class MapArgProcessor implements ArgProcessor {
  int _layer = 0;
  @override
  bool support(dynamic arg, [int layer = 0]) {
    var isMap = arg != null && arg is Map;
    _layer = layer;

    // 处理一层组件的参数
    if (isMap && layer > 0 && arg.containsKey('type')) {
      return false;
    }

    return isMap;
  }

  @override
  dynamic process(
    WidgetDynamicRegistry registry,
    dynamic args
  ) {
    final processedMapArg = {};
    final mapArg = args as Map;
    for (var entrie in mapArg.entries) {
      processedMapArg[entrie.key] = registry.processArgs(entrie.value, _layer + 1);
    }
    return processedMapArg;
  }
}
