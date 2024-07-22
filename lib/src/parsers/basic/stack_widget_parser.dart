import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class StackWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Stack(
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment']) ?? AlignmentDirectional.topStart,
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
      fit: ThemeDecoder.decodeStackFit(map['fit']) ?? StackFit.loose,
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Stack";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Stack;
    return JsonClass.removeNull({
      "type": widgetName,
      "alignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.alignment),
      "textDirection": ThemeEncoder.encodeTextDirection(realWidget.textDirection),
      "fit": ThemeEncoder.encodeStackFit(realWidget.fit),
      "clipBehavior": ThemeEncoder.encodeClip(realWidget.clipBehavior),
      "children": realWidget.children.map((child) => WidgetDynamicBuilder.export(child, buildContext)).toList(),
    });
  }

  @override
  Type get widgetType => Stack;
}
