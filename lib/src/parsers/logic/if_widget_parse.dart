import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class IfWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
  
    bool logic = JsonClass.maybeParseBool(map['logic']) ?? false;

    if (logic) {
      return WidgetDynamicBuilder.buildFromMap(
        map["child"], buildContext, registry);
    } else {
      return map.containsKey('elseChild') ? WidgetDynamicBuilder.buildFromMap(
        map["elseChild"], buildContext, registry) : SizedBox();
    }
  }

  @override
  String get widgetName => "If";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    Map<String, dynamic> json = {
      "type": widgetName,
    };
    return json;
  }

  @override
  Type get widgetType => Widget;
}
