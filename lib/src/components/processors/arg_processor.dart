import 'raw_arg_processor.dart';
import 'iterable_arg_processor.dart';
import 'expression_arg_processor.dart';
import 'map_arg_processor.dart';
import 'package:widget_dynamic/widget_dynamic.dart';

abstract class ArgProcessor {
  bool support(dynamic arg, [int layer = 0]);
  dynamic process(
    WidgetDynamicRegistry registry,
    dynamic arg
  );
}

class ArgProcessors {
  static final List<ArgProcessor> defaults = [
    MapArgProcessor(),
    IterableArgProcessor(),
    ExpressionArgProcessor(),
    RawArgProcessor(),
  ];
}
