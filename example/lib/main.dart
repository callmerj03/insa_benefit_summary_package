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
            "value": "<p>Up to </p><b>₹5,00,000</b>",
            "tooltip": "Coverage for hospitalisation greater than 24 hours.",
          },
          "ROOM_RENT": {
            "key": "<b>Room Rent</b>",
            "value": "<p>Up to <b>₹5,000</b> per day</p>",
            "tooltip": "Limit on the category of room or amount of room rent.",
          },
          "ICU_CHARGES": {
            "key": "<b>ICU Charges</b>",
            "value": "<p>Covered</p>",
            "tooltip": "Limit on the ICU expenses incurred during hospitalisation.",
          },
          "AMBULANCE_CHARGES": {
            "key": "<b>Ambulance Charges</b>",
            "value": "<p><b>₹750/-</b> per hospitalization and overall limit of <b>₹1500/-</b> per policy period</p>",
            "tooltip": "Coverage for ambulance charges under the policy.",
          },
          "PRE_AND_POST_HOSPITALISATION_EXPENSES": {
            "key": "<b>Pre and Post Hospitalisation Expenses</b>",
            "value": "<p>Up to <b>₹5,00,000</b> for 30 days prior to hospitalization and for 60 days after discharge respectively</p>",
            "tooltip": "Expenses before and post a hospitalisation that is related to the hospitalisation",
          },
          "AYUSH_TREATMENT_COVERAGE": {
            "key": "<b>Ayush Treatment Coverage</b>",
            "value": "<p>Up to the </p><b>₹5,00,000</b>",
            "tooltip": "Treatment under Ayurveda, Unani, Siddhi, Homeopathy branches of medicine",
          },
          "DAY_CARE_TREATMENTS": {
            "key": "<b>Single-Day Surgeries (Day Care Treatments )</b>",
            "value": "<p>Covered</p>",
            "tooltip": "Expenses for procedures that can be performed in the hospital in under 24 hours.",
          },
          "HOSPITALISATION_AT_HOME": {
            "key": "<b>Hospitalisation at home (Domicilliary Hospitalization)</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Expenses for treatment at home when patient cannot be admitted to the hospital.",
          },
          "HEALTH_CHECK_UP": {
            "key": "<b>Health Check Up</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Annual preventive health check up to determine general health and wellness of the insured",
          },
          "VACCINATION": null,
          "ADULT_VACCINATION": {"key": "<b>Adult Vaccination</b>", "value": "<p>Not Covered</p>", "tooltip": null},
          "CHILD_VACCINATION": {"key": "<b>Child Vaccination</b>", "value": "<p>Not Covered</p>", "tooltip": null},
          "CHILD_VACCINATION_DETAILS": null,
          "MODERN_TREATMENT_COVERAGE": {
            "key": "<b>Advanced Treatments (Modern Treatments)</b>",
            "value":
                "<p>Table of limits attached as per entitled sum insured </p><button>Click here to see the sub-limits :modern-treatment-sublimits</button>",
            "tooltip": "Treatment using advanced medical technology or procedures",
          },
          "CASH_BENEFIT": {
            "key": "<b>Cash Benefit</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Fixed daily/incident-based cash payment to insured while hospitalized",
          },
          "CATARACT_COVERAGE": {
            "key": "<b>Cataract Coverage</b>",
            "value":
                "<p>Table of limits attached as per entitled sum insured </p><button>Click here to see the cataract-coverage :cataractCoverage</button>",
            "tooltip": "Coverage for cataract surgery including pre/post hospitalization",
          },
          "CATARACT_COVERAGE_LIST":
              "<div style=\"font-family: Nunito, sans-serif; border-radius: 15px; overflow: hidden; font-size: 14px;\">\n\n                <!-- Table -->\n                <table style=\"\n                    width: 100%;\n                    border: 1px solid #E6E6E6;\n                    border-radius: 15px;\n                    border-collapse: separate;\n                    border-spacing: 0;\n                    text-align: left;\n                    font-family: Nunito, sans-serif;\n                    font-size: 14px;\n                    margin-top: 20px;\n                \">\n                    <thead>\n                        <tr style=\"background: #DEE4DA; font-weight: 800; font-size: 16px;\">\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-left-radius: 15px; text-align:center;\">Sum Insured Rs.</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Limit per eye (in Rs.)</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-right-radius: 15px; text-align:center;\">Limit per policy period (in Rs.)</th>\n                        </tr>\n                    </thead>\n                    <tbody>\n                        <tr style=\"background: #F3FFEA; font-size: 13px;\">\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">1,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\" colspan=\"2\">Up to 12,000/- per eye, per policy period</td>\n                        </tr>\n                        <tr style=\"background: #F3FFEA; font-size: 13px;\">\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">2,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 25,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 35,000/-</td>\n                        </tr>\n                        <tr style=\"background: #F3FFEA; font-size: 13px;\">\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">3,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 30,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 45,000/-</td>\n                        </tr>\n                        <tr style=\"background: #F3FFEA; font-size: 13px;\">\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">4,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 40,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:center;\">Up to 60,000/-</td>\n                        </tr>\n                    </tbody>\n                </table>\n            </div>",
          "MENTAL_ILLNESS_COVERAGES": {
            "key": "<b>Mental Illness coverages (Mind Health Support)</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "In patient psychiatric treatment coverage for mental health conditions",
          },
          "INFERTILITY_TREATMENT": {
            "key": "<b>Infertility Treatment</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Coverage for fertility treatments, including IVF procedures",
          },
          "MATERNITY_BENEFITS": {
            "key": "<b>Maternity Benefits</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Cover for cost related to maternity and child birth",
          },
          "MORBID_OBESITY_SURGERIES": {
            "key": "<b>Weight Reduction Surgeries (Morbid Obesity surgeries)</b>",
            "value": "<p>Covered with conditions applied mentioned in definition in the downloadable KYP PDF</p>",
            "tooltip": "Coverage for treatment/surgery of morbid obesity",
          },
          "CORRECTION_OF_REFRACTIVE_ERROR": {
            "key": "<b>Eye Power Correction (Correction of Refractive Error)</b>",
            "value": "<p>Covered with conditions applied mentioned in definition in the downloadable KYP PDF</p>",
            "tooltip": "Cover for a vision problem where the eye does not bend (refract) light properly, causing blurred vision.",
          },
          "MODERN_TREATMENT_SUB_LIMITS": [
            {"treatment": "Uterine Artery Embolization and HIFU", "coverage1": "1,25,000"},
            {"treatment": "Balloon Sinuplasty", "coverage1": "50,000"},
            {"treatment": "Deep Brain Stimulation", "coverage1": "2,50,000"},
            {"treatment": "Oral Chemotherapy", "coverage1": "1,25,000"},
            {"treatment": "Immunotherapy- Monoclonal Antibody to be given as injection", "coverage1": "2,50,000"},
            {"treatment": "Intra Vitreal Injections", "coverage1": "50,000"},
            {"treatment": "Robotic Surgeries", "coverage1": "2,50,000"},
            {"treatment": "Stereotactic Radio Surgeries", "coverage1": "2,00,000"},
            {"treatment": "Bronchial Thermoplasty", "coverage1": "Up to 5,00,000"},
            {"treatment": "Vaporization of the Prostate", "coverage1": "Up to 5,00,000"},
            {"treatment": "IONM", "coverage1": "Up to 5,00,000"},
            {"treatment": "Stem Cell Therapy", "coverage1": "2,50,000"},
          ],
        },
        "hospitalisationBenefits": {
          "IN_PATIENT_CARE": {
            "key": "<b>In-patient Care</b>",
            "value": "<b>Covered up to ₹5,00,000</b>",
            "tooltip": "Coverage for hospitalisation greater than 24 hours.",
          },
          "ROOM_RENT": {
            "key": "<b>Room Rent</b>",
            "value": "<b>Up to ₹10,000 per day</b>",
            "tooltip": "Limit on the category of room or amount of room rent.",
          },
          "ICU_CHARGES": {
            "key": "<b>ICU Charges</b>",
            "value": "<b>Covered as per Actuals</b>",
            "tooltip": "Limit on the ICU expenses incurred during hospitalisation.",
          },
          "AMBULANCE_CHARGES": {
            "key": "<b>Ambulance Charges</b>",
            "value": "<b>Up to ₹750 per hospitalization not exceeding ₹1,500 per policy period</b>",
            "tooltip": "Coverage for ambulance charges under the policy.",
          },
          "PRE_HOSPITALISATION_EXPENSES": {
            "key": "<b>Pre Hospitalisation Expenses</b>",
            "value": "<b>30 days prior to the date of admission</b>",
            "tooltip": "Expenses before a hospitalisation , related to treatment of an illness that led to a subsequent hospitalisation.",
          },
          "POST_HOSPITALISATION_EXPENSES": {
            "key": "<b>Post Hospitalisation Expenses</b>",
            "value": "<b>60 days from the date of discharge</b>",
            "tooltip":
                "Expenses after a hospitalisation, related to follow up treatment of the illness that had led to the hospitalisation.",
          },
          "MORATORIUM_PERIOD": null,
        },
        "otherBenefits": {
          "DAY_CARE_TREATMENTS": {
            "key": "<b>Day Care Treatments</b>",
            "value": "<b>Covered up to ₹5,00,000</b>",
            "tooltip": "Expenses for procedures that can be performed in the hospital in under 24 hours.",
          },
          "DOMICILIARY_HOSPITALISATION": {
            "key": "<b>Domiciliary Hospitalisation</b>",
            "value": "<b>Covered up to ₹5,00,000</b>",
            "tooltip": "Expenses for treatment at home when patient cannot be admitted to the hospital.",
          },
          "MODERN_TREATMENT_COVERAGE": {
            "key": "<link><u><b>Modern Treatment Coverage</b></u></link>",
            "value": "<b>Covered as per these sub-limits</b><button>Click here to see the sub-limits :modern-treatment-sublimits</button>",
            "tooltip": "Treatment using advanced medical technology or procedures",
          },
          "AYUSH_TREATMENT_COVERAGE": {
            "key": "<b>Ayush Treatment Coverage</b>",
            "value": "<b>Covered up to ₹5,00,000</b>",
            "tooltip": "Treatment under Ayurveda, Unani, Siddhi, Homeopathy branches of medicine",
          },
          "DAILY_CASH_BENEFIT": null,
          "PERSONAL_ACCIDENT_COVER": null,
          "MATERNITY_BENEFITS": null,
          "MODERN_TREATMENT_COVERAGE_LIST": [
            "Uterine Artery Embolization and HIFU",
            "Balloon Sinuplasty",
            "Deep Brain Stimulation",
            "Oral Chemotherapy",
            "Immunotherapy - Monoclonal Antibody to be given as Injection",
            "Intra Vitreal Injections",
            "Robotic Surgeries",
            "Stereotactic Radio Surgeries",
            "Bronchial Thermoplasty",
            "Vaporization of the Prostate",
            "IONM",
            "Stem Cell Therapy",
          ],
          "HEALTH_CHECK_UP": null,
          "HEALTH_CHECK_UP_DETAILS": null,
          "CHILD_VACCINATION": null,
          "CHILD_VACCINATION_DETAILS": null,
          "MODERN_TREATMENT_SUB_LIMITS": [
            {"treatment": "Uterine Artery Embolization and HIFU", "coverage1": "1,25,000"},
            {"treatment": "Balloon Sinuplasty", "coverage1": "50,000"},
            {"treatment": "Deep Brain Stimulation", "coverage1": "2,50,000"},
            {"treatment": "Oral Chemotherapy", "coverage1": "1,25,000"},
            {"treatment": "Immunotherapy- Monoclonal Antibody to be given as injection", "coverage1": "2,50,000"},
            {"treatment": "Intra Vitreal Injections", "coverage1": "50,000"},
            {"treatment": "Robotic Surgeries", "coverage1": "2,50,000"},
            {"treatment": "Stereotactic Radio Surgeries", "coverage1": "2,00,000"},
            {"treatment": "Bronchial Thermoplasty", "coverage1": "Up to 5,00,000"},
            {"treatment": "Vaporization of the Prostate", "coverage1": "Up to 5,00,000"},
            {"treatment": "IONM", "coverage1": "Up to 5,00,000"},
            {"treatment": "Stem Cell Therapy", "coverage1": "2,50,000"},
          ],
        },
        "otherBenefitsAndLimits": {
          "CO-PAYMENT": {
            "key": "<b>Co-Payment</b>",
            "value":
                "<p>A 20% co-payment applies on every claim (new and renewal) if the insured entered the policy at age 61 or above.</p>",
            "tooltip": null,
          },
          "OUTPATIENT_BENEFIT": {
            "key": "<b>Outpatient Benefit</b>",
            "value": "<p>Refer the link for the OPD limits as per selected sum insured options on the basis of premium.</p>",
            "tooltip": null,
          },
        },
        "waitingPeriodAndSubLimits": {
          "STANDARD_WAITING_PERIOD": {
            "key": "<b>Standard Waiting Period</b>",
            "value": "<b>30 days excluding accidental claims</b>",
            "tooltip": "Only accidental claims are covered in the first 30 days of policy.",
          },
          "PRE_EXISTING_DISEASE_WAITING_PERIOD": {
            "key": "<b>Pre-existing diseases Waiting Period</b>",
            "value": "<b>36 months i.e. 3 years after the date of inception of the first policy with insurer</b>",
            "tooltip":
                "They are diseases that are diagnosed prior to the inception of the policy. These diseases are covered after a specific waiting period.",
            "disclaimer": "Declared PEDs are now eligible to be covered as per the Sum Insured and other policy conditions",
          },
          "SPECIFIC_WAITING_PERIOD": {
            "key": "<b>Specific Waiting Period</b>",
            "value": "<b>24 months for named ailments \n</b><button>click here for list of diseases</button>",
            "tooltip": "These are a specific set of diseases that are covered after a specified waiting period.",
          },
          "SUB_LIMITS": null,
          "CATARACT_TREATMENT": {
            "key": "<b>Cataract Treatment</b>",
            "value": "<b>Up to ₹40,000 per eye per person, not exceeding ₹60,000 per policy period</b>",
            "tooltip": null,
          },
          "KNEE_REPLACEMENT": null,
          "NAMED_AILMENT_LIST": [
            "Benign ENT disorders",
            "Tonsillectomy",
            "Adenoidectomy",
            "Mastoidectomy",
            "Tympanoplasty",
            "Hysterectomy",
            "All internal and external benign tumours, cysts, polyps of any kind, including benign breast lumps",
            "Benign prostate hypertrophy",
            "Cataract and age related eye ailments",
            "Gastric/Duodenal Ulcer",
            "Gout and Rheumatism",
            "Hernia of all types",
            "Hydrocele",
            "Non Infective Arthritis",
            "Piles, Fissures and Fistula in anus",
            "Pilonidal sinus, Sinusitis and related disorders",
            "Prolapse inter Vertebral Disc and Spinal Diseases unless arising from accident",
            "Calculi in urinary system,Gall Bladder and Bile duct, excluding malignancy",
            "Varicose Veins and Varicose Ulcers",
            "Internal Congenital Anomalies",
          ],
        },
        "waitingPeriodAndSubLimitsV2": {
          "STANDARD_WAITING_PERIOD": {
            "key": "<b>Standard Waiting Period</b>",
            "value":
                "<p>30 days from the date of inception- >>Expenses related to the treatment of any illness within thirty (30) days from the first policy commencement date shall be excluded except claims arising due to an accident, provided the same are covered.</p>",
            "tooltip": "Only accidental claims are covered in the first 30 days of policy.",
          },
          "PRE_EXISTING_DISEASE_WAITING_PERIOD": {
            "key": "<b>Pre-existing diseases Waiting Period</b>",
            "value":
                "<p>Only PEDs declared in the Proposal Form and accepted for coverage by the Company shall be covered after 36 months Waiting Period</p>",
            "tooltip":
                "They are diseases that are diagnosed prior to the inception of the policy. These diseases are covered after a specific waiting period.",
            "disclaimer": "Declared PEDs are now eligible to be covered as per the Sum Insured and other policy conditions",
          },
          "SPECIFIC_WAITING_PERIOD": {
            "key": "<b>Named (specific) ailments waiting period</b>",
            "value": "<button>click here for list of ailments</button>",
            "tooltip": "These are a specific set of diseases that are covered after a specified waiting period.",
          },
          "NAMED_AILMENT_LIST": [
            {
              "duration": "Two years Waiting Period",
              "list": [
                "Treatment of Cataract and diseases of the anterior and posterior chamber of the Eye, Diseases of ENT, Diseases related to Thyroid, Benign diseases of the breast",
                "Subcutaneous Benign Lumps, Sebaceous cyst, Dermoid cyst, Mucous cyst lip / cheek, Carpal Tunnel Syndrome, Trigger Finger, Lipoma, Neurofibroma, Fibroadenoma, Ganglion and similar pathology",
                "All treatments (Conservative, Operative treatment) and all types of intervention for Diseases related to Tendon, Ligament, Fascia, Bones and Joint Including Arthroscopy and Arthroplasty / Joint Replacement [other than caused by accident]",
                "All types of treatment for Degenerative disc and Vertebral diseases including Replacement of bones and joints and Degenerative diseases of the Musculoskeletal system, Prolapse of Intervertebral Disc (other than caused by accident)",
                "All treatments (conservative, interventional, laparoscopic and open) related to Hepato-pancreato-biliary diseases including Gall bladder and Pancreatic calculi. All types of management for Kidney and Genitourinary tract calculi",
                "All types of Hernia",
                "Desmoid Tumor, Umbilical Granuloma, Umbilical Sinus, Umbilical Fistula",
                "All treatments (conservative, interventional, laparoscopic and open) related to all Diseases of Cervix, Uterus, Fallopian tubes, Ovaries, Uterine Bleeding, Pelvic Inflammatory Diseases",
                "All Diseases of Prostate, Stricture Urethra, all Obstructive Uropathies",
                "Benign Tumours of Epididymis, Spermatocele, Varicocele, Hydrocele",
                "Fistula, Fissure in Ano, Hemorrhoids, Pilonidal Sinus and Fistula, Rectal Prolapse, Stress Incontinence",
                "Varicose veins and Varicose ulcers",
                "All types of transplant and related surgeries",
                "Congenital Internal disease / defect",
              ],
            },
            {
              "duration": "Three years Waiting Period",
              "list": ["Out Patient Dental/Ophthal Coverage", "Bariatric Surgery"],
            },
          ],
          "WAITING_PERIOD_FOR_HIV_AIDS_COVER": null,
        },
        "exclusions": [
          "Investigation & Evaluation Only - No cover for admissions purely for evaluation/testing.",
          "Rest & Rehabilitation - Includes enforced bed rest, custodial care, or palliative care.",
          "Obesity Surgery - Not covered unless strict clinical and BMI criteria are met.",
          "Gender Change - All gender reassignment treatments excluded.",
          "Cosmetic Surgery – Unless due to accident, burn, cancer, or certified as medically necessary.",
          "Adventure Sports – No cover for injuries during professional or high-risk sports.",
          "Breach of Law – Injuries due to illegal acts or criminal intent are excluded.",
          "Excluded Providers – No coverage for treatments from blacklisted hospitals/doctors.",
          "Substance Abuse – Excludes treatment for alcohol/drug addiction.",
          "Alternative Clinics – No cover for spas, health resorts, or nature cure centers.",
          "OTC Supplements – Excludes vitamins/minerals unless prescribed during hospitalization.",
          "Refractive Error – Less than 7.5 dioptres not covered.",
          "Unproven Treatments – Any therapy lacking scientific evidence is excluded.",
          "Maternity and its complications",
          "Infertility – IVF, ART, sterilization, surrogacy not covered.",
          "Circumcision-related – Unless medically necessary or due to an accident.",
          "Congenital External Defects – Except for newborns (as per policy).",
          "General Debility – Weakness, malnutrition not covered.",
          "Self-Injury – Includes suicide attempts.",
          "Venereal Disease and Sexually Transmitted Diseases (Other than HIV)",
          "War-related Injuries – War, invasion, or similar events.",
          "Nuclear Risks – Injury due to nuclear materials or radiation.",
          "Special Therapies – E.g., EECP, PRP, Hyperbaric Oxygen Therapy, Rotational Field Quantum Magnetic Resonance Therapy, VAX-D, Low level laser therapy, Photodynamic therapy and such other similar therapies.",
          "Unconventional, Untested, Experimental therapies",
          "Autologous derived Stromal vascular fraction, Chondrocyte Implantation, Procedures using Platelet Rich plasma and Intra articular injection therapy",
          "Biologicals – Excluded unless hospitalized and medically indicated.",
          "All Treatment for erectile dysfunctions -",
          "Vaccinations – Except post-bite or therapeutic.",
          "Dental treatment or surgery unless necessitated due to accidental injuries and requiring hospitalization.(Dental implants are not payable) –",
          "Medical and / or surgical treatment of Sleep apnea, treatment for endocrine disorders",
          "Admin Charges – Registration, telephone, record-keeping charges not covered.",
          "Cochlear implants and procedure related hospitalization expenses –",
          "Unnecessary Hospitalization – Only medically necessary admissions covered.",
          "Other Website-listed Exclusions",
        ],
        "moratoriumPeriod": {
          "MORATORIUM_PERIOD": {
            "key": "<b>Moratorium Period</b>",
            "value":
                "<b>Moratorium period is now over and the insurer cannot deny any claims due to non disclosure or misrepresentation unless in cases of proven fraud</p>",
            "tooltip": null,
          },
        },
        "addOns": null,
        "logs": null,
        "version": 2,
      },
    };

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
