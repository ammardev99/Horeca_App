import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';
import 'package:horeca/screens/horeca/appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'inner screens/product_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool checkBox1 = true;
bool checkBox4 = true;
bool checkBox2 = false;
bool checkBox3 = false;

class _HomeState extends State<Home> {
  final sliderImages = [
    Image.asset('assets/png/banners/banner1.png'),
    Image.asset('assets/png/banners/banner2.png'),
    Image.asset('assets/png/banners/banner3.png'),
  ];
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: horecaAppBar(),
        body: Container(
// set background image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/png/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                sortAndFilter(),
                sizeBox(20),
                showBanners(),
                sizeBox(10),
                categoriesRow(),
                sizeBox(10),
                Align(
                    alignment: Alignment.topLeft,
                    child: myHeading('\t\t\tIngredients with a top margin',
                        false, primaryColor)),
                sizeBox(15),
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
                            mainAxisExtent: 280
                            // childAspectRatio: 1.8,
                            ),
                    itemCount: productDataList.length,
                    itemBuilder: (context, index) {
                      // return showItem();
                      return productCard(productDataList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row sortAndFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        myHeading('All Featured', false, primaryColor),
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

  Column showBanners() {
    return Column(
      children: [
        CarouselSlider(
          items: sliderImages,
          options: CarouselOptions(
            height: 180,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOutCirc,
            enlargeCenterPage: true,
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                sliderIndex = index;
              });
            },
          ),
        ),
        sizeBox(0, 5),
        AnimatedSmoothIndicator(
          activeIndex: sliderIndex,
          count: sliderImages.length,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: borderColor,
            activeDotColor: primaryColor,
          ),
        ),
      ],
    );
  }

  SingleChildScrollView categoriesRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryOption('assets/png/categories/All_Offers.png', "All Offers"),
          categoryOption(
              'assets/png/categories/Kühlprodukte.png', "Kühlprodukte"),
          categoryOption(
              'assets/png/categories/Trockenware.png', "Trockenware"),
          categoryOption(
              'assets/png/categories/Obst_und_Gemüse.png', "Obst und Gemüse"),
          categoryOption('assets/png/categories/Getränke.png', "Getränke"),
          categoryOption('assets/png/categories/Verpackung.png', "Verpackung"),
        ],
      ),
    );
  }
}
