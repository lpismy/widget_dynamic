import 'package:flutter/gestures.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class SingleChildScrollViewWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return SingleChildScrollView(
      scrollDirection: ThemeDecoder.decodeAxis(map['scrollDirection'], validate: false) ?? Axis.vertical,
      reverse: JsonClass.maybeParseBool(map['reverse']) ?? false,
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding'], validate: false),
      primary: JsonClass.maybeParseBool(map['primary']),
      physics: ThemeDecoder.decodeScrollPhysics(map['physics']),
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
      dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior']) ?? DragStartBehavior.start,
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
      restorationId: map['restorationId'],
      keyboardDismissBehavior: ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(map['keyboardDismissBehavior']) ?? ScrollViewKeyboardDismissBehavior.manual,
    );
  }

  @override
  String get widgetName => "SingleChildScrollView";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SingleChildScrollView;
    return JsonClass.removeNull({
      "type": widgetName,
      "scrollDirection": ThemeEncoder.encodeAxis(realWidget.scrollDirection),
      "reverse": realWidget.reverse,
      "padding": ThemeEncoder.encodeEdgeInsetsGeometry(realWidget.padding),
      "primary": realWidget.primary,
      "physics": ThemeEncoder.encodeScrollPhysics(realWidget.physics),
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext),
    });
  }

  @override
  Type get widgetType => SingleChildScrollView;
}
