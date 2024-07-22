import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class CenterWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Center(
      widthFactor: JsonClass.maybeParseDouble(map['widthFactor']),
      heightFactor: JsonClass.maybeParseDouble(map['heightFactor']),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Center";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Center;
    return JsonClass.removeNull({
      "type": widgetName,
      "widthFactor": realWidget.widthFactor,
      "heightFactor": realWidget.heightFactor,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Center;
}
