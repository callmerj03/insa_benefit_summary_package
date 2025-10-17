import 'package:flutter/material.dart';

import 'AmountToWords.dart';
import 'AppColors.dart';
import 'BenefitSummary/PolifyxTextStyles.dart';
import 'Commons.dart';
import 'package:flutter_svg/svg.dart';
import 'Models/ZoneAndCopaymentModel.dart';
import 'NoDataFound.dart';
import 'SearchTextField.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:dotted_line/dotted_line.dart';

Future subLimitBottomSheet(
    {required BuildContext context,
    required List<dynamic?>? data,
    void Function(String)? onSelect,
    String? title,
    dynamic selectedValue,
    Widget? titleBar,
    bool showSearchBar = false}) {
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  if (data == null) {
    data = [];
  }
  List<dynamic> copiedData = [];
  data.forEach((element) {
    copiedData.add(element);
  });

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: const Color(0xffF0F4FD),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                  if (showSearchBar == true)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: SearchTextField(
                        showCancel: true,
                        onCancel: () {
                          textEditingController.clear();
                          removeFocus(context);
                          data!.clear();
                          copiedData.forEach((element) {
                            data!.add(element);
                          });
                        },
                        textEditingController: textEditingController,
                        hint: "Search",
                        onChanged: (searched) {
                          if (searched.isNotEmpty) {
                            var searchData = copiedData
                                .where((element) => element.toString().toLowerCase().contains("${searched}"))
                                .toList();
                            if (searchData.length > 0) {
                              data = searchData;
                            } else {
                              data!.clear();
                            }

                            setState(() {});
                          } else {
                            setState(() {
                              data!.clear();
                              copiedData.forEach((element) {
                                data!.add(element);
                              });
                            });
                          }
                        },
                      ),
                    ),
                  if (data != null)
                    if (data!.length > 0)
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffF0F4FD),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Treatment/Procedures",
                                style: textStyle.bodyText1Bold,
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Coverage Amount",
                                  style: textStyle.bodyText1Bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  data!.isNotEmpty
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: ListView.separated(
                                itemCount: data?.length ?? 0,
                                separatorBuilder: (context, index) {
                                  return DottedLine(
                                    dashColor: Colors.grey.withOpacity(0.5),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  var item = data![index];
                                  return IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        WidthSpace(width: 16),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text("${item['treatment']}"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: CustomPaint(
                                              painter: DashedLineVerticalPainter(), size: Size(1, double.infinity)),
                                        ),
                                        Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.symmetric(vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: AppColors().light_green5,
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: AppColors().green2,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                child: Center(child: Text("${item['coverage']}")))),
                                        WidthSpace(width: 16)
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

Future subLimitZoneBottomSheet({
  required BuildContext context,
  required List<dynamic?>? data,
  void Function(String)? onSelect,
  String? title,
  dynamic selectedValue,
  Widget? titleBar,
}) {
  final converter = AmountToWords();
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  //
  List<String> list = [];
  List<String> listOfData = [];
  List<List<dynamic>> listOfZones = [];

  if (data == null) {
    data = [];
  }

  list.add("Sum\nInsured");
  data.forEach((e) {
    list.add(e["sumInsured"].toString());
    listOfZones.add(e["zones"]);
  });

  printF("HAAA::: ${listOfZones}");

  List<List<dynamic>> transposedWithAlphabets = List.generate(
    listOfZones[0].length,
    (i) => [
      "Zone " + String.fromCharCode('A'.codeUnitAt(0) + i),
      for (var row in listOfZones) row[i],
    ],
  );
  printF("HAAA::: ${transposedWithAlphabets}");

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: const Color(0xffF0F4FD),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                  if (list != null)
                    if (list!.length > 0)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF0F4FD),
                        ),
                        child: Row(
                            children: List.generate(
                          list!.length,
                          (i) {
                            return Expanded(
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          i == 0
                                              ? "${list[i]}"
                                              : "Rs. ${converter.convertAmountToWords2(double.parse(list[i]))}",
                                          style: textStyle.bodyText1Bold.copyWith(fontSize: 12),
                                          textAlign: i == 0 ? TextAlign.left : TextAlign.center,
                                        ),
                                        padding: EdgeInsets.only(left: i == 0 ? 8 : 0),
                                      ),
                                    ),
                                    if (i != (list.length - 1))
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: CustomPaint(
                                            painter: DashedLineVerticalPainter(dashColor: Color(0xffF0F4FD)),
                                            size: Size(1, double.infinity)),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                      ),
                  transposedWithAlphabets.isNotEmpty
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                itemCount: transposedWithAlphabets.length ?? 0,
                                itemBuilder: (context, index) {
                                  var item = transposedWithAlphabets[index];
                                  return IntrinsicHeight(
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: List.generate(
                                                  item.length,
                                                  (i) {
                                                    return Expanded(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              margin: const EdgeInsets.symmetric(vertical: 24),
                                                              child: i == 0
                                                                  ? Row(
                                                                      children: [
                                                                        Container(
                                                                          color: AppColors().primaryThemeColor,
                                                                          height: 10,
                                                                          width: 10,
                                                                        ),
                                                                        WidthSpace(width: 8),
                                                                        Text("${item[i] ?? "-"}"),
                                                                      ],
                                                                    )
                                                                  : Text(item[i] == null
                                                                      ? "-"
                                                                      : "Rs. "
                                                                          "${item[i]}"),
                                                            ),
                                                          ),
                                                          if (i != (item.length - 1))
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                                              child: CustomPaint(
                                                                  painter: DashedLineVerticalPainter(),
                                                                  size: Size(1, double.infinity)),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ))),
                                        DottedLine(
                                          dashColor: Colors.grey.withOpacity(0.5),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

Future namedAilmentListBottomSheet({
  required BuildContext context,
  required List<dynamic?>? data,
  void Function(String)? onSelect,
  String? title,
  dynamic selectedValue,
  Widget? titleBar,
}) {
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  //
  List<String> list = [];
  List<String> listOfData = [];
  List<List<dynamic>> listOfZones = [];

  if (data == null) {
    data = [];
  }

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  //
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: AppColors().color_skin2,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),

                  (data ?? []).isNotEmpty
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(color: AppColors().color_skin2, width: 2)),
                                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                                child: ListView.builder(
                                    itemCount: (data ?? []).length ?? 0,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    primary: true,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var item = data![index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if (index == 0)
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Duration",
                                                        style: textStyle.heading4.copyWith(fontSize: 18),
                                                      ),
                                                      flex: 2,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "List",
                                                        style: textStyle.heading4.copyWith(fontSize: 18),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors().color_skin2,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    topRight: Radius.circular(16),
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 16 / 2, vertical: 16 - 2),
                                              ),

                                            //
                                            IntrinsicHeight(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                      child: Text("${item["duration"]}",
                                                          style: textStyle.heading4.copyWith(fontSize: 14)),
                                                    ),
                                                    flex: 2,
                                                  ),

                                                  // vertical line
                                                  Container(
                                                    width: 2,
                                                    color: AppColors().color_skin2,
                                                    // margin: const EdgeInsets.symmetric(horizontal: 8),
                                                  ),

                                                  //
                                                  Expanded(
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: (item["list"] as List).map<Widget>((listItem) {
                                                          String text = listItem.toString();

                                                          if (text.contains("\n*")) {
                                                            // Split by "\n*" and remove empty strings
                                                            List<String> parts = text
                                                                .split("\n*")
                                                                .map((e) => e.trim())
                                                                .where((e) => e.isNotEmpty)
                                                                .toList();

                                                            return Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 4, horizontal: 4),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        "• ",
                                                                        style: textStyle.heading4.copyWith(
                                                                            fontSize: 14, fontWeight: FontWeight.bold),
                                                                      ),
                                                                      Expanded(
                                                                        child: Text(
                                                                          parts
                                                                              .first, // Main heading before first bullet
                                                                          style: textStyle.heading4.copyWith(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  ...parts.skip(1).map((subItem) => Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 12, top: 2),
                                                                        child: Row(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text("• "),
                                                                            Expanded(
                                                                              child: Text(
                                                                                subItem,
                                                                                style: textStyle.bodyText1
                                                                                    .copyWith(fontSize: 14),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            );
                                                          } else {
                                                            // Normal single-line item
                                                            return Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 4, horizontal: 4),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    "• ",
                                                                    style: textStyle.heading4.copyWith(
                                                                        fontSize: 14, fontWeight: FontWeight.bold),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      text,
                                                                      style: textStyle.heading4.copyWith(
                                                                          fontSize: 14, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        }).toList(),
                                                      ),
                                                      padding: EdgeInsets.only(left: 8),
                                                      decoration: BoxDecoration(
                                                        color: AppColors().light_yellow4,
                                                        borderRadius: BorderRadius.only(
                                                          bottomRight: Radius.circular(16),
                                                          bottomLeft: Radius.circular(16),
                                                        ),
                                                      ),
                                                    ),
                                                    flex: 3,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            if (index < data.length - 1)
                                              Container(
                                                width: double.infinity,
                                                color: AppColors().color_skin2,
                                                height: 2,
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

Future paCoverageBottomSheet({
  required BuildContext context,
  required List<dynamic?>? data,
  void Function(String)? onSelect,
  String? title,
  dynamic selectedValue,
  Widget? titleBar,
}) {
  final converter = AmountToWords();
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  //
  List<String> list = [];
  List<String> listOfData = [];
  List<List<dynamic>> listOfZones = [];

  if (data == null) {
    data = [];
  }

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  //
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: AppColors().color_skin2,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),

                  (data ?? []).isNotEmpty
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(color: AppColors().color_skin2, width: 2)),
                                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                                child: ListView.builder(
                                    itemCount: (data ?? []).length ?? 0,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    primary: true,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var item = data![index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if (index == 0)
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Coverage",
                                                        style: textStyle.heading4.copyWith(fontSize: 18),
                                                      ),
                                                      flex: 2,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "Insured Events",
                                                        style: textStyle.heading4.copyWith(fontSize: 18),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors().color_skin2,
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(16),
                                                    topRight: Radius.circular(16),
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 16 / 2, vertical: 16 - 2),
                                              ),

                                            //
                                            IntrinsicHeight(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                      child: Text("${item["coverage"]}",
                                                          style: textStyle.heading4.copyWith(fontSize: 14)),
                                                    ),
                                                    flex: 2,
                                                  ),

                                                  // vertical line
                                                  Container(
                                                    width: 2,
                                                    color: AppColors().color_skin2,
                                                    // margin: const EdgeInsets.symmetric(horizontal: 8),
                                                  ),

                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                      child: Text("${item["insuredEventsValue"]}",
                                                          style: textStyle.heading4.copyWith(fontSize: 14)),
                                                    ),
                                                    flex: 3,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            if (index < data.length - 1)
                                              Container(
                                                width: double.infinity,
                                                color: AppColors().color_skin2,
                                                height: 2,
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

Future zoneAndCopaymentBottomSheet({
  required BuildContext context,
  required ZoneAndCopaymentModel data,
  String? title,
  Widget? titleBar,
}) {
  final converter = AmountToWords();
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  //
  List<String> list = [];
  List<String> listOfData = [];
  List<List<dynamic>> listOfZones = [];

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  //
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: AppColors().color_skin2,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),

                  (data != null)
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //
                                  if ((data.zones ?? []).isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(color: AppColors().color_skin2, width: 2)),
                                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                                      child: ListView.builder(
                                          itemCount: data.zones?.length ?? 0,
                                          physics: NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          primary: true,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            //
                                            var zone = data.zones![index];

                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  if (index == 0)
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              "Zone",
                                                              style: textStyle.heading4.copyWith(fontSize: 18),
                                                            ),
                                                            flex: 2,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "States",
                                                              style: textStyle.heading4.copyWith(fontSize: 18),
                                                            ),
                                                            flex: 4,
                                                          ),
                                                        ],
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: AppColors().color_skin2,
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(16),
                                                          topRight: Radius.circular(16),
                                                        ),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(horizontal: 16 / 2, vertical: 16 - 2),
                                                    ),

                                                  //
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        //
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                            child: Text("${zone.zone}",
                                                                style: textStyle.heading4.copyWith(fontSize: 14)),
                                                          ),
                                                          flex: 2,
                                                        ),

                                                        // vertical line
                                                        Container(
                                                          width: 2,
                                                          color: AppColors().color_skin2,
                                                          // margin: const EdgeInsets.symmetric(horizontal: 8),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                //
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 4, horizontal: 8),
                                                                  child: Text("${zone.states}",
                                                                      style: textStyle.heading4.copyWith(fontSize: 14)),
                                                                ),

                                                                //
                                                                if (zone.note != null)
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors().light_grey8,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(8),
                                                                            topRight: Radius.circular(8)),
                                                                        border: Border.all(
                                                                            color: AppColors().light_grey8,
                                                                            width: 1.5)),
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(8),
                                                                            topRight: Radius.circular(8)),
                                                                        color: AppColors().pure_white,
                                                                      ),
                                                                      margin: EdgeInsets.only(left: 8),
                                                                      padding: EdgeInsets.all(4),
                                                                      child: Text(
                                                                        zone.note ?? "",
                                                                        style: textStyle.subHeading2
                                                                            .copyWith(fontSize: 12),
                                                                      ),
                                                                    ),
                                                                    width: double.infinity,
                                                                    margin: EdgeInsets.only(left: 8),
                                                                  ),
                                                              ],
                                                            ),
                                                            height: double.infinity,
                                                            decoration: BoxDecoration(
                                                              color: AppColors().light_yellow4,
                                                              borderRadius: BorderRadius.only(
                                                                bottomRight: Radius.circular(16),
                                                                bottomLeft: Radius.circular(16),
                                                              ),
                                                            ),
                                                          ),
                                                          flex: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  if (index < (data.zones ?? []).length - 1)
                                                    Container(
                                                      width: double.infinity,
                                                      color: AppColors().color_skin2,
                                                      height: 2,
                                                    ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),

                                  //

                                  if ((data.coPaymentRules ?? []).isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(color: AppColors().color_skin2, width: 2)),
                                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                                      child: ListView.builder(
                                          itemCount: data.coPaymentRules?.length ?? 0,
                                          physics: NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          primary: true,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            //
                                            var coPaymentRule = data.coPaymentRules![index];

                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  if (index == 0)
                                                    Container(
                                                      child: Center(
                                                        child: Text(
                                                          "Co-Payment",
                                                          style: textStyle.heading4.copyWith(fontSize: 18),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: AppColors().color_skin2,
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(16),
                                                          topRight: Radius.circular(16),
                                                        ),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(horizontal: 16 / 2, vertical: 16 - 2),
                                                    ),
                                                  // Container(
                                                  //   child: Row(
                                                  //     children: [
                                                  //       Expanded(
                                                  //         child: Text(
                                                  //           "Zone",
                                                  //           style: textStyle.heading4.copyWith(fontSize: 18),
                                                  //         ),
                                                  //         flex: 2,
                                                  //       ),
                                                  //       Expanded(
                                                  //         child: Text(
                                                  //           "Copayment",
                                                  //           style: textStyle.heading4.copyWith(fontSize: 18),
                                                  //         ),
                                                  //         flex: 3,
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  //   decoration: BoxDecoration(
                                                  //     color: AppColors().color_skin2,
                                                  //     borderRadius: BorderRadius.only(
                                                  //       topLeft: Radius.circular(16),
                                                  //       topRight: Radius.circular(16),
                                                  //     ),
                                                  //   ),
                                                  //   padding: EdgeInsets.symmetric(horizontal: 16 / 2, vertical: 16 - 2),
                                                  // ),

                                                  //
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        //
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                            child: Text("${coPaymentRule.insuredPaying}",
                                                                style: textStyle.heading4.copyWith(fontSize: 14)),
                                                          ),
                                                          flex: 2,
                                                        ),

                                                        // vertical line
                                                        Container(
                                                          width: 1,
                                                          color: AppColors().color_skin2,
                                                          // margin: const EdgeInsets.symmetric(horizontal: 8),
                                                        ),

                                                        Expanded(
                                                          child: Container(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 4, horizontal: 8),
                                                              height: double.infinity,
                                                              decoration: BoxDecoration(
                                                                color: AppColors().light_yellow4,
                                                                borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius.circular(16),
                                                                  bottomLeft: Radius.circular(16),
                                                                ),
                                                              ),
                                                              child: HtmlWidget(
                                                                coPaymentRule.copaymentRules ?? '',
                                                                renderMode: RenderMode.column,
                                                                enableCaching: true,
                                                                textStyle: textStyle.heading4.copyWith(
                                                                    fontSize: 14, fontWeight: FontWeight.bold),
                                                              )),
                                                          flex: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  if (index < (data.zones ?? []).length - 1)
                                                    Container(
                                                      width: double.infinity,
                                                      color: AppColors().color_skin2,
                                                      height: 2,
                                                    ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

Future subLimitTreatmentBottomSheet(
    {required BuildContext context,
    required List<dynamic?>? data,
    void Function(String)? onSelect,
    String? title,
    dynamic selectedValue,
    Widget? titleBar,
    int flex = 3,
    bool showSearchBar = false}) {
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();
  TextEditingController textEditingController = TextEditingController();

  if (data == null) {
    data = [];
  }
  List<dynamic> copiedData = [];
  data.forEach((element) {
    copiedData.add(element);
  });

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        side: BorderSide(color: Colors.transparent, width: 2),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: titleBar ??
                        Container(
                          width: width,
                          color: const Color(0xffF0F4FD),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ContainerDivider(),
                                HeightSpace(height: 12),
                                Text(
                                  title ?? 'Please select',
                                  style: textStyle.heading4,
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
                  if (showSearchBar == true)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: SearchTextField(
                        showCancel: true,
                        onCancel: () {
                          textEditingController.clear();
                          removeFocus(context);
                          data!.clear();
                          copiedData.forEach((element) {
                            data!.add(element);
                          });
                        },
                        textEditingController: textEditingController,
                        hint: "Search",
                        onChanged: (searched) {
                          if (searched.isNotEmpty) {
                            var searchData = copiedData
                                .where((element) => element.toString().toLowerCase().contains("${searched}"))
                                .toList();
                            if (searchData.length > 0) {
                              data = searchData;
                            } else {
                              data!.clear();
                            }

                            setState(() {});
                          } else {
                            setState(() {
                              data!.clear();
                              copiedData.forEach((element) {
                                data!.add(element);
                              });
                            });
                          }
                        },
                      ),
                    ),
                  if (data != null)
                    if (data!.length > 0)
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xffF0F4FD),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Treatment/Procedures",
                                style: textStyle.bodyText1Bold,
                              ),
                              flex: flex,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  data![0]['coverage2'] == null ? "Coverage Amount" : "Sub limit Option 1",
                                  style: textStyle.bodyText1Bold,
                                ),
                              ),
                            ),
                            if (data![0]['coverage2'] != null)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    "Sub limit Option 2",
                                    style: textStyle.bodyText1Bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  data!.isNotEmpty
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            thickness: 8,
                            child: ListView.separated(
                                itemCount: data?.length ?? 0,
                                separatorBuilder: (context, index) {
                                  return DottedLine(
                                    dashColor: Colors.grey.withOpacity(0.5),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  var item = data![index];
                                  return IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        WidthSpace(width: 16),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text("${item['treatment']}"),
                                          ),
                                          flex: flex,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: CustomPaint(
                                              painter: DashedLineVerticalPainter(), size: Size(1, double.infinity)),
                                        ),
                                        Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.symmetric(vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: AppColors().light_green5,
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: AppColors().green2,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                child: Center(child: Text("${item['coverage1']}")))),
                                        if (item['coverage2'] != null)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: CustomPaint(
                                                painter: DashedLineVerticalPainter(), size: Size(1, double.infinity)),
                                          ),
                                        if (item['coverage2'] != null)
                                          Expanded(
                                              child: Container(
                                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: AppColors().light_green5,
                                                    borderRadius: BorderRadius.circular(4),
                                                    border: Border.all(
                                                      color: AppColors().green2,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  child: Center(child: Text("${item['coverage2']}")))),
                                        WidthSpace(width: 16),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      : NoDataFound(text: "No data found"),
                ],
              ),
            ),
          );
        });
      });
}

