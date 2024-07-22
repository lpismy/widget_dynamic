import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class RowWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Row(
      mainAxisAlignment: ThemeDecoder.decodeMainAxisAlignment(map['mainAxisAlignment'], validate: false) ?? MainAxisAlignment.start,
      mainAxisSize: ThemeDecoder.decodeMainAxisSize(map['mainAxisSize'], validate: false) ?? MainAxisSize.max,
      crossAxisAlignment: ThemeDecoder.decodeCrossAxisAlignment(map['crossAxisAlignment'], validate: false) ?? CrossAxisAlignment.center,
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection'], validate: false),
      verticalDirection: ThemeDecoder.decodeVerticalDirection(map['verticalDirection'], validate: false) ?? VerticalDirection.down,
      textBaseline: ThemeDecoder.decodeTextBaseline(map['textBaseline'], validate: false),
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry)
    );
  }

  @override
  String get widgetName => "Row";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Row;
    return JsonClass.removeNull({
      "type": widgetName,
      "mainAxisAlignment": ThemeEncoder.encodeMainAxisAlignment(realWidget.mainAxisAlignment),
      "mainAxisSize": ThemeEncoder.encodeMainAxisSize(realWidget.mainAxisSize),
      "crossAxisAlignment": ThemeEncoder.encodeCrossAxisAlignment(realWidget.crossAxisAlignment),
      "textDirection": ThemeEncoder.encodeTextDirection(realWidget.textDirection),
      "verticalDirection": ThemeEncoder.encodeVerticalDirection(realWidget.verticalDirection),
      "textBaseline": ThemeEncoder.encodeTextBaseline(realWidget.textBaseline),
      "children": WidgetDynamicBuilder.exportWidgets(realWidget.children, buildContext),
    });
  }

  @override
  Type get widgetType => Row;
}
