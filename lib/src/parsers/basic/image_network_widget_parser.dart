import 'package:flutter/cupertino.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';

class ImageNetworkWidgetParser extends WidgetParser {
  @override
  Widget parse(
      dynamic map, BuildContext buildContext, WidgetDynamicRegistry registry) {
    late Widget imageWidegt;

    ImageErrorWidgetBuilder? errorBuilder;
    if (map['errorUrl'] != null && map['errorUrl'].isNotEmpty) {
      errorBuilder =
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return _getImageNetwork(
            map: map['errorConfig'] ?? map, url: map['errorUrl']);
      };
    } else if (map['error'] != null && map['error'] is Map) {
      errorBuilder =
          (BuildContext context, Object error, StackTrace? stackTrace) =>
              WidgetDynamicBuilder.buildFromMap(
                  map['error'], buildContext, registry);
    }

    if ((map['url'] == null || map['url'].isEmpty) && errorBuilder != null) {
      imageWidegt = errorBuilder(buildContext, "", null);
    } else {
      imageWidegt = _getImageNetwork(
          map: map, url: map['url'], errorBuilder: errorBuilder);
    }

    var onTap = map['onTap'] as String?;
    if (registry.clickListener?.onTap != null &&
        onTap != null &&
        onTap.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          registry.clickListener!.onTap(onTap);
        },
        child: imageWidegt,
      );
    }

    return imageWidegt;
  }

  Widget _getImageNetwork(
      {required dynamic map,
      required String url,
      ImageErrorWidgetBuilder? errorBuilder}) {
    return Image.network(
      url,
      errorBuilder: errorBuilder,
      scale: JsonClass.maybeParseDouble(map['scale']) ?? 1.0,
      semanticLabel: map['semanticLabel'],
      excludeFromSemantics:
          JsonClass.maybeParseBool(map['excludeFromSemantics']) ?? false,
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      color: ThemeDecoder.decodeColor(map['color']),
      colorBlendMode: ThemeDecoder.decodeBlendMode(map['colorBlendMode']),
      fit: ThemeDecoder.decodeBoxFit(map['fit']),
      alignment: ThemeDecoder.decodeAlignmentGeometry(map['alignment']) ??
          Alignment.center,
      repeat:
          ThemeDecoder.decodeImageRepeat(map['repeat']) ?? ImageRepeat.noRepeat,
      centerSlice: ThemeDecoder.decodeRect(map['centerSlice']),
      matchTextDirection:
          JsonClass.maybeParseBool(map['matchTextDirection']) ?? false,
      gaplessPlayback:
          JsonClass.maybeParseBool(map['gaplessPlayback']) ?? false,
      filterQuality: ThemeDecoder.decodeFilterQuality(map['filterQuality']) ??
          FilterQuality.low,
      isAntiAlias: JsonClass.maybeParseBool(map['isAntiAlias']) ?? false,
      headers: map['headers'],
      cacheWidth: JsonClass.maybeParseInt(map['cacheWidth']),
      cacheHeight: JsonClass.maybeParseInt(map['cacheHeight']),
    );
  }

  @override
  String get widgetName => "ImageNetwork";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Image;
    return JsonClass.removeNull({
      "type": widgetName,
      "url": realWidget.image is NetworkImage
          ? (realWidget.image as NetworkImage).url
          : null,
      "scale": realWidget.width,
      "frameBuilder": realWidget.frameBuilder,
      "errorBuilder": realWidget.errorBuilder,
      "semanticLabel": realWidget.semanticLabel,
      "excludeFromSemantics": realWidget.excludeFromSemantics,
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
      "filterQuality":
          ThemeEncoder.encodeFilterQuality(realWidget.filterQuality),
      "isAntiAlias": realWidget.isAntiAlias,
      "headers": realWidget.image is NetworkImage
          ? (realWidget.image as NetworkImage).headers
          : null,
      "cacheWidth": 0,
      "cacheHeight": 0,
    });
  }

  @override
  Type get widgetType => Image;
}
