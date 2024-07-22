import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'parsers/widget_parser.dart';
import 'widget_dynamic_registry.dart';

class WidgetDynamicBuilder {
  static final Logger log = Logger('WidgetDynamic');

  static Widget? build(
      dynamic json, BuildContext buildContext, WidgetDynamicRegistry registry) {
    if (json == null) return null;
    var map = json;

    if (json is String) {
      map = jsonDecode(json);
    }

    if (map is! Map) return null;

    var widget = buildFromMap(map, buildContext, registry);
    return widget;
  }

  static dynamic buildFromMap(
      dynamic map, BuildContext buildContext, WidgetDynamicRegistry registry) {
    if (map == null) {
      return null;
    }
    String? widgetName = map['type'];
    if (widgetName == null) {
      return null;
    }

    map = registry.processArgs(map);

    var parser = registry.getWidgetBuilder(widgetName);
    if (parser != null) {
      return parser.parse(map, buildContext, registry);
    }
    log.warning("Not support parser type: $widgetName");
    return null;
  }

  static List<Widget> buildWidgets(List<dynamic> values,
      BuildContext buildContext, WidgetDynamicRegistry registry) {
    List<Widget> rt = [];
    for (var value in values) {
      if (value['type'] == 'For') {
        var widgetList = buildFromMap(value, buildContext, registry);
        rt.addAll(widgetList);
      } else {
        var widget = buildFromMap(value, buildContext, registry);
        if (widget != null) {
          rt.add(widget);
        }
      }
    }
    return rt;
  }

  static dynamic export(Widget? widget, BuildContext? buildContext) {
    var parser = _findMatchedWidgetParserForExport(widget);
    if (parser != null) {
      return parser.export(widget, buildContext);
    }
    log.warning(
        "Can't find WidgetParser for Type ${widget.runtimeType} to export.");
    return null;
  }

  static List<dynamic> exportWidgets(
      List<Widget?> widgets, BuildContext? buildContext) {
    List<dynamic> rt = [];
    for (var widget in widgets) {
      rt.add(export(widget, buildContext));
    }
    return rt;
  }

  static WidgetParser? _findMatchedWidgetParserForExport(Widget? widget) {
    // for (var parser in _parsers) {
    //   if (parser.matchWidgetForExport(widget)) {
    //     return parser;
    //   }
    // }
    return null;
  }
}
