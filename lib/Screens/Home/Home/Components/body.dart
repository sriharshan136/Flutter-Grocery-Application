import 'package:flutter/material.dart';

import 'package:grocery_application/Screens/Home/ItemsPage/items_page.dart';
import 'package:grocery_application/Screens/Home/ProductPage/product_page.dart';
import 'package:grocery_application/Shared/colors.dart';
import 'package:grocery_application/Shared/item.dart';
import 'package:grocery_application/Shared/product_data.dart';
import 'package:grocery_application/Shared/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.red,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(26),
                  bottomLeft: Radius.circular(26))),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                title: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (pattern) {},
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        headerTopCategories(context),
        deals(
          'Hot Deals',
          onViewMore: () {},
          child: (foods != null)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      item: foods[index],
                      onTapped: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return new ProductPage(
                                productData: foods[index],
                              );
                            },
                          ),
                        );
                      },
                      imgWidth: 250,
                    );
                  },
                )
              : Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('No items available at this moment.',
                      style: taglineText),
                ),
        ),
        deals(
          'Drinks Parol',
          onViewMore: () {},
          child: (drinks != null)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: drinks.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      item: drinks[index],
                      onTapped: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return new ProductPage(
                                productData: drinks[index],
                              );
                            },
                          ),
                        );
                      },
                      imgWidth: 250,
                    );
                  },
                )
              : Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('No items available at this moment.',
                      style: taglineText),
                ),
        ),
      ],
    ));
  }
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: TextButton(
          onPressed: onViewMore,
          child: Text(
            'View all ›',
            style: contrastText,
          ),
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget headerTopCategories(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Fruits', MdiIcons.fruitCherries, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Fruits',
                      categoryData: category[0],
                    );
                  },
                ),
              );
            }),
            headerCategoryItem('Vegetables', MdiIcons.leaf, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Vegetables',
                      categoryData: category[1],
                    );
                  },
                ),
              );
            }),
            headerCategoryItem('Fast Food', MdiIcons.hamburger, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Fast Food',
                      categoryData: category[2],
                    );
                  },
                ),
              );
            }),
            headerCategoryItem('Cakes', MdiIcons.cake, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Cakes',
                      categoryData: category[3],
                    );
                  },
                ),
              );
            }),
            headerCategoryItem('Beverages', MdiIcons.beer, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Beverages',
                      categoryData: category[4],
                    );
                  },
                ),
              );
            }),
            headerCategoryItem('Pets', MdiIcons.paw, onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ItemsPage(
                      pageTitle: 'Pets',
                      categoryData: category[5],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      )
    ],
  );
}

Widget deals(String dealTitle, {onViewMore, Widget child}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: child,
        )
      ],
    ),
  );
}
