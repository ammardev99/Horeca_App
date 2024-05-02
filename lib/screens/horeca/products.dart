import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/drawer.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';
import 'package:horeca/components/appbar.dart';
import 'package:horeca/screens/horeca/inner%20screens/product_widget.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool checkBox1 = false;
  bool checkBox4 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer(context),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [mainSliverAppBar('assets/png/profile.png')];
          },
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // search bar
                sizeBox(20),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                      decoration: inputStyle(Icons.search,
                          'Search any Product..', primaryLightColor),
                    )),
                sizeBox(15),
// All Featured Sort And Filter Option Row
                sortAndFilter(productList.length.toString()),
                sizeBox(20),

// show products
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 280),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return productCard(productList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row sortAndFilter(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        myHeading('$label items', false, primaryColor),
        sizeBox(40, 0),
        textIconButton(
          'Sort',
          Icons.swap_vert,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: whiteColor,
                  title: myHeading("Filters", true, primaryColor),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      myHeading('Select main category', true, blackColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          info("Snack", false, blackColor),
                          Checkbox(
                            value: checkBox1,
                            onChanged: (value) {
                              setState(() {
                                checkBox1 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          info("Halal", false, blackColor),
                          Checkbox(
                            value: checkBox2,
                            onChanged: (value) {
                              setState(() {
                                checkBox2 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          info("Frozen", false, blackColor),
                          Checkbox(
                            value: checkBox3,
                            onChanged: (value) {
                              setState(() {
                                checkBox3 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          info("Fries", false, blackColor),
                          Checkbox(
                            value: checkBox4,
                            onChanged: (value) {
                              setState(() {
                                checkBox4 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: info('Apply filters', true, whiteColor),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: textIconButton(
            'Filter',
            Icons.filter_alt_outlined,
          ),
        ),
      ],
    );
  }
}
