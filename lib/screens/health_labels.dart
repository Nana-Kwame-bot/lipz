import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lipz/utilities/constants.dart';

class HealthLabels extends StatelessWidget {
  HealthLabels({@required this.productDetails});

  final dynamic productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kStackMargin,
      decoration: kStackPageDecoration,
      child: FutureBuilder(
        future: productDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              !snapshot.hasError) {
            List _healthLabels = snapshot.data['healthLabels'] == null
                ? 0
                : snapshot.data['healthLabels'];
            return Center(
              child: ListView.separated(
                itemCount: _healthLabels.length,
                separatorBuilder: (BuildContext context, int index) {
                  return kListViewDivider;
                },
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      title: Center(
                        child: Text(
                          'Health Labels',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: kPrimaryColorDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                  return ListTile(
                    title: Center(
                      child: Text(
                        _healthLabels[index],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SpinKitDoubleBounce(
                    color: kPrimaryColor,
                    size: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Health Labels',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kPrimaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
