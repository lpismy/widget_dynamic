import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class ExpandedWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Expanded(
      flex: JsonClass.maybeParseInt(map['flex']) ?? 1,
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Expanded";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Expanded;
    return JsonClass.removeNull({
      "type": widgetName,
      "flex": realWidget.flex,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Expanded;
}
