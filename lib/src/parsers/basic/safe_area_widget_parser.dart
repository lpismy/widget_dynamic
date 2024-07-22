import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class SafeAreaWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return SafeArea(
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
      left: JsonClass.maybeParseBool(map['left']) ?? true,
      top: JsonClass.maybeParseBool(map['top']) ?? true,
      right: JsonClass.maybeParseBool(map['right']) ?? true,
      bottom: JsonClass.maybeParseBool(map['bottom']) ?? true,
      minimum: ThemeDecoder.decodeEdgeInsets(map['minimum'], validate: false) ?? EdgeInsets.zero,
      maintainBottomViewPadding: map['maintainBottomViewPadding'] ?? false
    );
  }

  @override
  String get widgetName => "SafeArea";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SafeArea;
    return JsonClass.removeNull({
      "type": widgetName,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext),
      "left": realWidget.left,
      "top": realWidget.top,
      "right": realWidget.right,
      "bottom": realWidget.bottom,
      "minimum": ThemeEncoder.encodeEdgeInsets(realWidget.minimum),
      "maintainBottomViewPadding": realWidget.maintainBottomViewPadding,
    });
  }

  @override
  Type get widgetType => SafeArea;
}
