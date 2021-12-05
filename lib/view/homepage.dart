import 'package:flutter/material.dart';
import 'package:flutter_assignment/bloc/product-cubit.dart';

import 'package:flutter_assignment/helpers/utils.dart';
import 'package:flutter_assignment/view/products-list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const Route = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  List<_CarouselData> carouselData = [
    _CarouselData(
      data: 'Top Wear',
      ratings: 4,
      isFav: true,
    ),
    _CarouselData(
      data: 'Foot Wear',
      ratings: 3,
      isFav: true,
    ),
    _CarouselData(
      data: 'Bottom Wear',
      ratings: 5,
      isFav: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('QKart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: kBrownColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              vSpacing(),
              Expanded(
                child: Container(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: carouselData.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      var data = carouselData[index];
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    hSpacing(),
                                    for (int i = 0; i < 5; i++)
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: i < data.ratings
                                            ? Colors.yellow
                                            : Colors.grey.shade400,
                                      ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      data.isFav = !data.isFav;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: data.isFav
                                        ? Colors.red
                                        : Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(4),
                              width: double.infinity,
                              height: 60,
                              child: Column(
                                children: [
                                  Text(
                                    'Product Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  vSpacing(5),
                                  Text(
                                    data.data,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: currentPage != index ? 25 : 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black12, BlendMode.darken),
                            image: AssetImage('assets/cover.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade600,
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<ProductCubit>(context).loadProducts();
                  Navigator.of(context).pushNamed(ProductsPage.Route);
                },
                title: Text("See All Products >"),
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarouselData {
  String data;
  int ratings;
  bool isFav;
  _CarouselData({
    required this.data,
    required this.ratings,
    required this.isFav,
  });
}
