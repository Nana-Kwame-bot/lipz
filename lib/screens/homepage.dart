import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lipz/screens/fontlayer.dart';
import 'package:lipz/screens/table_screen.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:showcaseview/showcase_widget.dart';
import 'package:provider/provider.dart';
import 'package:lipz/services/showcaseview_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (BuildContext context) {
          return BackdropScaffold(
            frontLayerBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
            ),
            appBar: BackdropAppBar(
              backgroundColor: kPrimaryColorDark,
              title: Text("LIPZ "),
              actions: <Widget>[
                Consumer<ShowcaseViewData>(
                  builder: (BuildContext context, showCaseData, Widget child) {
                    return IconButton(
                      icon: Icon(
                        Icons.info,
                      ),
                      onPressed: () {
                        ShowCaseWidget.of(context).startShowCase([
                          showCaseData.one,
                          showCaseData.two,
                        ]);
                      },
                    );
                  },
                ),
              ],
            ),
            backLayer: TableScreen(),
            frontLayerBackgroundColor: kPrimaryColor,
            backLayerBackgroundColor: kPrimaryColorDark,
            frontLayer: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: FrontLayer(),
            ),
          );
        },
      ),
    );
  }
}
