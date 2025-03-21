import 'package:test_app/exports.dart';

import 'common_image_view_widget.dart';

class SmallCircularImage extends StatelessWidget {
  final dynamic imagePath;
  const SmallCircularImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, shape: BoxShape.circle, boxShadow: [
            BoxShadow(spreadRadius: 0, color: Theme.of(context).cardColor.withOpacity(0.1), blurRadius: 8),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipOval(
              child: imagePath == null || imagePath.toString().contains("null")
                  ? CommonImageView(
                      imagePath: 'assets/Images/noImage.png',
                      url: "assets/Images/noImage.png",
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    )
                  : CachedNetworkImage(
                      // errorUrl: 'assets/Images/noImage.png',
                      imageUrl: imagePath,
                      fit: BoxFit.contain,
                      width: 50,
                      height: 50,
                    ),
              // child: DisplayImage(
              //       imageAddress: imagePath, imageHeight: 110, imageWidth: 50),
            ),
          ),
        ),
      ],
    );
  }
}
