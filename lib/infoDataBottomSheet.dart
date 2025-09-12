import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'BenefitSummary/PolifyxTextStyles.dart';
import 'Commons.dart';
import 'NoDataFound.dart';
import 'SearchTextField.dart';

Future infoDataBottomSheet(
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
                            var searchData =
                            copiedData.where((element) => element.toString().toLowerCase().contains("${searched}")).toList();
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
                  data!.isNotEmpty
                      ? Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      thickness: 8,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                          itemCount: data?.length ?? 0,
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: DottedLine(
                                dashColor: Colors.grey.withOpacity(0.5),
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Container(
                                  height: 10,
                                  width: 10,
                                  color: AppColors().primaryThemeColor,
                                ),
                                enableFeedback: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 28),
                                horizontalTitleGap: 4,
                                minVerticalPadding: 0,
                                visualDensity: VisualDensity(vertical: -4),
                                title: Text(
                                  data?[index] ?? "",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                onTap: () {
                                  // onSelect?.call(data?[index] ?? Keys.empty);
                                  // Navigator.of(context).pop();
                                });
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
