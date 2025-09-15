import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../AppColors.dart';
import '../Commons.dart';
import '../Images.dart';
import '../Models/KeyValueModel.dart';
import '../Models/ZoneAndCopaymentModel.dart';
import '../NoDataFound.dart';
import '../infoDataBottomSheet.dart';
import '../primaryButton.dart';
import '../sub_limit_bottom_sheet.dart';
import 'BenefitTextParse.dart';
import 'PolifyxTextStyles.dart';

class BenefitSummary extends StatefulWidget {
  static final routeName = '/BenefitSummary';

  String? policyId;
  bool? isPaid;
  Widget amountPopup;
  bool isButtonAnimationAllowed;
  Map<String, dynamic> jsonObject;
  Function() moveToResultScreen;
  Color buttonColor;

  BenefitSummary({
    super.key,
    this.policyId,
    required this.moveToResultScreen,
    required this.isPaid,
    required this.amountPopup,
    required this.jsonObject,
    required this.buttonColor,
    this.isButtonAnimationAllowed = true,
  });

  @override
  State<BenefitSummary> createState() => _BenefitSummaryState();
}

class _BenefitSummaryState extends State<BenefitSummary> {
  final textStyle = PolifyxTextStyles();

  final hospitalCardKey = GlobalKey();
  final otherCardKey = GlobalKey();
  final waitingCardKey = GlobalKey();
  final exclusionCardKey = GlobalKey();

  String hospital_limit_coverage = "hospital_limit_coverage";
  String other_benefits = "other_benefits";
  String waiting_periods = "waiting_periods";
  String exclusion = "exclusion";

  List<String> benefitSummaryStatusList = [];
  int version = 1;

  final scrollController = ScrollController();
  PageController _pageController = PageController();

  String selectedCard = "";

  List<KeyValueModel> hospitalList = [];
  List<KeyValueModel> otherList = [];
  List<KeyValueModel> waitignPeriodList = [];
  List<KeyValueModel> exclusionList = [];

  var zoneText = ":zone";
  var treatmentText = ":treatment";
  var healthCheckUp = ":healthCheckUp";
  var adultVaccination = ":adultVaccination";
  var childVaccination = ":childVaccination";
  var modernTreatmentList = ":advancedLists";
  var paCoverage = ":paCoverage";
  var waitingPeriodSubLimits = ":waiting-period-sublimits";
  var mordernTreatmentSubLimits = ":modern-treatment-sublimits";
  var zoneAndCopayment = ":zoneAndCopayment";
  var cataractCoverage = ":cataractCoverage";

