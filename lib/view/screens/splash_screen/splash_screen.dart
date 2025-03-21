import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/exports.dart';
import 'package:test_app/generated/assets.dart';
import 'package:test_app/view/widgets/common_image_view_widget.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Get.toNamed('/home_screen');
        print('Executed after 3 seconds');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 1, child: SizedBox.shrink()),
          Expanded(
            flex: 4,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CommonImageView(
                      svgPath: Assets.svgG12,
                      width: 76,
                      height: 90,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Online",
                        style: GoogleFonts.montserrat(
                          fontSize: 36,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "Shop",
                        style: GoogleFonts.montserrat(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "ECOMMERCE APPLICATION",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: CommonImageView(
                svgPath: Assets.svgBottom,
                height: 25,
                width: 200,
                fit: BoxFit.contain,
                // width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
