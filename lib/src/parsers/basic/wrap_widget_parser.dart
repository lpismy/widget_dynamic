import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class WrapWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Wrap(
      direction: ThemeDecoder.decodeAxis(map['direction']) ?? Axis.horizontal,
      alignment: ThemeDecoder.decodeWrapAlignment(map['alignment']) ?? WrapAlignment.start,
      spacing: JsonClass.maybeParseDouble(map['spacing']) ?? 0.0,
      runAlignment: ThemeDecoder.decodeWrapAlignment(map['runAlignment']) ?? WrapAlignment.start,
      runSpacing: JsonClass.maybeParseDouble(map['runSpacing']) ?? 0.0,
      crossAxisAlignment: ThemeDecoder.decodeWrapCrossAlignment(map['crossAxisAlignment']) ?? WrapCrossAlignment.start,
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
      verticalDirection: ThemeDecoder.decodeVerticalDirection(map['verticalDirection']) ?? VerticalDirection.down,
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Wrap";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Wrap;
    return JsonClass.removeNull({
      "type": widgetName,
      "direction": ThemeEncoder.encodeAxis(realWidget.direction),
      "alignment": ThemeEncoder.encodeWrapAlignment(realWidget.alignment),
      "spacing": realWidget.spacing,
      "runAlignment": ThemeEncoder.encodeWrapAlignment(realWidget.runAlignment),
      "runSpacing": realWidget.runSpacing,
      "crossAxisAlignment": ThemeEncoder.encodeWrapCrossAlignment(realWidget.crossAxisAlignment),
      "textDirection": ThemeEncoder.encodeTextDirection(realWidget.textDirection),
      "verticalDirection": ThemeEncoder.encodeVerticalDirection(realWidget.verticalDirection),
      "children": WidgetDynamicBuilder.exportWidgets(realWidget.children, buildContext),
    });
  }

  @override
  Type get widgetType => Wrap;
}
