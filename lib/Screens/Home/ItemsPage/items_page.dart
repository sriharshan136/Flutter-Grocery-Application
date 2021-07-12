import 'package:flutter/material.dart';
import 'package:grocery_application/Screens/Home/Cart/cart_page.dart';
import 'package:grocery_application/Screens/Home/ProductPage/product_details_page.dart';
import 'package:grocery_application/Shared/item_card.dart';
import 'package:grocery_application/Shared/Product.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/staggered_dual_view.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class ItemsPage extends StatefulWidget {
  final String pageTitle;
  final List<Product> categoryData;
  const ItemsPage({
    Key key,
    this.pageTitle,
    this.categoryData,
  }) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
        leading: BackButton(
          color: black,
        ),
        title: Text(widget.pageTitle, style: h4),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: CartPage()));
              },
              icon: Icon(
                MdiIcons.cart,
                color: black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: StaggeredDualView(
          aspectRatio: 0.65,
          spacing: 5,
          offsetPersent: 0.3,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      PageRouteBuilder(pageBuilder: (context, animation, __) {
                    return FadeTransition(
                      opacity: animation,
                      child: new ProductDetailsPage(
                        product: widget.categoryData[index],
                      ),
                    );
                  }));
                },
                child: ItemCard(product: widget.categoryData[index]));
          },
          itemCount: widget.categoryData.length,
        ),
      ),
    );
  }
}
