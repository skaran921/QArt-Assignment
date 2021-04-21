import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qart/models/Product.dart';
import 'package:qart/pages/product_details_page.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_text.dart';

class ProductWidget extends StatelessWidget {
  final int? index;
  final Product? myProduct;

  const ProductWidget({Key? key, this.index, this.myProduct}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsPage(
                      index: index,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              color: Config.grayColor,
              borderRadius: BorderRadius.circular(12.0)),
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "${myProduct!.qRCode}",
                    child: CachedNetworkImage(
                      imageUrl: "${myProduct!.imageUrl}",
                      width: (Get.width / 3),
                      height: (Get.width / 3.3),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: (Get.width / 2.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "${myProduct!.name}",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                        CustomText(
                          text: "${myProduct!.category}",
                        ),
                        CustomText(
                          text: "${myProduct!.description}",
                        ),
                        CustomText(
                          text: "${myProduct!.color}",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "₹ ${myProduct!.mrp}",
                              textColor: Colors.red,
                              fontSize: 20,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.qrcode,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  text: "  ${myProduct!.qRCode}",
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: myProduct!.availableSizes
                      .map((size) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CustomText(
                                text: size,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          )),
    );
  }
}