// cashless is wrap in this function
String refactorHtmlForFlutter(String originalHtml) {
  String updated = originalHtml;

  // Replace only flex-wrap wrappers
  updated = updated.replaceAllMapped(
    RegExp(r'<div[^>]*style="[^"]*flex-wrap:\s*wrap[^"]*"[^>]*>'),
    (match) {
      // Remove the style but preserve the tag
      return '<div>';
    },
  );

  // Clean specific inline styles like display:flex, gap, align-items
  // updated = updated.replaceAllMapped(
  //   RegExp(r'<div([^>]*)style="([^"]*)"([^>]*)>'),
  //       (match) {
  //     final full = match.group(0)!;
  //     final preAttr = match.group(1) ?? '';
  //     final style = match.group(2) ?? '';
  //     final postAttr = match.group(3) ?? '';
  //
  //
  //     // Detect if this div is inside a table cell or row
  //     final isTableRelated = preAttr.contains('td') || preAttr.contains('tr') || postAttr.contains('td') || postAttr.contains('tr');
  //
  //     if (isTableRelated && (style.contains('display: flex') || style.contains('gap') || style.contains('align-items'))) {
  //       // Remove only spacing-related styles
  //       String newStyle = style
  //           .replaceAll(RegExp(r'display:\s*flex;?'), '')
  //           .replaceAll(RegExp(r'gap:[^;"]+;?'), '')
  //           .replaceAll(RegExp(r'align-items:[^;"]+;?'), '')
  //           .trim();
  //
  //       if (newStyle.isNotEmpty) {
  //         return '<div$preAttr style="$newStyle"$postAttr>';
  //       } else {
  //         return '<div$preAttr$postAttr>';
  //       }
  //     }
  //
  //     // Leave divs outside table cells untouched (important for tick layout)
  //     return full;
  //   },
  // );

  // Fix tick icon size (ensure width is fixed)
  // updated = updated.replaceAllMapped(
  //   RegExp(r'<img([^>]*tick\.svg[^>]*)>'),
  //   (match) {
  //     final imgTag = match.group(1) ?? '';
  //     if (imgTag.contains('width=')) return '<img$imgTag>';
  //     return '<img$imgTag width="14">';
  //   },
  // );

  return updated;
}

