import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class ImageAssetWidgetParser extends WidgetParser {
  @override
  Widget parse(dynamic map, BuildContext buildContext,
      WidgetDynamicRegistry registry) {

    Widget imageWidegt = Image.asset(
      map['name'],
      bundle: map['bundle'],
      frameBuilder: map['frameBuilder'],
      errorBuilder: map['errorBuilder'],
      semanticLabel: map['semanticLabel'],
      excludeFromSemantics: JsonClass.maybeParseBool(map['excludeFromSemantics']) ?? false,
      scale: JsonClass.maybeParseDouble(map['scale']),
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      color: ThemeDecoder.decodeColor(map['color']),
      colorBlendMode: ThemeDecoder.decodeBlendMode(map['colorBlendMode']),
      fit: ThemeDecoder.decodeBoxFit(map['fit']),
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment']) ?? Alignment.center,
      repeat: ThemeDecoder.decodeImageRepeat(map['repeat']) ?? ImageRepeat.noRepeat,
      centerSlice: ThemeDecoder.decodeRect(map['centerSlice']),
      matchTextDirection: JsonClass.maybeParseBool(map['matchTextDirection']) ?? false,
      gaplessPlayback: JsonClass.maybeParseBool(map['gaplessPlayback']) ?? false,
      filterQuality: ThemeDecoder.decodeFilterQuality(map['filterQuality']) ?? FilterQuality.low,
      isAntiAlias: JsonClass.maybeParseBool(map['isAntiAlias']) ?? false,
    );

    var onTap = map['onTap'] as String?;
    if (registry.clickListener?.onTap != null && onTap != null && onTap.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          registry.clickListener!.onTap(onTap);
        },
        child: imageWidegt,
      );
    }

    return imageWidegt;
  }

  @override
  String get widgetName => "ImageAsset";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Image;
    return JsonClass.removeNull({
      "type": widgetName,
      "bundle": (realWidget.image as AssetImage).bundle,
      "frameBuilder": realWidget.frameBuilder,
      "errorBuilder": realWidget.errorBuilder,
      "semanticLabel": realWidget.semanticLabel,
      "excludeFromSemantics": realWidget.excludeFromSemantics,
      "scale": realWidget.width,
      "width": realWidget.width,
      "height": realWidget.height,
      "color": ThemeEncoder.encodeColor(realWidget.color),
      "colorBlendMode": ThemeEncoder.encodeBlendMode(realWidget.colorBlendMode),
      "fit": ThemeEncoder.encodeBoxFit(realWidget.fit),
      "alignment": ThemeEncoder.encodeAlignmentGeometry(realWidget.alignment),
      "repeat": ThemeEncoder.encodeImageRepeat(realWidget.repeat),
      "centerSlice": ThemeEncoder.encodeRect(realWidget.centerSlice),
      "matchTextDirection": realWidget.matchTextDirection,
      "gaplessPlayback": realWidget.gaplessPlayback,
      "filterQuality": ThemeEncoder.encodeFilterQuality(realWidget.filterQuality),
      "isAntiAlias": realWidget.isAntiAlias,
    });
  }

  @override
  Type get widgetType => Image;
}
