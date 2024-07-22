import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class FlexWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Flex(
      direction: ThemeDecoder.decodeAxis(map['direction']) ?? Axis.horizontal,
      mainAxisAlignment: ThemeDecoder.decodeMainAxisAlignment(map['mainAxisAlignment']) ?? MainAxisAlignment.start,
      crossAxisAlignment: ThemeDecoder.decodeCrossAxisAlignment(map['crossAxisAlignment']) ?? CrossAxisAlignment.center,
      mainAxisSize: ThemeDecoder.decodeMainAxisSize(map['mainAxisSize']) ?? MainAxisSize.max,
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
      verticalDirection: ThemeDecoder.decodeVerticalDirection(map['verticalDirection']) ?? VerticalDirection.down,
      textBaseline: ThemeDecoder.decodeTextBaseline(map['textBaseline']),
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Flex";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Flex;
    return JsonClass.removeNull({
      "type": widgetName,
      "direction": ThemeEncoder.encodeAxis(realWidget.direction),
      "mainAxisAlignment": ThemeEncoder.encodeMainAxisAlignment(realWidget.mainAxisAlignment),
      "crossAxisAlignment": ThemeEncoder.encodeCrossAxisAlignment(realWidget.crossAxisAlignment),
      "mainAxisSize": ThemeEncoder.encodeMainAxisSize(realWidget.mainAxisSize),
      "textDirection": ThemeEncoder.encodeTextDirection(realWidget.textDirection),
      "verticalDirection": ThemeEncoder.encodeVerticalDirection(realWidget.verticalDirection),
      "textBaseline": ThemeEncoder.encodeTextBaseline(realWidget.textBaseline),
      "clipBehavior": ThemeEncoder.encodeClip(realWidget.clipBehavior),
      "children": WidgetDynamicBuilder.exportWidgets(realWidget.children, buildContext),
    });
  }

  @override
  Type get widgetType => Flex;
}
