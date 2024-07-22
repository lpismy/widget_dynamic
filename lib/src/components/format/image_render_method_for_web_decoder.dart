
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';

class ImageRenderMethodForWebDecoder {
  static ImageRenderMethodForWeb? decodeImageRenderMethodForWeb(dynamic imageRenderMethodForWeb) {
    if (imageRenderMethodForWeb == null) return null;

    if (imageRenderMethodForWeb is ImageRenderMethodForWeb) return imageRenderMethodForWeb;

    switch (imageRenderMethodForWeb.toString()) {
      case "HtmlImage":
        return ImageRenderMethodForWeb.HtmlImage;
      case "HttpGet":
        return ImageRenderMethodForWeb.HttpGet;
    }

    return null;
  }
}
