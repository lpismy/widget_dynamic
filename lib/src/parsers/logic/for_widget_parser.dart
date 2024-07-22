import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class ForWidgetParser extends WidgetParser {
  @override
  List<Widget> parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    var itemName = map['item'] ?? 'item';
    var indexName = map['index'] ?? 'index';
  
    List<dynamic> list = map['list'];
    List<Widget> widgets = [];

    for (int i = 0; i < list.length; i++) {
      registry.setValue(itemName, list[i]);
      registry.setValue(indexName, i);

      Widget? child = WidgetDynamicBuilder.buildFromMap(
          map["child"], buildContext, registry);

      if (child != null) {
        widgets.add(child);
      }
    }

    if (widgets.length == 0) {
      widgets.add(SizedBox());
    }
    
    return widgets;
  }

  @override
  String get widgetName => "For";

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
