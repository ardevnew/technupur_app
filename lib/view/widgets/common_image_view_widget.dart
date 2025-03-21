import 'package:test_app/exports.dart';

class CommonImageView extends StatelessWidget {
// ignore_for_file: must_be_immutable
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  double? radius;

  final BoxFit fit;
  final String placeHolder;

  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.radius = 0.0,
    this.fit = BoxFit.cover,
    this.placeHolder = 'assets/images/no_image_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: SvgPicture.asset(
            svgPath!,
            height: height,
            width: width,
            fit: fit,
          ),
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: file!.existsSync()
            ? Image.file(
                file!,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (context, url, error) => Image.asset(
                  placeHolder,
                  height: height,
                  width: width,
                  fit: fit,
                ),
              )
            : Image.asset(
                placeHolder,
                height: height,
                width: width,
                fit: fit,
              ),
      );
    } else if (url != null && url!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          imageUrl: url!,
          placeholder: (context, url) => Container(
            height: 23,
            width: 23,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit,
          ),
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Image.asset(
          imagePath!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
    return SizedBox();
  }
}
