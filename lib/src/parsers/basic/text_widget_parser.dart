import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';


class TextWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {
    return Text(
      (map['data'] ?? '').toString(),
      style: ThemeDecoder.decodeTextStyle(map['style'], validate: false),
      textAlign: ThemeDecoder.decodeTextAlign(map['textAlign'], validate: false),
      maxLines: JsonClass.maybeParseInt(map['maxLines']),
      overflow: ThemeDecoder.decodeTextOverflow(map['overflow'], validate: false),
      semanticsLabel: map['semanticsLabel'] ?? '',
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection'],validate: false),
      softWrap: JsonClass.maybeParseBool(map['softWrap']),
      locale: ThemeDecoder.decodeLocale(map['locale'], validate: false),
      strutStyle: ThemeDecoder.decodeStrutStyle(map['strutStyle'], validate: false),
      textWidthBasis: ThemeDecoder.decodeTextWidthBasis(map['textWidthBasis'], validate: false),
      textHeightBehavior: ThemeDecoder.decodeTextHeightBehavior(map['textHeightBehavior'], validate: false),
      selectionColor: ThemeDecoder.decodeColor(map['selectionColor'], validate: false),
      textScaleFactor: JsonClass.maybeParseDouble(map['textScaleFactor'])
    );
  }

  @override
  String get widgetName => "Text";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Text;
    return JsonClass.removeNull({
      "type": widgetName,
      "data": realWidget.data,
      "style": ThemeEncoder.encodeTextStyle(realWidget.style),
      "textAlign": ThemeEncoder.encodeTextAlign(realWidget.textAlign),
      "maxLines": realWidget.maxLines,
      "overflow": ThemeEncoder.encodeTextOverflow(realWidget.overflow),
      "semanticsLabel": realWidget.semanticsLabel,
      "textDirection": ThemeEncoder.encodeTextDirection(realWidget.textDirection),
      "softWrap": realWidget.softWrap,
      "locale": ThemeEncoder.encodeLocale(realWidget.locale),
      "strutStyle": ThemeEncoder.encodeStrutStyle(realWidget.strutStyle),
      "textWidthBasis": ThemeEncoder.encodeTextWidthBasis(realWidget.textWidthBasis),
      "textHeightBehavior": ThemeEncoder.encodeTextHeightBehavior(realWidget.textHeightBehavior),
      "selectionColor": ThemeEncoder.encodeColor(realWidget.selectionColor),
      "textScaleFactor": realWidget.textScaleFactor,
    });
  }

  @override
  Type get widgetType => Text;
}
