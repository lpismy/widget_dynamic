import 'logic/if_widget_parse.dart';
import 'basic/align_widget_parser.dart';
import 'basic/center_widget_parser.dart';
import 'basic/column_widget_parser.dart';
import 'basic/constrained_box_widget_parser.dart';
import 'basic/container_widget_parser.dart';
import 'basic/expanded_widget_parser.dart';
import 'basic/fitted_box_widget_parser.dart';
import 'basic/flex_widget_parser.dart';
import 'basic/gesture_detector_widget_parser.dart';
import 'basic/grid_view_widget_parser.dart';
import 'basic/image_asset_widget_parser.dart';
import 'basic/image_network_widget_parser.dart';
import 'basic/list_view_widget_parser.dart';
import 'basic/opacity_widget_parser.dart';
import 'basic/page_view_widget_parser.dart';
import 'basic/positioned_widget_parser.dart';
import 'basic/row_widget_parser.dart';
import 'basic/safe_area_widget_parser.dart';
import 'basic/single_child_scroll_view_widget_parser.dart';
import 'basic/sized_box_widget_parser.dart';
import 'basic/stack_widget_parser.dart';
import 'basic/text_widget_parser.dart';
import 'basic/wrap_widget_parser.dart';
import 'logic/for_widget_parser.dart';
import 'thirdparty/cached_network_image_widget_parser.dart';
import 'widget_parser.dart';

List<WidgetParser> defalutParsers = [
  IfWidgetParser(),
  ForWidgetParser(),
  AlignWidgetParser(),
  CenterWidgetParser(),
  ColumnWidgetParser(),
  ConstrainedBoxWidgetParser(),
  ContainerWidgetParser(),
  ExpandedWidgetParser(),
  FittedBoxWidgetParser(),
  FlexWidgetParser(),
  GestureDetectorWidgetParser(),
  GridViewWidgetParser(),
  ImageAssetWidgetParser(),
  ImageNetworkWidgetParser(),
  ListViewWidgetParser(),
  OpacityWidgetParser(),
  PageViewWidgetParser(),
  PositionedWidgetParser(),
  RowWidgetParser(),
  SafeAreaWidgetParser(),
  SingleChildScrollViewWidgetParser(),
  SizedBoxWidgetParser(),
  StackWidgetParser(),
  TextWidgetParser(),
  WrapWidgetParser(),
  CachedNetworkImageWidgetParser(),
];