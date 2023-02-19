import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({ Key? key, required this.url, this.height }) : super(key: key);

  final String url;
  final double? height;

  @override
  Widget build(BuildContext context) {

    if(url == "") return Icon(Icons.error);
    return CachedNetworkImage(
        imageUrl: url,
        // cacheKey: url,
        height: height,
        useOldImageOnUrlChange: true,
        // placeholder: (context, url) => CircularProgressIndicator(),
        placeholder: (context, url) => Image.asset("assets/logo/fss_launcher.png"),
        errorWidget: (context, url, error) => Icon(Icons.error),
     );
  }
}