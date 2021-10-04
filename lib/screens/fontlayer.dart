import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipz/screens/calories.dart';
import 'package:lipz/screens/health_labels.dart';
import 'package:lipz/screens/today.dart';
import 'package:lipz/services/networking.dart';
import 'package:lipz/services/product_data.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:showcaseview/showcase.dart';
import 'package:url_encoder/url_encoder.dart';
import 'nutrients.dart';
import 'package:provider/provider.dart';
import 'package:lipz/services/showcaseview_data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FrontLayer extends StatefulWidget {
  @override
  _FrontLayerState createState() => _FrontLayerState();
}

class _FrontLayerState extends State<FrontLayer> {
  String _productQuery;
  dynamic _productDetails;
  dynamic _futureData;
  List<Widget> _pages;

  Future<dynamic> getProductDetails(String productQuery) async {
    NetworkHelper networkHelper =
        NetworkHelper('$kUrl${urlEncode(text: productQuery)}');

    _productDetails = await networkHelper.getData();
    print(_productDetails);

    return _productDetails;
  }

  @override
  Widget build(BuildContext context) {
    _futureData = getProductDetails(_productQuery);
    _pages = [
      Calories(
        productDetails: _futureData,
      ),
      HealthLabels(
        productDetails: _futureData,
      ),
      Nutrients(
        productDetails: _futureData,
      ),
    ];

    return Consumer<ShowcaseViewData>(
      builder: (BuildContext context, showCaseData, Widget child) {
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 40.0,
                    ),
                    child: Showcase(
                      description: 'Click here to search for a food product',
                      key: showCaseData.one,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        textInputAction: TextInputAction.search,
                        decoration: kTextFieldInputDecoration,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _productQuery = value;
                              // getProductDetails(productQuery);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Stack(
                      children: [
                        Swiper(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _pages[index];
                          },
                          viewportFraction: 0.8,
                          scale: 0.9,
                        ),
                        Positioned(
                          bottom: 10.0,
                          right: 10.0,
                          child: FloatingActionButton(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Provider.of<ProductData>(context, listen: false)
                                  .updateToday();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Today(
                  // productDetails: getProductDetails(productQuery),
                  ),
            ),
          ],
        );
      },
    );
  }
}

// shapeBorder: CircleBorder(),
// key: showCaseData.two,
// description: 'The diet labels of the product appear here',