String wrapTable(String html) {
  return html
      .replaceAllMapped(
        RegExp(r'(<table[^>]*>)'),
        (match) => '<div style="overflow-x:auto;width:100%;">${match[1]}',
      )
      .replaceAll('</table>', '</table></div>');
}

String forceSecondColumnMinWidth(String html) {
  return html.replaceAllMapped(
    RegExp(r'<table[^>]*>.*?</table>', dotAll: true),
    (match) {
      String table = match.group(0)!;

      // Match all <th> tags
      final thMatches = RegExp(r'<th[^>]*>.*?</th>', dotAll: true).allMatches(table).toList();

      if (thMatches.isNotEmpty) {
        final lastThMatch = thMatches.last;
        final lastTh = lastThMatch.group(0)!;

        // Extract inner text
        final innerTextMatch = RegExp(r'>(.*?)</th>', dotAll: true).firstMatch(lastTh);
        if (innerTextMatch != null) {
          final innerText = innerTextMatch.group(1)!;

          // Create modified last th with min-width
          final newLastTh = lastTh.replaceFirst(
            innerText,
            '<span style="display:inline-block; min-width:300px;">$innerText</span>',
          );

          // Replace original <th> with new one
          table = table.replaceFirst(lastTh, newLastTh);
        }
      }

      return table;
    },
  );
}

