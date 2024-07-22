
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';

class GestureDetectorWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {

    var onTap = map['onTap'] as String?;
    var onDoubleTap = map['onDoubleTap'] as String?;
    var onLongPress = map['onLongPress'] as String?;
    return GestureDetector(
        onTap: registry.clickListener?.onTap != null && onTap != null && onTap.isNotEmpty ? () {
          registry.clickListener!.onTap(onTap);
        } : null,
        onDoubleTap: registry.clickListener?.onDoubleTap != null && onDoubleTap != null && onDoubleTap.isNotEmpty ? () {
          registry.clickListener!.onDoubleTap(onDoubleTap);
        } : null,
        onLongPress: registry.clickListener?.onLongPress != null && onLongPress != null && onLongPress.isNotEmpty ? () {
          registry.clickListener!.onDoubleTap(onLongPress);
        } : null,
        child: WidgetDynamicBuilder.build(map['child'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "GestureDetector";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    return JsonClass.removeNull({
      "type": widgetName,
    });
  }

  @override
  Type get widgetType => GestureDetector;
}
