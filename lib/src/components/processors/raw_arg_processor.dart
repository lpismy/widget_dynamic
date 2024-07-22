import 'package:widget_dynamic/widget_dynamic.dart';

class RawArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg, [int layer = 0]) {
    return true;
  }

  @override
  dynamic process(
    WidgetDynamicRegistry registry,
    dynamic arg
  ) {
    return arg;
  }
}
