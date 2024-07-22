import 'package:flutter/widgets.dart';

import 'package:collection/collection.dart';
import 'package:widget_dynamic/src/parsers/parsers.dart';
import 'components/processors/raw_arg_processor.dart';
import 'package:widget_dynamic/widget_dynamic.dart';

class WidgetDynamicRegistry {
  WidgetDynamicRegistry({
    Map<String, WidgetParser>? builders,
    this.navigatorKey,
    WidgetDynamicRegistry? parent,
    ClickListener? clickListener,
    Map<String, dynamic>? values,
    List<ArgProcessor>? argProcessors,
  }) {
    _builders.addAll({if (builders != null) ...builders});
    _clickListener = clickListener;
    _values.addAll(values ?? {});
    _argProcessors = argProcessors ?? ArgProcessors.defaults;

    _initWidgetBuilders();
  }

  static final WidgetDynamicRegistry instance = WidgetDynamicRegistry();

  final _builders = <String, WidgetParser>{};
  final _values = <String, dynamic>{};
  late List<ArgProcessor> _argProcessors;
  ClickListener? _clickListener;

  GlobalKey<NavigatorState>? navigatorKey;

  Map<String, dynamic> get values => Map.unmodifiable(
        Map.from(_values),
      );

  ClickListener? get clickListener => _clickListener;

  void setClickListener(ClickListener? listener) {
    _clickListener = listener;
  }

  void removeClickListener() {
    _clickListener = null;
  }

  void clearValues() {
    _values.clear();
  }

  dynamic processArgs(dynamic args, [int layer = 0]) {
    return _argProcessors.firstWhere(
      (parser) {
        return parser.support(args, layer);
      },
      orElse: () => RawArgProcessor(),
    ).process(this, args);
  }

  void dispose() {}

  dynamic getValue(String? key) {
    return _values[key];
  }

  void _initWidgetBuilders() {
    for (var parser in defalutParsers) {
      _builders[parser.widgetName] = parser;
    }
  }

  WidgetParser? getWidgetBuilder(String type) {
    final container = _builders[type];

    if (container == null) {
      return null;
    }

    return container;
  }

  void registerCustomBuilder(
    String type,
    WidgetParser container,
  ) =>
      _builders[type] = container;

  void registerCustomBuilders(
    Map<String, WidgetParser> containers,
  ) =>
      containers.forEach((key, value) => registerCustomBuilder(key, value));

  void registerArgProcessors(List<ArgProcessor> argProcessors) =>
      _argProcessors = argProcessors;

  dynamic removeValue(
    String key, {
    String? originator,
  }) {
    assert(key.isNotEmpty == true);
    final result = _values.remove(key);
    return result;
  }

  void setValue(
    String key,
    dynamic value, {
    String? originator,
  }) {
    assert(key.isNotEmpty == true);
    if (value == null) {
      removeValue(
        key,
        originator: originator,
      );
    } else {
      final current = _values[key];

      var equals = current == value;
      if (current is List || current is Set || current is Map) {
        equals = const DeepCollectionEquality().equals(current, value);
      }
      if (!equals) {
        _values[key] = value;
      }
    }
  }

  @override
  String toString() => 'WidgetDynamicRegistry';

  WidgetParser? unregisterCustomBuilder(String type) => _builders.remove(type);
}
