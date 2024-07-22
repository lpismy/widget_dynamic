import 'package:expressions/expressions.dart';
import 'package:widget_dynamic/widget_dynamic.dart';

class ExpressionArgProcessor implements ArgProcessor {
  final _matchRegexp = RegExp(r'^\${\s*(.*?)\s*}$');

  @override
  bool support(dynamic arg, [int layer = 0]) {
    return arg != null && arg is String && _matchRegexp.hasMatch(arg);
  }

  dynamic process(WidgetDynamicRegistry registry, dynamic arg) {
    final regexpMatch = _matchRegexp.firstMatch(arg.toString());

    if (regexpMatch != null) {
      final expression = Expression.tryParse(regexpMatch.group(1)!);

      if (expression != null) {
        final evaluator = const ExpressionEvaluator();
        arg = evaluator.eval(expression, registry.values);
      }
    }

    return arg;
  }
}
