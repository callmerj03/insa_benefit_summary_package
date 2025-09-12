

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppColors.dart';
import 'Images.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function()? onCancel;
  final bool showCancel;
  final String hint;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;

  const SearchTextField({
    Key? key,
    required this.onChanged,
    this.textEditingController,
    this.textInputAction = TextInputAction.go,
    this.onSubmitted,
    this.onCancel,
    this.showCancel = false,
    this.hint = "Search by Name or Mobile Number",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors().color_light_grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: textEditingController,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14),
              child: SvgPicture.asset(
                Images.svg_search,
                height: 16,
                width: 16,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 48, minWidth: 48,maxHeight: 32),
            suffixIcon: showCancel == false
                ? null
                : GestureDetector(
              onTap: onCancel,
              child: SvgPicture.asset(
                Images.svg_search_cancel,
                height: 16,
                width: 16,
              ),
            ),
            hintText: hint,
            isDense: true),
      ),
    );
  }
}
