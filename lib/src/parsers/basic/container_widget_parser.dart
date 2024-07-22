
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class ContainerWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {

    
    Widget containerWidget = Container(
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment'], validate: false),
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(map['padding'], validate: false),
      color: ThemeDecoder.decodeColor(map['color'], validate: false),
      margin: ThemeDecoder.decodeEdgeInsetsGeometry(map['margin'], validate: false),
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      constraints: ThemeDecoder.decodeBoxConstraints(map['constraints'], validate: false),
      transform: ThemeDecoder.decodeMatrix4(map['transform'], validate: false),
      transformAlignment: ThemeDecoder.decodeAlignmentGeometry(map['transformAlignment'], validate: false),
      decoration: ThemeDecoder.decodeBoxDecoration(map['decoration'], validate: false),
      foregroundDecoration: ThemeDecoder.decodeBoxDecoration(map['foregroundDecoration'], validate: false),
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior'], validate: false) ?? Clip.none,
      child: WidgetDynamicBuilder.buildFromMap(map['child'], buildContext, registry),
    );

    var onTap = map['onTap'] as String?;
    if (registry.clickListener?.onTap != null && onTap != null && onTap.isNotEmpty) {
      containerWidget = GestureDetector(
        onTap: () {
          registry.clickListener!.onTap(onTap);
        },
        child: containerWidget,
      );
    }

    var safeArea = map['safeArea'];
    if (safeArea is Map && safeArea.isNotEmpty) {

    }
    
    return containerWidget;
  }


  @override
  String get widgetName => "Container";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Container;
    return JsonClass.removeNull({
      "type": widgetName,
      "alignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.alignment),
      "padding": ThemeEncoder.encodeEdgeInsetsGeometry(realWidget.padding),
      "color": ThemeEncoder.encodeColor(realWidget.color),
      "margin": ThemeEncoder.encodeEdgeInsetsGeometry(realWidget.margin),
      "constraints": ThemeEncoder.encodeBoxConstraints(realWidget.constraints),
      "transform": ThemeEncoder.encodeMatrix4(realWidget.transform),
      "transformAlignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.transformAlignment),
      "decoration": ThemeEncoder.encodeBoxDecoration(realWidget.decoration as BoxDecoration?),
      "foregroundDecoration": ThemeEncoder.encodeBoxDecoration(realWidget.foregroundDecoration as BoxDecoration?),
      "clipBehavior": ThemeEncoder.encodeClip(realWidget.clipBehavior),
      "child": WidgetDynamicBuilder.export(realWidget.child, buildContext)
    });
  }

  @override
  Type get widgetType => Container;
}
