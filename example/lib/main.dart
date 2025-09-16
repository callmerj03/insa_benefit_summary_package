import 'package:flutter/material.dart';
import 'package:insa_benefit_summary_package/AppColors.dart';
import 'package:insa_benefit_summary_package/BenefitSummary/BenefitSummary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = {
      "success": true,
      "message": "Benefits Summary Data Fetched Successfully.",
      "data": {
        "coverageAndLimits": {
          "IN_PATIENT_CARE": {
            "key": "<b>In-patient Care</b>",
            "value": "<p>Upto </p><b>₹10,00,000</b>",
            "tooltip": "Coverage for hospitalisation greater than 24 hours."
          },
          "ROOM_RENT": {
            "key": "<b>Room Rent</b>",
            "value": "Up to <b>₹10,000</b> or actual, whichever is lower",
            "tooltip": "Limit on the category of room or amount of room rent."
          },
          "ICU_CHARGES": {
            "key": "<b>ICU Charges</b>",
            "value": "Up to <b>₹20,000</b> per day subject to max, of <b>₹15,000</b> per day",
            "tooltip": "Limit on the ICU expenses incurred during hospitalisation."
          },
          "AMBULANCE_CHARGES": {
            "key": "<b>Ambulance Charges</b>",
            "value": "<p>Up to <b>₹2,500</b> in a policy period",
            "tooltip": "Coverage for ambulance charges under the policy."
          },
          "PRE_AND_POST_HOSPITALISATION_EXPENSES": {
            "key": "<b>Pre and Post Hospitalisation Expenses</b>",
            "value": "<p>Up to <b>₹10,00,000</b> for 30 days prior to hospitalization and for 60 days after discharge respectively",
            "tooltip": "Expenses before and post a hospitalisation that is related to the hospitalisation"
          },
          "AYUSH_TREATMENT_COVERAGE": {
            "key": "<b>Ayush Treatment Coverage</b>",
            "value": "<p>Covered up to the </p><b>₹10,00,000</b>",
            "tooltip": "Treatment under Ayurveda, Unani, Siddhi, Homeopathy branches of medicine"
          },
          "DAY_CARE_TREATMENTS": {
            "key": "<b>Single-Day Surgeries (Day Care Treatments )</b>",
            "value": "<p>Covered up to the </p><b>₹10,00,000</b>",
            "tooltip": "Expenses for procedures that can be performed in the hospital in under 24 hours."
          },
          "HOSPITALISATION_AT_HOME": {
            "key": "<b>Hospitalisation at home (Domicilliary Hospitalization)</b>",
            "value": "<p>Up to <b>₹1,00,000</b></p>",
            "tooltip": "Expenses for treatment at home when patient cannot be admitted to the hospital."
          },
          "HEALTH_CHECK_UP": {
            "key": "<b>Health Check Up</b>",
            "value": "Every 2 yrs, up to <b>₹5,000</b>",
            "tooltip": "Annual preventive health check up to determine general health and wellness of the insured"
          },
          "VACCINATION": null,
          "ADULT_VACCINATION": {"key": "<b>Adult Vaccination</b>", "value": "<p>Up to <b>₹5,000</b> Anti Rabies Vaccination</p>"},
          "CHILD_VACCINATION": {
            "key": "<b>Child Vaccination</b>",
            "value": "Up to <b>₹1,000</b> Vaccination for Children, for male child up to 12 years and female child up to 14 years"
          },
          "CHILD_VACCINATION_DETAILS": null,
          "MODERN_TREATMENT_COVERAGE": {
            "key": "<b>Advanced Treatments (Modern Treatments)</b>",
            "value":
                "<p>Up to <b>₹2,50,000</b> for each treatment</p><button>Click here to see the sub-limits :modern-treatment-sublimits</button>",
            "tooltip": "Treatment using advanced medical technology or procedures"
          },
          "CASH_BENEFIT": {
            "key": "<b>Cash Benefit</b>",
            "value": "<b>₹500</b> per day, max. of 5 days",
            "tooltip": "Fixed daily/incident-based cash payment to insured while hospitalized"
          },
          "CATARACT_COVERAGE": {
            "key": "<b>Cataract Coverage</b>",
            "value": "Upto <b>₹60,000</b>",
            "tooltip": "Coverage for cataract surgery including pre/post hospitalization"
          },
          "MENTAL_ILLNESS_COVERAGES": {
            "key": "<b>Mental Illness coverages</b>",
            "value":
                "<p>You’re covered up to your full policy amount, but any kind of therapy—like talking to a counselor, family sessions, or emotional support—that doesn’t involve staying in a hospital won’t be paid for</p>",
            "tooltip": "In patient psychiatric treatment coverage for mental health conditions"
          },
          "INFERTILITY_TREATMENT": {
            "key": "<b>Infertility Treatment</b>",
            "value": "Upto <b>₹50,000</b>",
            "tooltip": "Coverage for fertility treatments, including IVF procedures"
          },
          "MATERNITY_BENEFITS": {
            "key": "<b>Maternity Benefits</b>",
            "value": "Upto <b>₹30,000</b> for normal delivery and <b>₹50,000</b> for caesarean section",
            "tooltip": "Cover for cost related to maternity and child birth"
          },
          "MORBID_OBESITY_SURGERIES": {
            "key": "<b>Weight Reduction Surgeries (Morbid Obesity surgeries)</b>",
            "value": "<p>Covered up to the <b>₹10,00,000</b> with conditions applied mentioned in definition</p>",
            "tooltip": "Coverage for treatment/surgery of morbid obesity"
          },
          "CORRECTION_OF_REFRACTIVE_ERROR": {
            "key": "<b>Eye Power Correction (Correction of Refractive Error)</b>",
            "value": "<p>Covered up to the <b>₹10,00,000</b> with conditions applied mentioned in definition</p>",
            "tooltip": "Cover for a vision problem where the eye does not bend (refract) light properly, causing blurred vision."
          },
          "PERSONAL_ACCIDENT_COVER": null,
          "HIV_AIDS": null,
          "MODERN_TREATMENT_SUB_LIMITS": [
            {"treatment": "UAE & HIFU", "coverage1": "Limit is for procedure cost only"},
            {"treatment": "Balloon Sinuplasty", "coverage1": "Limit is for balloon cost only"},
            {"treatment": "Deep Brain stimulation", "coverage1": "Limit is for implants including batteries only"},
            {
              "treatment": "Oral chemotherapy",
              "coverage1": "Only cost of medicines payable; other charges like investigations and consultation not payable"
            },
            {"treatment": "Immunotherapy", "coverage1": "Limit is for complete treatment, including pre & post-hospitalization"},
            {"treatment": "Intravitreal injections", "coverage1": "Limit is for cost of injections only"},
            {"treatment": "Robotic surgeries", "coverage1": "Limit is for robotic component only"},
            {"treatment": "Stereotactic radio surgeries", "coverage1": "Limit is for radiation procedure"},
            {"treatment": "Bronchial Thermoplasty", "coverage1": "Limit is for complete treatment, including pre & post-hospitalization"},
            {"treatment": "Vaporization of the Prostate", "coverage1": "Limit is for LASER component only"},
            {"treatment": "IONM (Intra Operative Neuro Monitoring)", "coverage1": "Limit is for IONM procedure only"},
            {"treatment": "Stem cell therapy", "coverage1": "Limit is for complete treatment, including pre & post-hospitalization"}
          ]
        },
        "otherBenefitsAndLimits": {
          "HOSPITALIZATION_EXPENSES": null,
          "MEDICAL_TEAM_CHARGES": null,
          "OTHER_THAN_ACCOMODATION_AND_SPECIALISTS": null,
          "ONCOLOGY_AND_DIALYSIS_TREATMENTS": null,
          "HIV_AIDS": {"key": "<b>HIV/ AIDS Cover</b>", "value": "<p>Covered</p>", "tooltip": ""},
          "RISKY_FUN_SPORTS_LIKE_TREKKING_OR_RAFTING": {
            "key": "<b>Risky fun sports like trekking or rafting (Non-Professionals)</b>",
            "value": "<p>Up to </p><b>₹2,50,000</b>"
          },
          "AIR_AMBULANCE_CHARGES": {"key": "<b>Air Ambulance </b>", "value": "Not covered", "tooltip": ""},
          "MEDICAL_EMERGENCY_REUNION": {
            "key": "<b>Medical Emergency Reunion</b>",
            "value": "Not covered",
            "tooltip":
                "Covers travel costs for a close family member to be with you if you’re in ICU for over 5 days due to a life-threatening condition away from home"
          },
          "CO-PAYMENT": null,
          "CUMULATIVE_BONUS": null,
          "ORGAN_DONAR_COVER": {
            "key": "<b>Organ Donor’s Medical Expenses</b>",
            "value": "<p>Covered</p>",
            "tooltip":
                "Covers the donor’s hospital costs for giving an organ to you. This doesn’t include donor’s pre/post care, organ transport, or experimental treatments"
          },
          "BENIGN_PROSTATIC_HYPERPLASIA": null,
          "FUNERAL_EXPENSES": null,
          "AYA_DOCTOR_HOME_VISIT_NURSING_POST_HOSPITALISATION_PER_INDIVIDUAL": null,
          "REINSTATEMENT_SI_ROAD_TRAFFIC_ACCIDENT": null,
          "ROOM_CHARGES_ICU_COSTS_HOSPITAL_CARE": null,
          "DEATH_OF_EARNING_HEAD": null,
          "PERSONAL_ACCIDENT_COVER_LIST": null,
          "DOCTOR_HOME_VISIT_AND_NURSING_CARE": {
            "key": "<b>Doctor’s Home Visit and Nursing Care during Post Hospitalisation</b>",
            "value": "Not covered",
            "tooltip": ""
          },
          "SUM_INSURED_REFILL": {
            "key": "<b>Reinstatement of SI due to Road Traffic accident (Sum Insured Refill)</b>",
            "value": "<p>Covered</p>",
            "tooltip":
                "If your sum insured is used up after a road accident, it will be refilled once in the year so you’re still covered for other treatments. But each claim can only be paid up to your original cover amount."
          },
          "ZONE_AND_COPAYMENT": {
            "key": "<b>Zone and Co-Payment (Higher region and cost sharing</b>",
            "value": "Covered <button>list attached :zoneAndCopayment</button>",
            "tooltip":
                "If your sum insured is used up after a road accident, it will be refilled once in the year so you’re still covered for other treatments. But each claim can only be paid up to your original cover amount."
          },
          "ZONE_AND_COPAYMENT_LIST": {
            "zones": [
              {"zone": "Zone I", "states": "Greater Mumbai Metropolitan area, entire state of Gujarat"},
              {
                "zone": "Zone II",
                "states": "National Capital Territory (NCT) Delhi and National Capital Region (# NCR), Chandigarh, Pune",
                "note":
                    "# NCR includes Gurgaon-Manesar, Alwar-Bhiwadi, Faridabad-Ballabgarh, Ghaziabad-Loni, Noida, Greater Noida, Bahadurgarh, Sonepat, Kundli, Charkhi Dadri, Bhiwani, Narnaul"
              },
              {"zone": "Zone III", "states": "Chennai, Hyderabad, Bangalore, Kolkata"},
              {"zone": "Zone IV", "states": "Rest of India"}
            ],
            "coPaymentRules": [
              {
                "insuredPaying": "Insured paying premium as per Zone I",
                "copaymentRules": "can avail treatment in Zone I, Zone II, Zone III and Zone IV without co-payment"
              },
              {
                "insuredPaying": "Insured paying premium as per Zone II",
                "copaymentRules":
                    "<ul><li>Can avail treatment in Zone II, Zone III and Zone IV without any co-payment</li><li>Availing treatment in Zone I will be subject to a co-payment of 5%</li></ul>"
              },
              {
                "insuredPaying": "Insured paying premium as per Zone III",
                "copaymentRules":
                    "<ul><li>Can avail treatment in Zone III and Zone IV without any co-payment</li><li>Availing treatment in Zone I will be subject to a co-payment of 12.5%</li><li>Availing treatment in Zone II will be subject to a co-payment of 7.5%</li></ul>"
              },
              {
                "insuredPaying": "Insured paying premium as per Zone IV",
                "copaymentRules":
                    "<ul><li>Can avail treatment in Zone IV without any co-payment</li><li>Availing treatment in Zone I will be subject to a co-payment of 22.5%</li><li>Availing treatment in Zone II will be subject to a co-payment of 17.5%</li><li>Availing treatment in Zone III will be subject to a co-payment of 10%</li></ul>"
              }
            ]
          }
        },
        "waitingPeriodAndSubLimitsV2": {
          "STANDARD_WAITING_PERIOD": {
            "key": "<b>Standard Waiting Period</b>",
            "value":
                "<p>30 days from the date of inception- >>Expenses related to the treatment of any illness within thirty (30) days from the first policy commencement date shall be excluded <b>except claims arising due to an accident</b>, provided the same are covered. </p>",
            "tooltip": "Only accidental claims are covered in the first 30 days of policy."
          },
          "PRE_EXISTING_DISEASE_WAITING_PERIOD": {
            "key": "<b>Pre-existing diseases Waiting Period</b>",
            "value":
                "<p>Only PEDs declared in the Proposal Form and accepted for coverage by the Company shall be covered after 3 years Waiting Period</p>",
            "tooltip":
                "They are diseases that are diagnosed prior to the inception of the policy. These diseases are covered after a specific waiting period."
          },
          "SPECIFIC_WAITING_PERIOD": {
            "key": "<b>Named (specific) ailments waiting period</b>",
            "value": "<button>click here for list of ailments</button>",
            "tooltip": "These are a specific set of diseases that are covered after a specified waiting period."
          },
          "NAMED_AILMENT_LIST": [
            {
              "duration": "90 Days Waiting Period (Life style conditions namely)",
              "list": ["Hypertension and related complications", "Diabetes and related complications", "Cardiac conditions"]
            },
            {
              "duration": "One year Waiting Period",
              "list": ["Benign ENT disorders ", "Tonsillectomy", "Adenoidectomy", "Mastoidectomy", "Tympanoplasty"]
            },
            {
              "duration": "Two years Waiting Period",
              "list": [
                "Cataract and age related eye ailments",
                "Refractive error of the eye more than 7.5 dioptres",
                "Benign prostatic hypertrophy",
                "Hernia",
                "Hydrocele",
                "Fissure/Fistula in anus",
                "Piles (Haemorrhoids)",
                "Sinusitis and related disorders",
                "Polycystic ovarian disease",
                "Non-infective arthritis",
                "Pilonidal sinus",
                "Gout and Rheumatism",
                "Calculus diseases",
                "Surgery of gall bladder and bile duct excluding malignancy",
                "Surgery of genito-urinary system excluding malignancy",
                "Surgery for prolapsed intervertebral disc unless arising from accident",
                "Surgery of varicose vein",
                "Hysterectomy",
                "Maternity",
                "Surrogacy Cover",
                "Congenital Internal Anomaly",
                "Depression",
                "Schizophrenia"
              ]
            },
            {
              "duration": "Three years Waiting Period",
              "list": [
                "Joint replacement unless necessitated due to an accident",
                "Osteoarthritis and osteoporosis",
                "Obesity and its complications",
                "Stem Cell Therapy: Hematopoietic stem cells for bone marrow transplant for haematological conditions to be covered"
              ]
            }
          ]
        },
        "exclusions": [
          "Investigation & Evaluation",
          "Rest Cure, Rehabilitation and Respite Care",
          "Obesity/ Weight Control",
          "Change-of-Gender Treatments",
          "Cosmetic or Plastic Surgery",
          "Hazardous or Adventure Sports for professionals",
          "Breach of Law",
          "Excluded Providers",
          "Drug/Alcohol Abuse",
          "Non-Medical Admissions",
          "Vitamins, Tonics",
          "Refractive Error (less than 7.5 dioptres)",
          "Unproven Treatments",
          "Birth control, Sterility and Infertility",
          "Maternity",
          "Hormone Replacement Therapy",
          "General Debility, Congenital External Anomaly",
          "Self Inflicted Injury",
          "Stem Cell Surgery",
          "Circumcision",
          "Vaccination or Inoculation",
          "Massages, Steam Bath, Alternative Treatment (Other than AYUSH treatment)",
          "Dental treatment unless necessitated due to an Injury",
          "Domiciliary Hospitalization & Out Patient Department (OPD) treatment",
          "Stay in Hospital which is not Medically Necessary",
          "Spectacles, Contact Lens, Hearing Aid, Cochlear Implants",
          "Non Prescription Drug",
          "Treatment not Related to Disease for which Claim is Made",
          "Equipments",
          "Items of personal comfort",
          "Service charge/ registration fee",
          "Home visit charges",
          "War",
          "Radioactivity",
          "Treatment taken outside the geographical limits of India"
        ],
        "addOns": [],
        "logs": null,
        "version": 2
      }
    };

    //
    //
    return MaterialApp(
      title: 'Insa Benefit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: BenefitSummary(
            amountPopup: Container(),
            isPaid: true,
            jsonObject: map,
            moveToResultScreen: () {},
            buttonColor: AppColors().primaryThemeColor,
            policyId: "",
          ),
        ),
      ),
    );
  }
}
