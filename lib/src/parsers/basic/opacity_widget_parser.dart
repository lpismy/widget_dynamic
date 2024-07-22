import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class OpacityWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Opacity(
      opacity: JsonClass.maybeParseDouble(map['opacity']) ?? 1.0,
      alwaysIncludeSemantics: JsonClass.maybeParseBool(map['alwaysIncludeSemantics']) ?? false,
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Opacity";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Opacity;
    return JsonClass.removeNull({
      "type": widgetName,
      "opacity": realWidget.opacity,
      "alwaysIncludeSemantics": realWidget.alwaysIncludeSemantics,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Opacity;
}
