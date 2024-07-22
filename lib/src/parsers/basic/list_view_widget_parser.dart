import 'package:flutter/gestures.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class ListViewWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {

    return ListView(
      scrollDirection: ThemeDecoder.decodeAxis(map['scrollDirection'], validate: false) ?? Axis.vertical,
      reverse: JsonClass.maybeParseBool(map['reverse']) ?? false,
      primary: JsonClass.maybeParseBool(map['primary']),
      physics: ThemeDecoder.decodeScrollPhysics(map['physics']),
      shrinkWrap: JsonClass.maybeParseBool(map['shrinkWrap']) ?? false,
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding'], validate: false),
      itemExtent: JsonClass.maybeParseDouble(map['itemExtent']),
      semanticChildCount: JsonClass.maybeParseInt(map['semanticChildCount']),
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
      dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior']) ?? DragStartBehavior.start,
      keyboardDismissBehavior: ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(map['keyboardDismissBehavior']) ?? ScrollViewKeyboardDismissBehavior.manual,
      restorationId: map['restorationId'],
      // itemExtentBuilder: map['itemExtentBuilder'],
      prototypeItem: WidgetDynamicBuilder.build(map['prototypeItem'], buildContext, registry),
      addAutomaticKeepAlives: JsonClass.maybeParseBool(map['addAutomaticKeepAlives']) ?? true,
      addRepaintBoundaries: JsonClass.maybeParseBool(map['addRepaintBoundaries']) ?? true,
      addSemanticIndexes: JsonClass.maybeParseBool(map['addSemanticIndexes']) ?? true,
      cacheExtent: JsonClass.maybeParseDouble(map['cacheExtent']),
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "ListView";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ListView;
    return JsonClass.removeNull({
      "type": widgetName,
      "scrollDirection": ThemeEncoder.encodeAxis(realWidget.scrollDirection),
      "reverse": realWidget.reverse,
      "controller": realWidget.controller,
      "primary": realWidget.primary,
      "physics": ThemeEncoder.encodeScrollPhysics(realWidget.physics),
      "shrinkWrap": realWidget.shrinkWrap,
      "padding": ThemeEncoder.encodeEdgeInsetsGeometry(realWidget.padding),
      "itemExtent": realWidget.itemExtent,
    });
  }

  @override
  Type get widgetType => ListView;
}
