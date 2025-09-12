import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, Toast;

import 'AppColors.dart';
import 'BenefitSummary/PolifyxTextStyles.dart';
import 'MarqueeWidget.dart';

void printF(dynamic msg) {
  // if (isDebug() || isDev()) {
  if (kDebugMode) {
    if (msg != null) {
      // var logger = Logger();
      // logger.i(msg);
      log(msg.toString());
      // print(msg.toString());
    }
  } else {
    log("Some null Value is printed");
  }
  // }
}

class HeightSpace extends StatelessWidget {
  const HeightSpace({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class WidthSpace extends StatelessWidget {
  const WidthSpace({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

var textStyle = PolifyxTextStyles();

Widget ContainerDivider() {
  return Container(
    decoration: BoxDecoration(color: AppColors().color_dark_grey1, borderRadius: BorderRadius.all(Radius.circular(8))),
    height: 6,
    width: 45,
  );
}

void removeFocus(BuildContext context) {
  FocusScope.of(context).unfocus();
  FocusScope.of(context).requestFocus(FocusNode()); //remove focus
}

Widget summaryCard({
  required GlobalKey? key,
  String? image,
  required String text,
  required bool isSelected,
  required Color color,
  double indicatorWidth = 160,
  double fontsize = 15,
  double marginRight = 5,
  required Color borderColor,
  required Color indicatorColor,
  required Function() click,
}) {
  return InkWell(
    onTap: click,
    child: Container(
      height: 48,
      margin: EdgeInsets.only(right: marginRight),
      color: Colors.transparent,
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          image == null
              ? MarqueeWidget(
                  child: Text(text, style: textStyle.bodyText1Bold.copyWith(fontSize: fontsize)),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (image != null) Image.asset(image, height: 18, width: 18),
                    if (image != null) WidthSpace(width: 12),
                    Text(text, style: textStyle.bodyText1Bold.copyWith(fontSize: fontsize)),
                  ],
                ),
          Container(height: 2, width: indicatorWidth, color: isSelected ? indicatorColor : Colors.transparent),
        ],
      ),
    ),
  );
}

void showToast(String msg, {BuildContext? context}) {
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.black, textColor: Colors.white);
}

void showToastDebug(String msg, {BuildContext? context}) {
  if (kDebugMode) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.black, textColor: Colors.white);
  }
}
