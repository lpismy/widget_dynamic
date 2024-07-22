import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class SizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return SizedBox(
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "SizedBox";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox;
    return JsonClass.removeNull({
      "type": widgetName,
      "width": realWidget.width,
      "height": realWidget.height,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => SizedBox;
}
