import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/helpers/utils.dart';
import 'package:flutter_assignment/model/product.dart';

class ProductDetails extends StatefulWidget {
  static const Route = '/product-details';
  final Product product;
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QKart"),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add To Cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(120, 10)),
                backgroundColor: MaterialStateProperty.all(kBrownColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(
                  tag: widget.product.imageUrl,
                  child: AnimatedContainer(
                    width: getDeviceWidth(context) - 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Container(height: 0);
                        },
                        progressIndicatorBuilder: (context, url, progress) {
                          return CupertinoActivityIndicator();
                        },
                      ),
                    ),
                    height: 250,
                    decoration: BoxDecoration(
                      color: kBrownColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                vSpacing(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        vSpacing(5),
                        TextFormField(
                          readOnly: true,
                          initialValue:
                              '${widget.product.brand} - ${widget.product.brand} - ${widget.product.brand}',
                          decoration: InputDecoration(
                            labelText: "Brand - Category - Collection",
                            labelStyle: TextStyle(
                              color: kBrownColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: kBrownColor),
                            ),
                          ),
                        ),
                        vSpacing(10),
                        TextFormField(
                          readOnly: true,
                          initialValue:
                              '${widget.product.gender} - ${widget.product.name} - ${widget.product.subCategory}',
                          decoration: InputDecoration(
                            labelText: "Gender - Name - SubCategory",
                            labelStyle: TextStyle(
                              color: kBrownColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: kBrownColor),
                            ),
                          ),
                        ),
                        vSpacing(10),
                        TextFormField(
                          readOnly: true,
                          initialValue:
                              '${widget.product.fit} - ${widget.product.theme} - ${widget.product.finish}',
                          decoration: InputDecoration(
                            labelText: "Fit - Theme - Finish",
                            labelStyle: TextStyle(
                              color: kBrownColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: kBrownColor),
                            ),
                          ),
                        ),
                        vSpacing(10),
                        TextFormField(
                          readOnly: true,
                          initialValue:
                              '${widget.product.offerMonths} - ${widget.product.mood}',
                          decoration: InputDecoration(
                            labelText: "OFF_MONTH - Mood",
                            labelStyle: TextStyle(
                              color: kBrownColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: kBrownColor),
                            ),
                          ),
                        ),
                        vSpacing(5),
                      ],
                    ),
                  ),
                ),
                vSpacing(8),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Container(
                    // height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: kBrownColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        vSpacing(4),
                        Text(
                          '${widget.product.description}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                vSpacing(5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Container(
                    // height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: kBrownColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        vSpacing(4),
                        Text(
                          'Rs. ${widget.product.mrp}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
