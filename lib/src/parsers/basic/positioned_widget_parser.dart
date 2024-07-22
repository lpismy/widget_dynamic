import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class PositionedWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Positioned(
      left: JsonClass.maybeParseDouble(map['left']),
      top: JsonClass.maybeParseDouble(map['top']),
      right: JsonClass.maybeParseDouble(map['right']),
      bottom: JsonClass.maybeParseDouble(map['bottom']),
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Positioned";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Positioned;
    return JsonClass.removeNull({
      "type": widgetName,
      "left": realWidget.left,
      "top": realWidget.top,
      "right": realWidget.right,
      "bottom": realWidget.bottom,
      "width": realWidget.width,
      "height": realWidget.height,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Positioned;
}
