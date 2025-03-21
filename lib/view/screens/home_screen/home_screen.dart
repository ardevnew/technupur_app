import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_app/exports.dart';
import 'package:test_app/view/widgets/small_circular_image.dart';

import 'controller/category_controller_cubit.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selected_category = 0;
  int selected_sub_category = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 0,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          context.read<category_controller_Cubit>().get_category_all();

          print("Hello World");
        }),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.black),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Online",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Shop",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Text(
                "ECOMMERCE APPLICATION",
                style: TextStyle(color: Colors.grey, fontSize: 6),
              )
            ],
          ),
          actions: [
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            tabs: [
              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     // Base button
              //     Container(
              //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.red, width: 2),
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: Text(
              //         "label",
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: -8,
              //       right: -8,
              //       child: Container(
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(color: Colors.red, width: 2),
              //           shape: BoxShape.circle,
              //         ),
              //         child: Center(
              //           child: Text(
              //             "${12}",
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 12,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        body: BlocBuilder<category_controller_Cubit, category_controller_state>(
          builder: (context, state) {
            return Column(
              children: [
                Skeletonizer(
                  enabled: state is category_controller_Loading,
                  child: (state is category_controller_Loaded)
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: Builder(builder: (context) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.category_model_data.length,
                                    itemBuilder: (context, index_categ) {
                                      return Card(
                                        color: selected_category == index_categ ? kPrimaryColor : Colors.white,
                                        elevation: 3,
                                        child: Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selected_category = index_categ;
                                                });
                                              },
                                              child: Text(
                                                state.category_model_data[index_categ].name ?? "",
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              }),
                            ),
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Builder(builder: (context) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.category_model_data[selected_category].subCategory!.length,
                                    itemBuilder: (context, index) {
                                      return SmallCircularImage(
                                        imagePath: state.category_model_data[selected_category].subCategory![index].image,
                                      );
                                    });
                              }),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    padding: EdgeInsets.all(8),
                    children: [
                      _productCard("Category", "\$0.00", "\$0.00", "sold out"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_shipping, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Free Shipping Over \$0",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Free returns and exchange",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.link, color: Colors.white),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _productCard(String category, String oldPrice, String newPrice, String status) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: Center(child: Icon(Icons.image, size: 50)),
              ),
            ),
            SizedBox(height: 5),
            Text("Category", style: TextStyle(fontSize: 12, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  oldPrice,
                  style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12),
                ),
                SizedBox(width: 5),
                Text(
                  newPrice,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(status, style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}
