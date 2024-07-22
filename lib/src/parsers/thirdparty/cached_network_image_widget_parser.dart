import 'package:flutter/cupertino.dart';
import 'package:json_class/json_class.dart';
import 'package:widget_dynamic/src/components/format/curve_decoder.dart';
import 'package:widget_dynamic/src/components/format/image_render_method_for_web_decoder.dart';
import 'package:widget_dynamic/widget_dynamic.dart';
import 'package:flutter/widgets.dart';
import 'package:json_theme/json_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';

class CachedNetworkImageWidgetParser extends WidgetParser {
  @override
  Widget parse(
      dynamic map, BuildContext buildContext, WidgetDynamicRegistry registry) {
    LoadingErrorWidgetBuilder? errorWidget;
    if (map['errorUrl'] != null && map['errorUrl'].isNotEmpty) {
      errorWidget = (BuildContext context, String url, Object error) {
        return _getCachedNetworkImage(
          map: map['errorConfig'] ?? map,
          url: map['errorUrl'],
        );
      };
    } else if (map['error'] != null && map['error'] is Map) {
      errorWidget = (BuildContext context, String url, Object error) =>
          WidgetDynamicBuilder.buildFromMap(
            map['error'],
            buildContext,
            registry,
          );
    }

    PlaceholderWidgetBuilder? placeholder;
    if (map['placeholderUrl'] != null && map['placeholderUrl'].isNotEmpty) {
      errorWidget = (BuildContext context, String url, Object error) {
        return _getCachedNetworkImage(
          map: map['placeholderConfig'] ?? map,
          url: map['placeholderUrl'],
        );
      };
    } else if (map['placeholder'] != null && map['placeholder'] is Map) {
      errorWidget = (BuildContext context, String url, Object error) =>
          WidgetDynamicBuilder.buildFromMap(
            map['placeholder'],
            buildContext,
            registry,
          );
    }
    Widget imageWidegt;

    if ((map['url'] == null || map['url'].isEmpty ) && errorWidget != null) {
      imageWidegt = errorWidget(buildContext, "", "");
    } else {
      imageWidegt = _getCachedNetworkImage(
        map: map,
        url: map['url'],
        errorWidget: errorWidget,
        placeholder: placeholder,
      );
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

  Widget _getCachedNetworkImage({
    required dynamic map,
    required String url,
    LoadingErrorWidgetBuilder? errorWidget,
    PlaceholderWidgetBuilder? placeholder,
  }) {
    
    return CachedNetworkImage(
      imageUrl: url,
      httpHeaders: map['httpHeaders'],
      errorWidget: errorWidget,
      placeholder: placeholder,
      fadeInDuration: JsonClass.maybeParseDurationFromMillis(map['fadeInDuration']) ?? const Duration(milliseconds: 500),
      fadeOutDuration: JsonClass.maybeParseDurationFromMillis(map['fadeOutDuration']) ?? const Duration(milliseconds: 1000),
      fadeOutCurve: CurveDecoder.decodeCurve(map['fadeOutCurve']) ?? Curves.easeOut,
      fadeInCurve: CurveDecoder.decodeCurve(map['fadeInCurve']) ?? Curves.easeIn,
      width: JsonClass.maybeParseDouble(map['width']),
      height: JsonClass.maybeParseDouble(map['height']),
      fit: ThemeDecoder.decodeBoxFit(map['fit']),
      alignment: ThemeDecoder.decodeAlignment(map['alignment']) ?? Alignment.center,
      repeat: ThemeDecoder.decodeImageRepeat(map['repeat']) ?? ImageRepeat.noRepeat,
      matchTextDirection: map['matchTextDirection'] ?? false,
      cacheManager: map['cacheManager'],
      useOldImageOnUrlChange: map['useOldImageOnUrlChange'] ?? false,
      color: ThemeDecoder.decodeColor(map['color']),
      filterQuality: ThemeDecoder.decodeFilterQuality(map['filterQuality']) ?? FilterQuality.low,
      colorBlendMode: ThemeDecoder.decodeBlendMode(map['colorBlendMode']),
      placeholderFadeInDuration: JsonClass.maybeParseDurationFromMillis(map['placeholderFadeInDuration']),
      memCacheWidth: JsonClass.maybeParseInt(map['memCacheWidth']),
      memCacheHeight: JsonClass.maybeParseInt(map['memCacheHeight']),
      cacheKey: map['cacheKey'],
      maxWidthDiskCache: JsonClass.maybeParseInt(map['maxWidthDiskCache']),
      maxHeightDiskCache: JsonClass.maybeParseInt(map['maxHeightDiskCache']),
      errorListener: map['errorListener'],
      imageRenderMethodForWeb: ImageRenderMethodForWebDecoder.decodeImageRenderMethodForWeb(map['imageRenderMethodForWeb']) ?? ImageRenderMethodForWeb.HtmlImage,
    );
  }

  @override
  String get widgetName => "CachedNetworkImage";

  @override
  dynamic export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Image;
    return JsonClass.removeNull({});
  }

  @override
  Type get widgetType => Image;
}
