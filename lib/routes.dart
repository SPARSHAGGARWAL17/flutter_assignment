import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:flutter_assignment/view/homepage.dart';
import 'package:flutter_assignment/view/product-details.dart';
import 'package:flutter_assignment/view/products-list.dart';

class AssignmentRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Widget currentWidget;

    switch (settings.name) {
      case HomePage.Route:
        currentWidget = HomePage();
        break;
      case ProductsPage.Route:
        currentWidget = ProductsPage();
        break;
      case ProductDetails.Route:
        currentWidget = ProductDetails(
          product: settings.arguments as Product,
        );
        break;
      default:
        currentWidget = Scaffold();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, one, second) => currentWidget,
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
              .animate(animation),
        );
      },
    );
  }
}