  @override
  void initState() {
    super.initState();
    parseJson(widget.jsonObject);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  GlobalKey getKey({required String selectedCard}) {
    if (selectedCard == hospital_limit_coverage) {
      return hospitalCardKey;
    } else if (selectedCard == other_benefits) {
      return otherCardKey;
    } else if (selectedCard == waiting_periods) {
      return waitingCardKey;
    } else if (selectedCard == exclusion) {
      return exclusionCardKey;
    } else {
      return hospitalCardKey;
    }
  }

  List<dynamic>? modernCoverage = [];
  List<dynamic>? modernCoverageSubLimit = [];
  List<dynamic>? listOfDisease = [];
  List<dynamic>? listOfZones = [];
  List<dynamic>? listOfTreatment = [];
  dynamic personalAccidentCoverList;
  dynamic? zoneAndCopaymentList = {};
  dynamic cataract_coverage_list;

  String moratoriumPeriod = "";

  String? healthCheckupTableDetailsOtherObj = "";
  String? adultVaccinationTableDetailsOtherObj = "";
  String? childVaccinationTableDetailsOtherObj = "";

  void moveToResultScreen() {
    widget.moveToResultScreen();
  }

  void parseJson(Map<String, dynamic> jsonObject) {
    if (jsonObject['data'] != null) {
      final data = (jsonObject['data'] is Map) ? jsonObject['data'] as Map : {};
      var hospitalObj;
      var otherObj;
      var waitingPeriodObj;
      var addOns;

      version = data.containsKey('version') == true ? data['version'] : 1;
      printF("versionversion>> ${version}");

      if (version == 1) {
        // for version 1 use these keys
        hospitalObj = data['hospitalisationBenefits'];
        otherObj = data['otherBenefits'];
        waitingPeriodObj = data['waitingPeriodAndSubLimits'];
      }

      if (version == 2) {
        // for version 2 use these keys
        hospitalObj = data['coverageAndLimits'];
        otherObj = data['otherBenefitsAndLimits'];
        waitingPeriodObj = data['waitingPeriodAndSubLimitsV2'];
        addOns = data['addOns'];
      }

      printF("data['addOns']:: ${data['addOns']}");

      var exclusionObj = data['exclusions'];

      //
      // final moratoriumData = jsonObject['data']['moratoriumPeriod']['MORATORIUM_PERIOD'];
      // moratoriumPeriod = moratoriumData != null ? moratoriumData['value'] : null;
      moratoriumPeriod = (jsonObject['data']?['moratoriumPeriod']?['MORATORIUM_PERIOD']?['value'] ?? "");

      if (hospitalObj == null && otherObj == null && waitingPeriodObj == null && exclusionObj == null) {
        moveToResultScreen();
      } else {
        if (exclusionObj == null) {
          exclusionObj = [];
        }

        hospitalList.clear();
        otherList.clear();
        waitignPeriodList.clear();
        exclusionList.clear();

        Iterable<String> hospitalKeys = hospitalObj.keys;
        Iterable<String> otherKeys = otherObj.keys;
        Iterable<String> waitingKeys = waitingPeriodObj.keys;

        for (var key in hospitalKeys) {
          var obj = hospitalObj[key];
          if (obj != null) {
            if (obj is Map) {
              var header = obj['key'];
              var content = obj['value'];
              var tooltip = obj['tooltip'];
              var disclaimer = obj['disclaimer'];
              if (header != null) {
                hospitalList.add(KeyValueModel.withTooltip(header, content, disclaimer, false, tooltip, false));
              }
            } else {}
          }
        }

        for (var key in otherKeys) {
          var obj = otherObj[key];
          if (obj != null) {
            if (obj is Map) {
              var header = obj['key'];
              var content = obj['value'];
              var tooltip = obj['tooltip'];
              var disclaimer = obj['disclaimer'];
              if (header != null) {
                otherList.add(KeyValueModel.withTooltip(header, content, disclaimer, false, tooltip, false));
              }
            } else {}
          }
        }

        for (var key in waitingKeys) {
          var obj = waitingPeriodObj[key];
          if (obj != null) {
            if (obj is Map) {
              var header = obj['key'];
              var content = obj['value'];
              var tooltip = obj['tooltip'];
              var disclaimer = obj['disclaimer'];
              if (header != null) {
                waitignPeriodList.add(KeyValueModel.withTooltip(header, content, disclaimer, false, tooltip, false));
              }
            } else {}
          }
        }

        exclusionObj.forEach((e) {
          exclusionList.add(KeyValueModel(null, e, false));
        });

        printF(">><<addOns ${addOns}");

        //
        if (addOns != null) {
          for (var obj in addOns) {
            var header = obj['key'];
            var content = obj['value'];
            var tooltip = obj['tooltip'];
            var disclaimer = obj['disclaimer'];
            if (header != null) {
              hospitalList.add(KeyValueModel.withTooltip(header, content, disclaimer, false, tooltip, true));
            }
          }
        }

        if (version == 1) {
          if (otherObj['MODERN_TREATMENT_COVERAGE_LIST'] != null) {
            modernCoverage = otherObj['MODERN_TREATMENT_COVERAGE_LIST'];
          }
        } else {
          if (hospitalObj['MODERN_TREATMENT_COVERAGE_LIST'] != null) {
            modernCoverage = hospitalObj['MODERN_TREATMENT_COVERAGE_LIST'];
          }
        }

        if (version == 1) {
          if (otherObj['MODERN_TREATMENT_SUB_LIMITS'] != null) {
            modernCoverageSubLimit = otherObj['MODERN_TREATMENT_SUB_LIMITS'];
          }
        } else {
          if (hospitalObj['MODERN_TREATMENT_SUB_LIMITS'] != null) {
            modernCoverageSubLimit = hospitalObj['MODERN_TREATMENT_SUB_LIMITS'];
          }
        }

        if (otherObj['PERSONAL_ACCIDENT_COVER_LIST'] != null) {
          personalAccidentCoverList = otherObj['PERSONAL_ACCIDENT_COVER_LIST'];
        }

        if (version == 1) {
          if (otherObj['HEALTH_CHECK_UP_DETAILS'] != null) {
            healthCheckupTableDetailsOtherObj = otherObj['HEALTH_CHECK_UP_DETAILS']['tableDetails'];
          }

          if (otherObj['ADULT_VACCINATION_DETAILS'] != null) {
            adultVaccinationTableDetailsOtherObj = otherObj['ADULT_VACCINATION_DETAILS']['tableDetails'];
          }

          if (otherObj['CHILD_VACCINATION_DETAILS'] != null) {
            childVaccinationTableDetailsOtherObj = otherObj['CHILD_VACCINATION_DETAILS']['tableDetails'];
          }
        } else {
          if (hospitalObj['HEALTH_CHECK_UP_DETAILS'] != null) {
            healthCheckupTableDetailsOtherObj = hospitalObj['HEALTH_CHECK_UP_DETAILS']['tableDetails'];
          }

          if (hospitalObj['ADULT_VACCINATION_DETAILS'] != null) {
            adultVaccinationTableDetailsOtherObj = hospitalObj['ADULT_VACCINATION_DETAILS']['tableDetails'];
          }

          if (hospitalObj['CHILD_VACCINATION_DETAILS'] != null) {
            childVaccinationTableDetailsOtherObj = hospitalObj['CHILD_VACCINATION_DETAILS']['tableDetails'];
          }
        }

        cataract_coverage_list = hospitalObj["CATARACT_COVERAGE_LIST"];

        if (otherObj['ZONE_AND_COPAYMENT_LIST'] != null) {
          zoneAndCopaymentList = otherObj['ZONE_AND_COPAYMENT_LIST'];
        }

        if (waitingPeriodObj['NAMED_AILMENT_LIST'] != null) {
          listOfDisease = waitingPeriodObj['NAMED_AILMENT_LIST'];
        }

        if (waitingPeriodObj['SUB_LIMITS_LIST_ZONE'] != null) {
          listOfZones = waitingPeriodObj['SUB_LIMITS_LIST_ZONE'];
        }

        if (waitingPeriodObj['SUB_LIMITS_LIST_TREATMENT'] != null) {
          if (waitingPeriodObj['SUB_LIMITS_LIST_TREATMENT']['sublimits'] != null) {
            listOfTreatment = waitingPeriodObj['SUB_LIMITS_LIST_TREATMENT']['sublimits'];
          }
        }

        printF(">>>>aaatteeeeehhiiii ${listOfTreatment}");

        if (hospitalList.isEmpty && otherList.isEmpty && waitignPeriodList.isEmpty && exclusionList.isEmpty) {
          moveToResultScreen();
        } else {
          if (hospitalList.isNotEmpty) {
            benefitSummaryStatusList.add(hospital_limit_coverage);
            if (selectedCard.isEmpty) {
              selectedCard = hospital_limit_coverage;
            }
          }

          if (otherList.isNotEmpty) {
            benefitSummaryStatusList.add(other_benefits);
            if (selectedCard.isEmpty) {
              selectedCard = other_benefits;
            }
          }

          if (waitignPeriodList.isNotEmpty) {
            benefitSummaryStatusList.add(waiting_periods);
            if (selectedCard.isEmpty) {
              selectedCard = waiting_periods;
            }
          }

          if (exclusionList.isNotEmpty) {
            benefitSummaryStatusList.add(exclusion);
            if (selectedCard.isEmpty) {
              selectedCard = exclusion;
            }
          }

          setState(() {});
        }
      }
    } else {
      moveToResultScreen();
    }
  }

  void selectCard(String benefitSummaryStatus, {bool scrollpageview = false}) {
    setState(() {
      selectedCard = benefitSummaryStatus;
    });

    //
    if (scrollpageview) {
      _pageController.jumpToPage(benefitSummaryStatusList.indexOf(selectedCard));
    }

    scrollController.position.ensureVisible(
      getKey(selectedCard: selectedCard).currentContext!.findRenderObject()!,
      alignment: 0.3,
      // How far into view the item should be scrolled (between 0 and 1).
      duration: const Duration(seconds: 1),
    );
  }

  Color getColor({required String selectedCard}) {
    if (selectedCard == hospital_limit_coverage) {
      return AppColors().light_peacock;
    } else if (selectedCard == other_benefits) {
      return AppColors().bottelGreen_light;
    } else if (selectedCard == waiting_periods) {
      return AppColors().orange_light;
    } else if (selectedCard == exclusion) {
      return AppColors().cherryRed_light;
    } else {
      return AppColors().light_peacock;
    }
  }

  Color getColorDark({required String selectedCard}) {
    if (selectedCard == hospital_limit_coverage) {
      return AppColors().peacock;
    } else if (selectedCard == other_benefits) {
      return AppColors().bottelGreen;
    } else if (selectedCard == waiting_periods) {
      return AppColors().orange;
    } else if (selectedCard == exclusion) {
      return AppColors().cherryRed;
    } else {
      return AppColors().peacock;
    }
  }

  String getImage({required String selectedCard}) {
    if (selectedCard == hospital_limit_coverage) {
      return Images.img_hosp_benefit_summary;
    } else if (selectedCard == other_benefits) {
      return Images.img_other_benefit_summary;
    } else if (selectedCard == waiting_periods) {
      return Images.img_waiting_benefit_summary;
    } else if (selectedCard == exclusion) {
      return Images.img_exclusion_benefit_summary;
    } else {
      return Images.img_hosp_benefit_summary;
    }
  }

  String getString({required String selectedCard}) {
    if (selectedCard == hospital_limit_coverage) {
      return version == 1 ? "Hospitalisation Benefits" : "Coverages & Limits";
    } else if (selectedCard == other_benefits) {
      return version == 1 ? "Other Benefits" : "Other Benefits & Limits";
    } else if (selectedCard == waiting_periods) {
      return "Waiting Periods";
    } else if (selectedCard == exclusion) {
      return "Exclusions";
    } else {
      return "Hospitalisation Benefits";
    }
  }

  List<KeyValueModel> getList({required String selectedCard}) {
    // if (manualIndex != null) {
    //   if (manualIndex == 0) {
    //     return hospitalList;
    //   } else if (manualIndex == 1) {
    //     return otherList;
    //   } else if (manualIndex == 2) {
    //     return waitignPeriodList;
    //   } else if (manualIndex == 3) {
    //     return exclusionList;
    //   } else {
    //     return hospitalList;
    //   }
    // } else {
    if (selectedCard == hospital_limit_coverage) {
      return hospitalList;
    } else if (selectedCard == other_benefits) {
      return otherList;
    } else if (selectedCard == waiting_periods) {
      return waitignPeriodList;
    } else if (selectedCard == exclusion) {
      return exclusionList;
    } else {
      return hospitalList;
    }
    // }
  }

  Widget getBanner({required String selectedCard}) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: getColor(selectedCard: selectedCard), // Set border color
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          getString(selectedCard: selectedCard),
          style: TextStyle(
            color: getColorDark(selectedCard: selectedCard),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors().pure_white,
            AppColors().divider_color1,
            AppColors().divider_color,
            AppColors().divider_color,
            AppColors().divider_color1,
            AppColors().pure_white,
          ],
        ),
      ),
    );
  }

  // thumbVisibility: true,
  // thickness: 8,
  Widget content({required String selectedCard}) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16, top: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 5, color: getColor(selectedCard: selectedCard).withOpacity(0.3))],
                  border: Border.all(
                    color: getColor(selectedCard: selectedCard), // Set border color
                    width: 1.5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: getColor(selectedCard: selectedCard).withOpacity(0.2),
                ),
                child: Container(
                  decoration: BoxDecoration(color: AppColors().pure_white, borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: getList(selectedCard: selectedCard).length > 0
                      ? ListView.separated(
                          primary: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = getList(selectedCard: selectedCard)[index];

                            var headerTexts = benefitText(text: item.key ?? "");
                            var contentTexts = benefitText(text: item.value ?? "");
                            var disclaimerTexts = item.disclaimer;

                            return Container(
                              decoration: BoxDecoration(
                                color: headerTexts.toString().contains(removeBrackes(tag6End)) ||
                                        contentTexts.toString().contains(removeBrackes(tag6End)) ||
                                        headerTexts.toString().contains(removeBrackes(tag6)) ||
                                        contentTexts.toString().contains(removeBrackes(tag6)) ||
                                        headerTexts.toString().contains(settlement) ||
                                        contentTexts.toString().contains(settlement)
                                    ? getColor(selectedCard: selectedCard).withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: selectedCard == exclusion
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IntrinsicHeight(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                                decoration: BoxDecoration(
                                                  borderRadius: index == 0
                                                      ? BorderRadius.only(topLeft: Radius.circular(10))
                                                      : ((getList(selectedCard: selectedCard).length - 1) == index)
                                                          ? BorderRadius.only(bottomLeft: Radius.circular(10))
                                                          : null,
                                                  color: getColor(selectedCard: selectedCard).withOpacity(0.4),
                                                ),
                                                child: Image.asset(
                                                  selectedCard == exclusion ? Images.img_cancel : Images.greenTickPng,
                                                  width: selectedCard == exclusion ? 14 : 16,
                                                  color: getColorDark(selectedCard: selectedCard),
                                                ),
                                              ),
                                              WidthSpace(width: 16),
                                              Expanded(
                                                child: Align(
                                                  child: beneFitText(texts: contentTexts, selectedCard: selectedCard),
                                                  alignment: Alignment.centerLeft,
                                                ),
                                              ),
                                              WidthSpace(width: 8),
                                            ],
                                          ),
                                        ),
                                        if ((getList(selectedCard: selectedCard).length - 1) != index)
                                          Row(
                                            children: [
                                              Container(
                                                height: 2,
                                                color: getColor(selectedCard: selectedCard).withOpacity(0.4),
                                                width: (16 + 14 + 16),
                                              ),
                                              Expanded(child: divider()),
                                            ],
                                          ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: getColor(selectedCard: selectedCard).withOpacity(0.5),
                                            borderRadius: index != 0
                                                ? null
                                                : BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                          ),
                                          padding: EdgeInsets.only(left: 16, bottom: 8, right: 16, top: index == 0 ? 16 : 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //
                                              if (item.isAddOn == true) SvgPicture.asset("assets/svg/add_on.svg"),
                                              //
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(top: 4),
                                                    child: Image.asset(
                                                      Images.greenTickPng,
                                                      width: 16,
                                                      height: 16,
                                                      color: getColorDark(selectedCard: selectedCard),
                                                    ),
                                                  ),
                                                  WidthSpace(width: 8),
                                                  if (item.key != null)
                                                    Expanded(
                                                      child: beneFitText(
                                                        texts: headerTexts,
                                                        isHeader: true,
                                                        tooltip: item.tooltip,
                                                        selectedCard: selectedCard,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: (disclaimerTexts ?? "").isNotEmpty
                                              ? EdgeInsets.only(left: 16, top: 8, right: 16)
                                              : EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                          child: beneFitText(texts: contentTexts, selectedCard: selectedCard),
                                        ),
                                        if ((disclaimerTexts ?? "").isNotEmpty)
                                          Container(
                                            margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                                            padding: EdgeInsets.only(left: 8, top: 1),
                                            decoration: BoxDecoration(
                                              color: AppColors().light_grey8,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                              border: Border.all(
                                                color: AppColors().light_grey8, // Set border color
                                                width: 1.5,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withValues(alpha: 0.2),
                                                  blurRadius: 8,
                                                  offset: Offset(3, 0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              child: Text(disclaimerTexts!, style: textStyle.cta2.copyWith(fontSize: 12)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                            );
                          },
                          itemCount: getList(selectedCard: selectedCard).length,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (BuildContext context, int index) {
                            return selectedCard == exclusion ? Container() : divider();
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.all(24),
                          child: NoDataFound(text: "No Data Available"),
                        ),
                ),
              ),

              //
              if (moratoriumPeriod.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(bottom: 16, left: 0, right: 0),
                  decoration: BoxDecoration(
                    color: AppColors().color_skin1,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors().color_skin1, width: 1.5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: AppColors().light_yellow3),
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.all(12),
                    child: Text(removeAllBrackets(moratoriumPeriod), style: textStyle.subHeading2.copyWith(fontSize: 14)),
                  ),
                ),
            ],
          ),

          //
          Positioned(right: 0, child: getBanner(selectedCard: selectedCard)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(4, 4), blurRadius: 8, color: Colors.grey.withOpacity(0.5))],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      //
                      if (hospitalList.isNotEmpty)
                        summaryCard(
                          image: Images.img_hosp_benefit_summary,
                          color: AppColors().light_peacock,
                          borderColor: AppColors().peacock,
                          indicatorWidth: version == 1 ? 160 : 200,
                          text: version == 2 ? 'Coverages & Limits' : 'Hosp. Benefits',
                          isSelected: selectedCard == hospital_limit_coverage ? true : false,
                          click: () {
                            selectCard(hospital_limit_coverage, scrollpageview: true);

                            // if (kDebugMode) {
                            //   fetchData();
                            // }
                          },
                          key: hospitalCardKey,
                          indicatorColor: getColorDark(selectedCard: selectedCard),
                        ),

                      //
                      if (otherList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: summaryCard(
                            indicatorWidth: version == 1 ? 160 : 220,
                            image: Images.img_other_benefit_summary,
                            color: AppColors().bottelGreen_light,
                            borderColor: AppColors().bottelGreen,
                            text: version == 2 ? 'Other Benefits & Limits' : 'Other Benefits',
                            indicatorColor: getColorDark(selectedCard: selectedCard),
                            isSelected: selectedCard == other_benefits ? true : false,
                            click: () {
                              selectCard(other_benefits, scrollpageview: true);
                            },
                            key: otherCardKey,
                          ),
                        ),

                      //
                      if (waitignPeriodList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: summaryCard(
                            indicatorWidth: version == 1 ? 160 : 160,
                            image: Images.img_waiting_benefit_summary,
                            color: AppColors().orange_light,
                            borderColor: AppColors().orange,
                            text: 'Waiting Periods',
                            indicatorColor: getColorDark(selectedCard: selectedCard),
                            isSelected: selectedCard == waiting_periods ? true : false,
                            click: () {
                              selectCard(waiting_periods, scrollpageview: true);
                            },
                            key: waitingCardKey,
                          ),
                        ),

                      //
                      if (exclusionList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: summaryCard(
                            indicatorWidth: version == 1 ? 140 : 140,
                            image: Images.img_exclusion_benefit_summary,
                            color: AppColors().cherryRed_light,
                            borderColor: AppColors().cherryRed,
                            text: 'Exclusions',
                            indicatorColor: getColorDark(selectedCard: selectedCard),
                            isSelected: selectedCard == exclusion ? true : false,
                            click: () {
                              selectCard(exclusion, scrollpageview: true);
                            },
                            key: exclusionCardKey,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            //
            HeightSpace(height: 16),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedCard = benefitSummaryStatusList[index];
                  });

                  scrollController.position.ensureVisible(
                    getKey(selectedCard: selectedCard).currentContext!.findRenderObject()!,
                    alignment: 0.3,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(seconds: 1),
                  );
                },
                children: [
                  //
                  //
                  if (hospitalList.isNotEmpty) content(selectedCard: hospital_limit_coverage),
                  //
                  if (otherList.isNotEmpty) content(selectedCard: other_benefits),
                  //
                  if (waitignPeriodList.isNotEmpty) content(selectedCard: waiting_periods),
                  //
                  if (exclusionList.isNotEmpty) content(selectedCard: exclusion),
                ],
              ),
            ),
            //

            //

            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors().pure_white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(30, 31, 32, 0.08),
                    blurRadius: 6.0, // soften the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      -6.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: primaryButton(
                fontSize: 15,
                text: "Next",
                backgroundColor: widget.buttonColor,
                debounceEnabled: widget.isButtonAnimationAllowed,
                onTap: () {
                  if (selectedCard != benefitSummaryStatusList[benefitSummaryStatusList.length - 1]) {
                    getStatus();
                  } else {
                    widget.moveToResultScreen();
                  }
                },
              ),
            ),
          ],
        ),

        //
        // Blurry overlay
        if (widget.isPaid == false) widget.amountPopup,
      ],
    );
  }

  void getStatus() {
    var currentIndex = benefitSummaryStatusList.indexOf(selectedCard);

    //
    printF(">>><<<000 ${selectedCard}");

    selectedCard = benefitSummaryStatusList[currentIndex + 1];

    //
    printF(">>><<<111 ${selectedCard}");

    bool isListEmpty = getList(selectedCard: selectedCard).isEmpty;
    //
    if (isListEmpty == true) {
      printF(">>>111 ${selectedCard} : ${currentIndex + 1} : ${isListEmpty}");
      getStatus();
    } else {
      printF(">>>111orrrrr ${selectedCard} : ${currentIndex + 1} : ${isListEmpty}");
      selectCard(selectedCard, scrollpageview: true);
    }
  }

  Widget clickableIcon() {
    return Container(
      height: 16,
      width: 16,
      margin: EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors().darkGrey),
      child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors().pure_white, size: 10),
    );
  }

  Widget button({required String selectedCard, required String text, required Function() click}) {
    var textstyle = PolifyxTextStyles();

    //
    return GestureDetector(
      onTap: click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 5, color: getColor(selectedCard: selectedCard).withOpacity(0.3))],
          border: Border.all(
            color: getColor(selectedCard: selectedCard), // Set border color
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: getColor(selectedCard: selectedCard).withOpacity(0.2),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text),
              WidgetSpan(alignment: PlaceholderAlignment.middle, child: clickableIcon()),
            ],
          ),
          style: textstyle.bodyText1.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget beneFitText({required String selectedCard, required List<String> texts, bool isHeader = false, String? tooltip}) {
    var textstyle = PolifyxTextStyles();

    String text = "";

    texts.forEach((e) {
      text += e;
    });

    return Padding(
      padding: EdgeInsets.only(left: text.contains(tag7) ? 8 : 0),
      child: Text.rich(
        TextSpan(
          children: [
            for (int i = 0; i < texts.length; i++) ...[
              //
              if (texts[i].isNotEmpty)
                if (texts[i].contains("${removeBrackes(tag6End)}"))
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: button(
                      text:
                          "${removeEndBrackets(texts[i]).replaceAll("<br>", '\n').replaceAll(cataractCoverage, "").replaceAll(zoneAndCopayment, "").replaceAll(zoneText, "").replaceAll(treatmentText, "").replaceAll(healthCheckUp, "").replaceAll(adultVaccination, "").replaceAll(childVaccination, "").replaceAll(paCoverage, "").replaceAll(waitingPeriodSubLimits, "").replaceAll(mordernTreatmentSubLimits, "").replaceAll(modernTreatmentList, "")}",
                      click: () {
                        if (removeBrackes(texts[i]).contains(cataractCoverage)) {
                          htmlViewBottomSheet(context: context, title: "Cataract Coverage", data: cataract_coverage_list);
                        } else if (removeBrackes(texts[i]).contains(zoneAndCopayment)) {
                          printF("<><><>< ${json.encode(zoneAndCopaymentList)}");
                          final zoneAndCopaymentModel = ZoneAndCopaymentModel.fromJson(zoneAndCopaymentList);
                          zoneAndCopaymentBottomSheet(context: context, title: "Zone And Co-Payment", data: zoneAndCopaymentModel);
                        } else
                        // new key
                        // waiting period sub-limit
                        if (removeBrackes(texts[i]).contains(waitingPeriodSubLimits)) {
                          subLimitBottomSheet(
                            context: context,
                            title: "Sub-Limits Treatment",
                            selectedValue: "",
                            data: listOfTreatment,
                            showSearchBar: false,
                            onSelect: (data) {},
                          );
                        } else if (removeBrackes(texts[i]).contains(mordernTreatmentSubLimits)) {
                          // new key
                          // modern treatment sub-limits
                          subLimitTreatmentBottomSheet(
                            context: context,
                            flex: 2,
                            title: "Sub-Limits (Modern Treatment Coverage)",
                            selectedValue: "",
                            data: modernCoverageSubLimit,
                            showSearchBar: false,
                            onSelect: (data) {},
                          );
                        } else if (removeBrackes(texts[i]).contains(treatmentText)) {
                          subLimitBottomSheet(
                            context: context,
                            title: "Sub-Limits Treatment",
                            selectedValue: "",
                            data: listOfTreatment,
                            showSearchBar: false,
                            onSelect: (data) {},
                          );
                        } else if (removeBrackes(texts[i]).contains("sub-limits")) {
                          subLimitTreatmentBottomSheet(
                            context: context,
                            flex: 2,
                            title: "Sub-Limits (Modern Treatment Coverage)",
                            selectedValue: "",
                            data: modernCoverageSubLimit,
                            showSearchBar: false,
                            onSelect: (data) {},
                          );
                        } else if (removeBrackes(texts[i]).contains(zoneText)) {
                          subLimitZoneBottomSheet(
                            context: context,
                            title: "Sub Limits for Cataract Treatment",
                            selectedValue: "",
                            data: listOfZones,
                            onSelect: (data) {},
                          );
                        } else if (removeBrackes(texts[i]).contains(modernTreatmentList)) {
                          if ((modernCoverage ?? []).isNotEmpty) {
                            infoDataBottomSheet(
                              context: context,
                              title: "Modern Treatment Coverage",
                              data: modernCoverage,
                              showSearchBar: false,
                              onSelect: (data) {},
                            );
                          } else {
                            showToast("No data found");
                          }
                        } else if (removeBrackes(texts[i]).contains(healthCheckUp)) {
                          htmlViewBottomSheet(context: context, title: "", data: healthCheckupTableDetailsOtherObj);
                        } else if (removeBrackes(texts[i]).contains(adultVaccination)) {
                          htmlViewBottomSheet(context: context, title: "", data: adultVaccinationTableDetailsOtherObj);
                        } else if (removeBrackes(texts[i]).contains(childVaccination)) {
                          htmlViewBottomSheet(context: context, title: "", data: childVaccinationTableDetailsOtherObj);
                        } else if (removeBrackes(texts[i]).contains("list of diseases") ||
                            removeBrackes(texts[i]).contains("list of ailments")) {
                          //
                          if (listOfDisease != null) {
                            if (listOfDisease is List) {
                              if ((listOfDisease ?? []).length > 0) {
                                var elementZero = listOfDisease![0];
                                if (elementZero is String) {
                                  infoDataBottomSheet(
                                    context: context,
                                    title: "List of Named Ailments",
                                    selectedValue: "",
                                    data: listOfDisease,
                                    showSearchBar: false,
                                    onSelect: (data) {},
                                  );
                                }

                                if (elementZero is Map) {
                                  namedAilmentListBottomSheet(
                                    context: context,
                                    title: "List of Named Ailments",
                                    selectedValue: "",
                                    data: listOfDisease,
                                    onSelect: (data) {},
                                  );
                                }
                              } else {
                                showToast("No data found");
                              }
                            } else {
                              showToast("No data found");
                            }
                          } else {
                            showToast("No data found");
                          }
                        } else if (removeBrackes(texts[i]).contains(paCoverage)) {
                          if (personalAccidentCoverList != null) {
                            if (personalAccidentCoverList is List) {
                              if ((personalAccidentCoverList ?? []).length > 0) {
                                var elementZero = personalAccidentCoverList![0];
                                if (elementZero is String) {
                                  infoDataBottomSheet(
                                    context: context,
                                    title: "",
                                    selectedValue: "",
                                    data: personalAccidentCoverList,
                                    showSearchBar: false,
                                    onSelect: (data) {},
                                  );
                                }

                                if (elementZero is Map) {
                                  paCoverageBottomSheet(
                                    context: context,
                                    title: "Personal accident cover",
                                    selectedValue: "",
                                    data: personalAccidentCoverList,
                                    onSelect: (data) {},
                                  );
                                }
                              } else {
                                showToast("No data found");
                              }
                            } else if (personalAccidentCoverList is String) {
                              htmlViewBottomSheet(context: context, title: "Personal accident cover", data: personalAccidentCoverList);
                            } else {
                              showToast("No data found");
                            }
                          } else {
                            showToast("No data found");
                          }
                        }
                      },
                      selectedCard: selectedCard,
                    ),
                  )
                else
                  TextSpan(
                    text: "${removeEndBrackets(texts[i]).trim().replaceAll("<br>", '\n')} ",
                    style: texts[i].contains("${settlement}")
                        ? isHeader == true
                            ? textstyle.heading3.copyWith(fontSize: 17, color: AppColors().brown, decoration: TextDecoration.underline)
                            : textstyle.bodyText1.copyWith(fontSize: 15, color: AppColors().brown, decoration: TextDecoration.underline)
                        : texts[i].contains("${removeBrackes(tag1End)}")
                            ? isHeader == true
                                ? textstyle.heading3.copyWith(fontSize: 17)
                                : textstyle.bodyText1Bold.copyWith(fontSize: 15)
                            : textstyle.bodyText1.copyWith(fontSize: isHeader ? 17 : 15),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (removeBrackes(texts[i]).contains("Modern Treatment Coverage")) {
                          if ((modernCoverage ?? []).isNotEmpty) {
                            infoDataBottomSheet(
                              context: context,
                              title: "Modern Treatment Coverage",
                              data: modernCoverage,
                              showSearchBar: false,
                              onSelect: (data) {},
                            );
                          } else if ((modernCoverageSubLimit ?? []).isNotEmpty) {
                            subLimitTreatmentBottomSheet(
                              context: context,
                              title: "Modern Treatment Coverage",
                              data: modernCoverageSubLimit,
                              showSearchBar: false,
                              onSelect: (data) {},
                            );
                          }
                        }
                      },
                  ),

              //
              if (texts[i].contains("${settlement}")) WidgetSpan(child: clickableIcon()),

              //
              if (i == (texts.length - 1))
                if ((tooltip ?? "").isNotEmpty && isHeader == true)
                  WidgetSpan(
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        // color: getColorDark(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                      padding: EdgeInsets.all(8),
                      showDuration: Duration(seconds: 5),
                      message: tooltip,
                      child: Container(
                        margin: EdgeInsets.only(left: 0, top: 4),
                        child: Image.asset(Images.img_info_blue, width: 16, height: 16),
                      ),
                    ),
                  ),

              //
            ],
          ],
        ),
      ),
    );
  }
}