Future htmlViewBottomSheet({
  required BuildContext context,
  required String? data,
  String? title,
  bool showTitle = false,
}) {
  data = wrapTable(data ?? "");
  data = forceSecondColumnMinWidth(data);
  data = data.replaceAll(RegExp(r'font-family:[^;"]+;?'), '');
  data = refactorHtmlForFlutter(data ?? "");

  printF("${data}");

  final maxHeight = MediaQuery.of(context).size.height * 0.8;
  final width = MediaQuery.of(context).size.width;
  final textStyle = PolifyxTextStyles();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 Fixed Header
              if (showTitle == true)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    color: Colors.grey.withValues(alpha: 0.2),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      ContainerDivider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          title ?? '',
                          style: textStyle.heading4,
                        ),
                      ),
                    ],
                  )),
                ),

              // 🔹 Scrollable content within 90% height
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: HtmlWidget(
                    data ?? '',
                    renderMode: RenderMode.column,
                    enableCaching: true,
                    textStyle: TextStyle(
                      fontFamily: 'Nunito-Medium',
                    ),
                    factoryBuilder: () => MyWidgetFactory(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class DashedLineVerticalPainter extends CustomPainter {
  Color dashColor;

  DashedLineVerticalPainter({this.dashColor = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 3, dashSpace = 2, startY = 1;
    final paint = Paint()
      ..color = dashColor.withOpacity(0.7)
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyWidgetFactory extends WidgetFactory {
  @override
  Widget buildImageWidget(BuildTree tree, ImageSource src) {
    final url = src.url;

    if (url != null && url.endsWith('.svg')) {
      return SvgPicture.network(
        url,
        placeholderBuilder: (context) => const SizedBox(
          height: 24,
          width: 24,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
      );
    }

    // fallback to super implementation
    final widget = super.buildImageWidget(tree, src);
    return widget ?? const SizedBox(); // 👈 safe fallback
  }
}
