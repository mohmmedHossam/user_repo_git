import 'package:flutter/material.dart';

import '../Managers/ColorManager.dart';
import '../Managers/image_manager.dart';

// ignore: must_be_immutable
class MyNetworkImage extends StatelessWidget {
  String imageUrl;
  double? imgHeight, imgWidth;
  dynamic fit;

  MyNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.fit,
      this.imgHeight,
      this.imgWidth});

  @override
  Widget build(BuildContext context) {
    return imageUrl.startsWith("http")?
    Image.network(
      imageUrl,
      height: imgHeight,
      width: imgWidth,
      fit: fit,
      loadingBuilder: (context, child, imageLoading) {
        if (imageLoading == null) {

          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.darkBlue,
              value: imageLoading.expectedTotalBytes != null
                  ? imageLoading.cumulativeBytesLoaded /
                      imageLoading.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          ImageManager.noImage,
          height: imgHeight,
          width: imgWidth,
          fit: fit,
        );
      },
    )
        :Image.asset(
      imageUrl,
      height: imgHeight,
      width: imgWidth,
      fit: fit,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          ImageManager.noImage,
          height: imgHeight,
          width: imgWidth,
          fit: fit,
        );
      },
    );
    /*  FadeInImage(
      width: imgWidth,
      height: imgHeight,
      fit: fit,
      placeholderFit: fit,
      imageErrorBuilder:(context, error, stackTrace) {
        return Image.network( "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image.png",
            fit: BoxFit.contain
        );
      },
      placeholder: const NetworkImage("https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image.png"),
      image: NetworkImage(imageUrl),
    );*/
  }
}
