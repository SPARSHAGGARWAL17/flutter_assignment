import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/bloc/product-cubit.dart';
import 'package:flutter_assignment/bloc/product-states.dart';
import 'package:flutter_assignment/helpers/utils.dart';
import 'package:flutter_assignment/view/product-details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  static const Route = '/productsPage';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOutExpo,
          switchOutCurve: Curves.easeInOutExpo,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: search
              ? TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      BlocProvider.of<ProductCubit>(context).loadProducts();
                    }
                  },
                  onFieldSubmitted: (value) {
                    BlocProvider.of<ProductCubit>(context).searchProduct(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search Product',
                  ),
                )
              : Text("All Products"),
        ),
        actions: [
          if (!search)
            IconButton(
              onPressed: () {
                setState(() {
                  search = true;
                });
              },
              icon: Icon(
                Icons.search,
              ),
            ),
          if (search)
            IconButton(
              onPressed: () {
                setState(() {
                  search = false;
                  BlocProvider.of<ProductCubit>(context).loadProducts();
                });
              },
              icon: Icon(
                Icons.close,
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<ProductCubit, ProductStates>(
              builder: (context, state) {
            if (state is ProductNotLoaded) {
              return Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.error,
                      size: 20,
                    ),
                    vSpacing(),
                    Text("Something Went Wrong!"),
                  ],
                ),
              );
            } else if (state is ProductLoaded) {
              return ListView.builder(
                  itemCount: state.products.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool opened = state.products[index].isExpanded;
                    var product = state.products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ProductDetails.Route,
                            arguments: product);
                      },
                      child: Column(
                        children: [
                          AnimatedContainer(
                            height: opened ? 273 : 116,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            duration: Duration(milliseconds: 500),
                            child: Column(
                              children: [
                                // if (opened)
                                Hero(
                                  tag:
                                      opened ? product.imageUrl : product.image,
                                  child: AnimatedContainer(
                                    width: getDeviceWidth(context) - 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: product.imageUrl,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) {
                                          return Container(height: 0);
                                        },
                                        progressIndicatorBuilder:
                                            (context, url, progress) {
                                          return CupertinoActivityIndicator();
                                        },
                                      ),
                                    ),
                                    height: !opened ? 0 : 150,
                                    decoration: BoxDecoration(
                                      color: kBrownColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    duration: Duration(milliseconds: 500),
                                  ),
                                ),
                                vSpacing(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: !opened
                                          ? product.imageUrl
                                          : product.image,
                                      child: AnimatedContainer(
                                        height: opened ? 0 : 50,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: CachedNetworkImage(
                                            imageUrl: product.imageUrl,
                                            errorWidget: (context, url, error) {
                                              return Container(height: 0);
                                            },
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder:
                                                (context, url, progress) {
                                              return CupertinoActivityIndicator();
                                            },
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 400),
                                        width: opened ? 0 : 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kBrownColor,
                                        ),
                                      ),
                                    ),
                                    hSpacing(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: getDeviceWidth(context) - 90,
                                          child: Text(
                                            '${product.color} - ${product.name}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Text(
                                            'Size : ${product.availableSizes.map((e) => e).join(', ')}'),
                                        Text('${product.collection}'),
                                        TextButton(
                                          style: ButtonStyle(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            fixedSize:
                                                MaterialStateProperty.all(
                                              Size(170, 20),
                                            ),
                                          ),
                                          onPressed: () {
                                            state.products[index].isExpanded =
                                                !state
                                                    .products[index].isExpanded;
                                            setState(() {});
                                          },
                                          child: Text(
                                            opened
                                                ? 'Tap here to collapse'
                                                : 'Tap here to expand',
                                            style: TextStyle(
                                              color: kBrownColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
