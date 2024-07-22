
import 'package:widget_dynamic/widget_dynamic.dart';
class IterableArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg, [int layer = 0]) => arg != null && arg is Iterable;

  @override
  dynamic process(
    WidgetDynamicRegistry registry,
    dynamic arg
  ) {
    final iterableArg = arg as Iterable;
    final processedArgs = [];
    for (var arg in iterableArg) {
      processedArgs.add(registry.processArgs(arg));
    }


    return processedArgs;
  }
}
