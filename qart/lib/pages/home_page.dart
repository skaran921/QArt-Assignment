import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/pages/product_segmention.dart';
import 'package:qart/pages/search_product.dart';

import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildHomeWidget(
      String imgName, String label, GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Config.grayColor,
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          "assets/images/$imgName.jpg",
                        ),
                        fit: BoxFit.fitWidth))),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: "$label",
                  fontSize: 20.0,
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToProductSegmentPage(BuildContext context, String segmentationParam) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductSegmentation(
                  segmentationParam: segmentationParam,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final _productController = Get.find<ProductController>();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              readOnly: true,
              onTap: () {
                showSearch(context: context, delegate: SearchProduct());
              },
              placeholder: "Search Product",
              prefix: Icon(Icons.search),
              decoration: BoxDecoration(
                color: Color(
                  0xFFF5F5F5,
                ),
              ),
              placeholderStyle: TextStyle(
                  fontFamily: Config.fontFamily,
                  color: Config.textColor.withOpacity(0.6)),
              padding: EdgeInsets.all(12.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomText(
              text: "Brands",
              fontSize: 20.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: Config.brandImages
                    .map((e) => Container(
                          padding: EdgeInsets.all(4.0),
                          child: Image.asset(
                            "assets/images/$e",
                            width: 70,
                            height: 70,
                            fit: BoxFit.fitWidth,
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                _productController.fetchSegmentedProducts("men");
                goToProductSegmentPage(context, "Men");
              },
              child: Ink(
                  width: double.infinity,
                  height: 100,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: "Men  ",
                          fontSize: 20.0,
                        ),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Config.grayColor,
                      image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: AssetImage("assets/images/1.jpg")))),
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildHomeWidget("1w1", "Women", () {
              _productController.fetchSegmentedProducts("Women");
              goToProductSegmentPage(context, "Women");
            }),
            SizedBox(
              height: 20.0,
            ),
            _buildHomeWidget("1a", "Accessories", () {
              _productController.fetchSegmentedProducts("Accessories");
              goToProductSegmentPage(context, "Accessories");
            }),
          ],
        ),
      ),
    );
  }
}
