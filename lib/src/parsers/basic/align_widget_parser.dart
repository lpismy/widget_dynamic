import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class AlignWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Align(
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment']) ?? Alignment.center,
      widthFactor: JsonClass.maybeParseDouble(map['widthFactor']),
      heightFactor: JsonClass.maybeParseDouble(map['heightFactor']),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "Align";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Align;
    return JsonClass.removeNull({
      "type": widgetName,
      "alignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.alignment),
      "widthFactor": realWidget.widthFactor,
      "heightFactor": realWidget.heightFactor,
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Align;
}