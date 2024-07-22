import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class FittedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return FittedBox(
      fit: ThemeDecoder.decodeBoxFit(map['fit']) ?? BoxFit.contain,
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment']) ?? Alignment.center,
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "FittedBox";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as FittedBox;
    return JsonClass.removeNull({
      "type": widgetName,
      "fit": ThemeEncoder.encodeBoxFit(realWidget.fit),
      "alignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.alignment),
      "clipBehavior": ThemeEncoder.encodeClip(realWidget.clipBehavior),
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => FittedBox;
}
