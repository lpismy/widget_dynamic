import 'package:flutter/gestures.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class PageViewWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return PageView(
      scrollDirection: ThemeDecoder.decodeAxis(map['scrollDirection'], validate: false) ?? Axis.horizontal,
      reverse: JsonClass.maybeParseBool(map['reverse']) ?? false,
      physics: ThemeDecoder.decodeScrollPhysics(map['physics']),
      pageSnapping: JsonClass.maybeParseBool(map['pageSnapping']) ?? true,
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
      dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior'], validate: false) ?? DragStartBehavior.start,
      allowImplicitScrolling: JsonClass.maybeParseBool(map['allowImplicitScrolling']) ?? false,
      restorationId: map['restorationId'],
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior'], validate: false) ?? Clip.hardEdge,
      scrollBehavior: ThemeDecoder.decodeScrollBehavior(map['scrollBehavior']),
      padEnds: JsonClass.maybeParseBool(map['padEnds']) ?? true,
    );
  }

  @override
  String get widgetName => "PageView";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as PageView;
    return JsonClass.removeNull({
      "type": widgetName,
      "scrollDirection": ThemeEncoder.encodeAxis(realWidget.scrollDirection),
      "reverse": realWidget.reverse,
      "physics": ThemeEncoder.encodeScrollPhysics(realWidget.physics),
      "pageSnapping": realWidget.pageSnapping,
    });
  }

  @override
  Type get widgetType => PageView;
}
