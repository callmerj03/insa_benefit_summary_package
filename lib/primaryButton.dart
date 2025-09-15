import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../MarqueeWidget.dart';
import 'BenefitSummary/PolifyxTextStyles.dart';

Widget primaryButton({
  Key? key,
  Key? textKey,
  Color? backgroundColor,
  LinearGradient? gradient,
  BoxShadow? shadow,
  String? text,
  bool disabled = false,
  Widget? preFix,
  Widget? textWidget,
  Widget? suFix,
  void Function()? onTap,
  Color? color,
  double? minHeight,
  double? maxWidth,
  double? borderRadius,
  Color? borderColor,
  double? fontSize,
  double? borderWidth,
  Color? textColor,
  EdgeInsetsGeometry? padding,
  MainAxisAlignment? mainAxisAlignment,
  bool outlined = false,
  bool debounceEnabled = true,
}) =>
    ZoomTapAnimation(
      onTap: disabled
          ? null
          : () async {
              HapticFeedback.heavyImpact();
              if (debounceEnabled) {
                if (onTap != null) {
                  onTap.call();
                }
              } else {
                onTap?.call();
              }
            },
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 135, minHeight: minHeight ?? 46),
        key: key,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          boxShadow: shadow != null ? [shadow] : null,
          border: outlined ? Border.all(color: borderColor ?? Color.fromRGBO(0, 0, 0, 1), width: borderWidth ?? 1) : null,
          color: backgroundColor,
          gradient: backgroundColor != null
              ? null
              : outlined
                  ? null
                  : gradient ??
                      const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xffFDCC50), Color(0xffFAAA52)],
                      ),
        ),
        child: Center(
            child: textWidget ??
                Row(
                  mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                  children: [
                    if (preFix != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: preFix,
                      ),
                    Flexible(
                      child: MarqueeWidget(
                        child: Text(
                          text ?? '',
                          textAlign: TextAlign.center,
                          key: textKey,
                          style: PolifyxTextStyles().heading4.copyWith(color: textColor, fontSize: fontSize),
                        ),
                      ),
                    ),
                    if (suFix != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: suFix,
                      ),
                  ],
                )),
      ),
    );
