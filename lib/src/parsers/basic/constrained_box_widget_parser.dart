import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class ConstrainedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return ConstrainedBox(
      constraints: ThemeDecoder.decodeBoxConstraints(map['constraints'], validate: false) ?? BoxConstraints(),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "ConstrainedBox";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ConstrainedBox;
    return JsonClass.removeNull({
      "type": widgetName,
      "constraints": ThemeEncoder.encodeBoxConstraints(realWidget.constraints),
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => ConstrainedBox;
}
