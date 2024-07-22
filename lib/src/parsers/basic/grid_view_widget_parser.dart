import 'package:flutter/gestures.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/src/components/format/sliver_grid_delegate_decoder.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class GridViewWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return GridView(
      scrollDirection: ThemeDecoder.decodeAxis(map['scrollDirection'], validate: false) ?? Axis.vertical,
      reverse: JsonClass.maybeParseBool(map['reverse']) ?? false,
      primary: JsonClass.maybeParseBool(map['primary']),
      physics: ThemeDecoder.decodeScrollPhysics(map['physics']),
      shrinkWrap: JsonClass.maybeParseBool(map['shrinkWrap']) ?? false,
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding'], validate: false),
      gridDelegate: SliverGridDelegateDecoder.decodeGridDelegate(map['gridDelegate']),
      addAutomaticKeepAlives: JsonClass.maybeParseBool(map['addAutomaticKeepAlives']) ?? true,
      addRepaintBoundaries: JsonClass.maybeParseBool(map['addRepaintBoundaries']) ?? true,
      addSemanticIndexes: JsonClass.maybeParseBool(map['addSemanticIndexes']) ?? true,
      cacheExtent: JsonClass.maybeParseDouble(map['cacheExtent']),
      semanticChildCount: JsonClass.maybeParseInt(map['semanticChildCount']),
      dragStartBehavior: ThemeDecoder.decodeDragStartBehavior(map['dragStartBehavior'])?? DragStartBehavior.start,
      keyboardDismissBehavior: ThemeDecoder.decodeScrollViewKeyboardDismissBehavior(map['keyboardDismissBehavior']) ?? ScrollViewKeyboardDismissBehavior.manual,
      restorationId: map['restorationId'],
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.hardEdge,
      children: WidgetDynamicBuilder.buildWidgets(map['children'], buildContext, registry),
    );
  }

  @override
  String get widgetName => "GridView";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as GridView;
    return JsonClass.removeNull({
      "type": widgetName,
      "scrollDirection": ThemeEncoder.encodeAxis(realWidget.scrollDirection),
      "reverse": realWidget.reverse,
      "primary": realWidget.primary,
      "physics": ThemeEncoder.encodeScrollPhysics(realWidget.physics),
      "shrinkWrap": realWidget.shrinkWrap,
      "padding": ThemeEncoder.encodeEdgeInsetsGeometry(realWidget.padding),
    });
  }

  @override
  Type get widgetType => GridView;
}
