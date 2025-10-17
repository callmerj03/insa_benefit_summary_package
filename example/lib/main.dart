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
            "value": "<p>Up to </p><b>₹10,00,000</b>",
            "tooltip": "Coverage for hospitalisation greater than 24 hours."
          },
          "ROOM_RENT": {
            "key": "<b>Room Rent</b>",
            "value": "<p>Private Single A/C Room</p>",
            "tooltip": "Limit on the category of room or amount of room rent."
          },
          "ICU_CHARGES": {
            "key": "<b>ICU Charges</b>",
            "value": "<p>Up to </p><b>₹10,00,000</b>",
            "tooltip": "Limit on the ICU expenses incurred during hospitalisation."
          },
          "AMBULANCE_CHARGES": {
            "key": "<b>Ambulance Charges</b>",
            "value":
                "<p>Road Ambulance Up to </p><b>₹10,00,000</b>, <p>Air Ambulance : Covered up to</p> <b>₹1,00,000</b>",
            "tooltip": "Coverage for ambulance charges under the policy."
          },
          "PRE_AND_POST_HOSPITALISATION_EXPENSES": {
            "key": "<b>Pre and Post Hospitalisation Expenses</b>",
            "value":
                "<p>Up to <b>₹10,00,000</b> for 60 days prior to hospitalization and for 180 days after discharge respectively</p>",
            "tooltip": "Expenses before and post a hospitalisation that is related to the hospitalisation"
          },
          "AYUSH_TREATMENT_COVERAGE": {
            "key": "<b>Ayush Treatment Coverage</b>",
            "value": "<p>Up to the </p><b>₹10,00,000</b>",
            "tooltip": "Treatment under Ayurveda, Unani, Siddhi, Homeopathy branches of medicine"
          },
          "DAY_CARE_TREATMENTS": {
            "key": "<b>Single-Day Surgeries (Day Care Treatments )</b>",
            "value": "<p>Up to the </p><b>₹10,00,000</b>",
            "tooltip": "Expenses for procedures that can be performed in the hospital in under 24 hours."
          },
          "HOSPITALISATION_AT_HOME": {
            "key": "<b>Hospitalisation at home (Domicilliary Hospitalization)</b>",
            "value":
                "<p>Up to <b>₹1,00,000</b> subject to maximum of <b>₹5 lakhs</b> in a policy year Coverage for medical treatment (Including AYUSH) for a period exceeding three days</p>",
            "tooltip": "Expenses for treatment at home when patient cannot be admitted to the hospital."
          },
          "HEALTH_CHECK_UP": {
            "key": "<b>Health Check Up</b>",
            "value": "<button>Table attached Sum Insured wise :healthCheckUp</button>",
            "tooltip": "Annual preventive health check up to determine general health and wellness of the insured"
          },
          "HEALTH_CHECK_UP_DETAILS": {
            "isCovered": true,
            "isAddon": false,
            "isCashless": false,
            "tableDetails":
                "<div style=\"font-family: Nunito, sans-serif; border-radius: 15px; overflow: hidden; font-size: 14px;\">\n            <table style=\"\n                width: 100%;\n                border: 1px solid #E6E6E6;\n                border-radius: 15px;\n                border-collapse: separate;\n                border-spacing: 0;\n                text-align: center;\n                font-family: Nunito, sans-serif;\n                font-size: 14px;\n                margin-top: 20px;\n            \">\n              <thead>\n                <tr style=\"background: #DEE4DA; font-weight: 800; font-size: 16px;\">\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-left-radius: 15px;\">\n                    Sum Insured Type\n                  </th>\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹5L</th>\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹10L</th>\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹15L</th>\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹20L/25L/50L</th>\n                  <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-right-radius: 15px;\">₹75L/1Cr</th>\n                </tr>\n              </thead>\n              <tbody>\n                <tr>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; font-weight: 800;\">Individual SI</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 1,500</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 2,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 4,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 5,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 8,000</td>\n                </tr>\n                <tr>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; font-weight: 800;\">Floater SI</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 2,500</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 5,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 8,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 10,000</td>\n                  <td style=\"border: 1px solid #E6E6E6; padding: 8px; background: #F3FFEA;\">₹ 15,000</td>\n                </tr>\n              </tbody>\n            </table>\n            \n          </div>"
          },
          "VACCINATION": null,
          "ADULT_VACCINATION": {"key": "<b>Adult Vaccination</b>", "value": "<p>Not Covered</p>", "tooltip": null},
          "CHILD_VACCINATION": {"key": "<b>Child Vaccination</b>", "value": "<p>Not Covered</p>", "tooltip": null},
          "CHILD_VACCINATION_DETAILS": null,
          "MODERN_TREATMENT_COVERAGE": {
            "key": "<b>Advanced Treatments (Modern Treatments)</b>",
            "value":
                "<p>Up to the </p><b>₹10,00,000</b><button>Click here to see the sub-limits :modern-treatment-sublimits</button>",
            "tooltip": "Treatment using advanced medical technology or procedures"
          },
          "MODERN_TREATMENT_COVERAGE_LIST": null,
          "MODERN_TREATMENT_SUB_LIMITS": [
            {"treatment": "Uterine artery Embolization & HIFU", "coverage1": "Up to 10,00,000"},
            {"treatment": "Balloon Sinuplasty", "coverage1": "Up to 10,00,000"},
            {"treatment": "Deep Brain Stimulation", "coverage1": "Up to 10,00,000"},
            {"treatment": "Oral Chemotherapy (Pre & Post Hosp.)", "coverage1": "Up to 10,00,000"},
            {"treatment": "Immunotherapy (Monoclonal Antibody)", "coverage1": "Up to 10,00,000"},
            {"treatment": "Intravitreal Injections", "coverage1": "Up to 10,00,000"},
            {"treatment": "Robotic Surgery", "coverage1": "Up to 10,00,000"},
            {"treatment": "Stereotactic Radiosurgeries", "coverage1": "Up to 10,00,000"},
            {"treatment": "Bronchial Thermoplasty", "coverage1": "Up to 10,00,000"},
            {"treatment": "Vaporation of Prostate (Green/Holmium Laser Treatment)", "coverage1": "Up to 10,00,000"},
            {"treatment": "IONM (Intraoperative Neuro Monitoring)", "coverage1": "Up to 10,00,000"},
            {"treatment": "Stem Cell Therapy (Haematopoietic stem cells)", "coverage1": "Up to 10,00,000"}
          ],
          "MATERNITY_BENEFITS_TABLE": null,
          "CASH_BENEFIT": {
            "key": "<b>Cash Benefit</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Fixed daily/incident-based cash payment to insured while hospitalized"
          },
          "CATARACT_COVERAGE": {
            "key": "<b>Cataract Coverage</b>",
            "value": "<p>Covered</p>",
            "tooltip": "Coverage for cataract surgery including pre/post hospitalization"
          },
          "CATARACT_COVERAGE_LIST": null,
          "MENTAL_ILLNESS_COVERAGES": {
            "key": "<b>Mental Illness coverages</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "In patient psychiatric treatment coverage for mental health conditions"
          },
          "INFERTILITY_TREATMENT": {
            "key": "<b>Infertility Treatment</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Coverage for fertility treatments, including IVF procedures"
          },
          "MATERNITY_BENEFITS": {
            "key": "<b>Maternity Benefits</b>",
            "value": "<p>Not Covered</p>",
            "tooltip": "Cover for cost related to maternity and child birth"
          },
          "MORBID_OBESITY_SURGERIES": {
            "key": "<b>Weight Reduction Surgeries (Morbid Obesity surgeries)</b>",
            "value":
                "<p>Covers weight loss surgery if you're 18+ and have a BMI of 40+, or 35+ with serious health issues like heart disease, sleep apnea, or uncontrolled diabetes — after other methods didn’t work.</p>",
            "tooltip": "Coverage for treatment/surgery of morbid obesity"
          },
          "CORRECTION_OF_REFRACTIVE_ERROR": {
            "key": "<b>Eye Power Correction (Correction of Refractive Error)</b>",
            "value": "<p>Covers poor eyesight that needs glasses or lenses stronger than 7.5 dioptres.</p>",
            "tooltip":
                "Cover for a vision problem where the eye does not bend (refract) light properly, causing blurred vision."
          }
        },
        "hospitalisationBenefits": {
          "IN_PATIENT_CARE": null,
          "ROOM_RENT": null,
          "ICU_CHARGES": null,
          "AMBULANCE_CHARGES": null,
          "PRE_HOSPITALISATION_EXPENSES": null,
          "POST_HOSPITALISATION_EXPENSES": null,
          "MORATORIUM_PERIOD": null
        },
        "otherBenefits": {
          "DAY_CARE_TREATMENTS": null,
          "DOMICILIARY_HOSPITALISATION": null,
          "MODERN_TREATMENT_COVERAGE": null,
          "AYUSH_TREATMENT_COVERAGE": null,
          "DAILY_CASH_BENEFIT": null,
          "PERSONAL_ACCIDENT_COVER": null,
          "MATERNITY_BENEFITS": null,
          "MODERN_TREATMENT_COVERAGE_LIST": null,
          "HEALTH_CHECK_UP": null,
          "HEALTH_CHECK_UP_DETAILS": null,
          "CHILD_VACCINATION": null,
          "CHILD_VACCINATION_DETAILS": null
        },
        "otherBenefitsAndLimits": {
          "CO-PAYMENT": null,
          "CO-PAYMENT_AGE": null,
          "ORGAN_DONAR_COVER": null,
          "SECOND_MEDICAL_OPINION": null,
          "RESTORATION_BENEFIT": {
            "key": "<b>Automatic Restoration of Basic Sum Insured</b>",
            "value":
                "<ul>\n  <li>Covered for child &lt;12 yrs if admitted to ICU</li>\n  <li>Mother’s stay in single A/C room: ₹2,500/day, max 7 days</li>\n  <li>Hotel stay reimbursed if hospital room unavailable (within 2 km)</li>\n</ul>\n",
            "tooltip": null
          },
          "WELLNESS_PROGRAM": {
            "key": "<b>Star Wellness Program</b>",
            "value":
                "<ul>\n  <li>₹2,50,000</li>\n  <li>Requires approval from two qualified surgeons</li>\n  <li>24-month waiting period from first policy inception</li>\n  <li>\n    Covers weight loss surgery if you're 18+ and have a BMI of 40+, or 35+ with \n    serious health issues like heart disease, sleep apnea, or uncontrolled diabetes — \n    after other methods didn’t work.\n  </li>\n</ul>\n",
            "tooltip": null
          },
          "WELLNESS_PROGRAM_TABLE": null,
          "COVERAGE_FOR_NEW_BORN_CHILD": null,
          "OUTPATIENT_BENEFIT": null,
          "OUT_PATIENT_MEDICAL_CONSULTATION_COVERAGE": null,
          "ACCIDENTAL_DEATH": null,
          "PERSONAL_ACCIDENT_COVER": null,
          "UTERO_FETAL_SURGERY": null,
          "ASSISTED_REPRODUCTIVE_TREATMENT": null,
          " CHRONIC_SEVERE_ASTHMA_TREATMENT": null,
          "COMPASSIONATE_TRAVEL": null,
          "REPATRIATION_MORTAL_REMAINS": null,
          "VALUABLE_SERVICE_PROVIDER": null,
          "SHARED_ACCOMMODATION": null,
          "MODERN_TREATMENT_COVERAGE": null,
          "REHAB_AND_PAIN_COVERAGE": null,
          "REHAB_AND_PAIN_COVERAGE_LIST": null,
          "CUMULATIVE_BONUS": {
            "key": "<b>Cumulative Bonus (Max)</b>",
            "value":
                "<p>50% of Sum Insured for each claim-free year subject to a maximum up to 100% of the Sum Insured</p>",
            "tooltip": null
          },
          "AUTOMATIC_RESTORATION": null,
          "NON_MEDICAL_ITEMS": null,
          "CONSUMABLES": null,
          "HOSPI_CARE": null,
          "MATERNITY_AND_NEW_BORN_BABY_COVER": null,
          "ORGAN_DONOR_EXPENSES": null,
          "EMERGENCY_MEDICAL_EVACUATION": null,
          "REPATRIATION_OF_MORTAL_REMAINS": null,
          "VALUABLE_SERVICE_PROVIDER_BENEFIT": null,
          "SHARED_ACCOMMODATION_BENEFIT": null,
          "ASSISTED_REPRODUCTION_TREATMENT": null,
          "RTA_ADDITIONAL_SI": null,
          "AUTOMATIC_RESTORATION_3X": null,
          "RECHARGE_BENEFIT": null,
          "LOYALTY_BONUS": null,
          "CO_PAYMENT_AGE_GE_61": null,
          "VOLUNTARY_CO_PAYMENT_DISCOUNT": null,
          "WELLNESS_PROGRAM_DISCOUNT": null,
          "HOSPITALISATION_AT_HOME": null,
          "PREMIUM_WAVER": null,
          "ONLINE_CONSULTATIONS": null,
          "OTHER_VALUE_ADDED_SERVICES": null,
          "NEW_BORN_BABY_COVERAGE": {
            "key": "<b>Hospitalization expenses for treatment of New Born Baby(per policy period)</b>",
            "value":
                "<p>Covered from Day 1 up to 10% of SI (max <b>₹2L</b>)-Sub-limit not applicable for congenital internal defects-Mother must be covered for 12 months continuously-Full SI cover in next year if premium paid</p> <button>Table attached :newBornBabyList</button>",
            "tooltip": null
          },
          "NEW_BORN_BABY_COVERAGE_LIST":
              "<div style=\"\n                font-family: Nunito, sans-serif; \n                border-radius: 15px; \n                background: #fff;\n                box-shadow: 0 4px 20px rgba(0,0,0,0.15); \n                padding: 20px; \n                max-width: 750px; \n                margin: 30px auto; \n                position: relative; \n                font-size: 14px;\n                \">\n\n                <!-- Title -->\n                <div style=\"font-weight: 700; font-size: 18px; margin-bottom: 15px; color:#222;\">\n                    Newborn Coverage\n                </div>\n\n\n                <!-- Table -->\n                <table style=\"\n                    width: 100%;\n                    border: 1px solid #E6E6E6;\n                    border-radius: 15px;\n                    border-collapse: separate;\n                    border-spacing: 0;\n                    text-align: center;\n                    font-family: Nunito, sans-serif;\n                    font-size: 14px;\n                    margin-top: 10px;\n                    overflow: hidden;\n                \">\n                    <thead>\n                        <tr style=\"background: #DEE4DA; font-weight: 800; font-size: 16px;\">\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-left-radius: 15px;\">Sum Insured Type</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹5L</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹10L</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹15L</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹20L/25L/50L</th>\n                            <th style=\"border: 1px solid #E6E6E6; padding: 8px; border-top-right-radius: 15px;\">₹75L/1Cr</th>\n                        </tr>\n                    </thead>\n                    <tbody>\n                        <tr style=\"background: #F3FFEA; font-size: 13px;\">\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px; text-align:left;\">\n                                Hospitalization expenses for treatment of New Born Baby (per policy period)\n                            </td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹50,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹1,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹1,50,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹2,00,000/-</td>\n                            <td style=\"border: 1px solid #E6E6E6; padding: 8px;\">₹2,00,000/-</td>\n                        </tr>\n                    </tbody>\n                </table>\n                </div>",
          "STAR_MOTHER_COVER": null,
          "undefined": null,
          "VOLUNTARY_STERILIZATION_EXPENSES": null,
          "ANTE_NATAL_CARE": null
        },
        "waitingPeriodAndSubLimits": {
          "STANDARD_WAITING_PERIOD": null,
          "PRE_EXISTING_DISEASE_WAITING_PERIOD": null,
          "SPECIFIC_WAITING_PERIOD": null,
          "SUB_LIMITS": null,
          "CATARACT_TREATMENT": null,
          "KNEE_REPLACEMENT": null,
          "NAMED_AILMENT_LIST": null
        },
        "waitingPeriodAndSubLimitsV2": {
          "STANDARD_WAITING_PERIOD": {
            "key": "<b>Standard Waiting Period</b>",
            "value":
                "<p>30 days from the date of inception- >>Expenses related to the treatment of any illness within thirty (30) days from the first policy commencement date shall be excluded except claims arising due to an accident, provided the same are covered.</p>",
            "tooltip": "Only accidental claims are covered in the first 30 days of policy."
          },
          "PRE_EXISTING_DISEASE_WAITING_PERIOD": {
            "key": "<b>Pre-existing diseases Waiting Period</b>",
            "value":
                "<p>Only PEDs declared in the Proposal Form and accepted for coverage by the Company shall be covered after 36 months Waiting Period</p>",
            "tooltip":
                "They are diseases that are diagnosed prior to the inception of the policy. These diseases are covered after a specific waiting period.",
            "disclaimer": null
          },
          "SPECIFIC_WAITING_PERIOD": {
            "key": "<b>Named (specific) ailments waiting period</b>",
            "value": "<button>click here for list of ailments</button>",
            "tooltip": "These are a specific set of diseases that are covered after a specified waiting period."
          },
          "NAMED_AILMENT_LIST": [
            {
              "duration": "24 months Waiting Period",
              "list": [
                "Treatment of Cataract and diseases of the anterior and posterior chamber of the Eye, Diseases of ENT, Diseases related to Thyroid, Benign diseases of the breast.",
                "Subcutaneous Benign Lumps, Sebaceous cyst, Dermoid cyst, Mucous cyst lip / cheek, Carpal Tunnel Syndrome, Trigger Finger, Lipoma, Neurofibroma, Fibroadenoma, Ganglion and similar pathology.",
                "All treatments (Conservative, Operative treatment) and all types of intervention for Diseases related to Tendon, Ligament, Fascia, Bones and Joint Including Arthroscopy and Arthroplasty / Joint Replacement [other than caused by accident].",
                "All types of treatment for Degenerative disc and Vertebral diseases including Replacement of bones and joints and Degenerative diseases of the Musculo-skeletal system, Prolapse of Intervertebral Disc (other than caused by accident).",
                "All treatments (conservative, interventional, laparoscopic and open) related to Hepato-pancreato-biliary diseases including Gall bladder and Pancreatic calculi. All types of management for Kidney calculi and Genitourinary tract calculi.",
                "All types of Hernia.",
                "Desmoid Tumor, Umbilical Granuloma, Umbilical Sinus, Umbilical Fistula.",
                "All treatments (conservative, interventional, laparoscopic and open) related to all Diseases of Cervix, Uterus, Fallopian tubes, Ovaries, Uterine Bleeding, Pelvic Inflammatory Diseases.",
                "All Diseases of Prostate, Stricture Urethra, all Obstructive Uropathies.",
                "Benign Tumours of Epididymis, Spermatocele, Varicocele, Hydrocele.",
                "Fistula, Fissure in Ano, Hemorrhoids, Pilonidal Sinus and Fistula, Rectal Prolapse, Stress Incontinence.",
                "Varicose veins and Varicose ulcers.",
                "All types of transplant and related surgeries.",
                "Congenital Internal disease / defect (except for New Born Cover - Section (III) (5) (Option A and Option B))."
              ]
            }
          ],
          "WAITING_PERIOD_FOR_HIV_AIDS_COVER": null
        },
        "exclusions": [
          "Diagnostic-only admissions not covered",
          "Rest cure, custodial & palliative care excluded",
          "Obesity surgery excluded unless strict criteria met",
          "Gender transition treatments not covered",
          "Cosmetic surgery excluded unless medically necessary",
          "Injuries from professional adventure sports excluded",
          "Claims from criminal acts not payable",
          "Treatment at blacklisted providers not covered",
          "Alcohol/drug addiction treatments excluded",
          "Spa/nature cure clinic treatments not covered",
          "Non-prescription supplements excluded",
          "Vision correction <7.5 dioptres not covered",
          "Unproven/experimental treatments excluded",
          "Infertility, ART, surrogacy, sterilization reversal excluded",
          "Maternity expenses excluded (except ectopic pregnancy)",
          "Circumcision & related procedures excluded unless medically necessary",
          "Congenital external defects excluded (except newborn cover)",
          "Convalescence & nutritional deficiency states excluded",
          "Intentional self-injury not covered",
          "War-related injuries/diseases excluded",
          "Nuclear-related injuries/diseases excluded",
          "Certain alternative therapies excluded",
          "Unconventional/untested therapies excluded",
          "PRP, stromal, chondrocyte procedures excluded",
          "Biologicals excluded unless inpatient & medically indicated",
          "Vaccination excluded (except post-bite or therapeutic)",
          "Aids like spectacles, hearing aids, CPAP, etc. excluded",
          "Non-medically necessary hospitalizations excluded",
          "List I consumables excluded unless optional cover taken",
          "Pre-declared permanent exclusions not covered"
        ],
        "moratoriumPeriod": {"MORATORIUM_PERIOD": null},
        "addOns": [
          {
            "key": "<b>Optional Cover (Lump sum on diagnosis of Cancer)</b>",
            "value":
                "If the insured person shall contract Cancer as a first incidence, then Company will pay the sum insured stated in the additional premium (Available and on payment and shown in the Schedule as lump-sum. II. 29 policy schedule)"
          }
        ],
        "logs": null,
        "version": 2
      }
    };

    // Map<String, dynamic> map =
    // {
    //   "success": true,
    //   "message": "Benefits Summary Data Fetched Successfully.",
    //   "data": {
    //     "coverageAndLimits": {
    //       "IN_PATIENT_CARE": {
    //         "key": "In-patient Care",
    //         "value": "Covered up to ₹15,00,000",
    //         "tooltip": "Coverage for hospitalisation greater than 24 hours.",
    //         "source_info": "Expenses During Hospitalization (Covers AYUSH): Covered up to Sum Insured for 2+ hours of Hospitalization."
    //       },
    //       "ROOM_RENT": {
    //         "key": "Room Rent",
    //         "value": "Covered up to Sum Insured",
    //         "tooltip": "Limit on the category of room or amount of room rent.",
    //         "source_info": "Room Type Capping: Covered up to Sum Insured"
    //       },
    //       "ICU_CHARGES": {
    //         "key": "ICU Charges",
    //         "value": "Covered up to Sum Insured",
    //         "tooltip": "Limit on the ICU expenses incurred during hospitalisation.",
    //         "source_info": "Irrespective of the Room type you choose, ICU admission will always be paid up to Sum Insured."
    //       },
    //       "AMBULANCE_CHARGES": {
    //         "key": "Ambulance Charges",
    //         "value": "Road Ambulance: Covered up to ₹15,00,000, Air Ambulance: Covered up to ₹15,00,000",
    //         "tooltip": "Coverage for ambulance charges under the policy.",
    //         "source_info": "Expenses in Reaching Hospital\nRoad Ambulance: Up to Sum Insured\nAir Ambulance: Up to Sum Insured"
    //       },
    //       "PRE_AND_POST_HOSPITALISATION_EXPENSES": {
    //         "key": "Pre and Post Hospitalisation Expenses",
    //         "value": "Covered up to ₹15,00,000 for 60 days (pre) and 180 days (post) respectively",
    //         "tooltip": "Expenses before and post a hospitalisation that is related to the hospitalisation",
    //         "source_info": "Expenses Before and After a Hospitalization\nCovered up to Sum Insured.\n60 Days and 180 Days Respectively"
    //       },
    //       "AYUSH_TREATMENT_COVERAGE": {
    //         "key": "Ayush Treatment Coverage",
    //         "value": "Covered up to ₹15,00,000",
    //         "tooltip": "Treatment under Ayurveda, Unani, Siddhi, Homeopathy branches of medicine",
    //         "source_info": "Expenses During Hospitalization (Covers AYUSH)\nCovered up to Sum Insured for 2+ hours of Hospitalization. (24+ hours for Ayush Treatment)"
    //       },
    //       "DAY_CARE_TREATMENTS": {
    //         "key": "Day Care Treatments",
    //         "value": "Covered up to ₹15,00,000",
    //         "tooltip": "Expenses for procedures that can be performed in the hospital in under 24 hours.",
    //         "source_info": "All Day Care Treatments covered."
    //       },
    //       "HOSPITALISATION_AT_HOME": {
    //         "key": "Hospitalisation at Home",
    //         "value": "Covered up to ₹15,00,000",
    //         "tooltip": "Expenses for treatment at home when patient cannot be admitted to the hospital.",
    //         "source_info": "Home Care/Domiciliary\nCovered up to Sum Insured"
    //       },
    //       "VACCINATION": {
    //         "key": "Vaccination",
    //         "value": "Covered under M-iracle benefit <button>Click here to see the details</button>",
    //         "tooltip": "Coverage for vaccinations as specified in the policy.",
    //         "source_info": "Vaccines that will be covered are Tdap (Tetanus, Diphtheria, Pertussis), Td (Tetanus, Diphtheria), Flu Shot, Hepatitis A, Hepatitis B.",
    //         "table_data": "<table style=\"border-collapse:collapse;width:100%;\"><tr style=\"background:#f2f2f2;\"><th style=\"border:1px solid #ddd;padding:6px;\">Vaccines Covered</th></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Tdap (Tetanus, Diphtheria, Pertussis)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Td (Tetanus, Diphtheria)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Flu Shot</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Hepatitis A</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Hepatitis B</td></tr></table>"
    //       },
    //       "MODERN_TREATMENT_COVERAGE": {
    //         "key": "Modern Treatment Coverage",
    //         "value": "Covered up to ₹15,00,000 <button>Click here to see the details</button>",
    //         "tooltip": "Treatment using advanced medical technology or procedures",
    //         "source_info": "Modern treatments Up to Sum Insured.",
    //         "table_data": "<table style=\"border-collapse:collapse;width:100%;\"><tr style=\"background:#f2f2f2;\"><th style=\"border:1px solid #ddd;padding:6px;\">Treatments Covered</th></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Uterine Artery Embolization and HIFU</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Immunotherapy (Monoclonal Antibody injection)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Vaporisation of the prostate (Green laser or holmium laser)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Stem cell therapy for haematological conditions</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Balloon Sinuplasty</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Oral Chemotherapy</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Robotic surgeries</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Stereotactic radio Surgeries</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Deep Brain stimulation</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Intra vitreal injections</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Bronchial Thermoplasty</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Intra Operative Neuro Monitoring (IONM)</td></tr></table>"
    //       },
    //       "CATARACT_COVERAGE": {
    //         "key": "Cataract Coverage",
    //         "value": "Covered up to ₹15,00,000 after a 24-month waiting period",
    //         "tooltip": "Coverage for cataract surgery including pre/post hospitalization",
    //         "source_info": "Specific Waiting Period (Not applicable for claims arising due to an accident) (Excl02): 24 months for all of the following conditions\nCataract, glaucoma and retinal detachment"
    //       },
    //       "INFERTILITY_TREATMENT": {
    //         "key": "Infertility Treatment",
    //         "value": "Covered up to ₹15,000 under M-iracle benefit",
    //         "tooltip": "Coverage for fertility treatments, including IVF procedures",
    //         "source_info": "M-iracle: The benefit Sum Insured 15,000. The M-iracle benefit covers parenthood expenses including... Treatment for infertility, Assisted reproduction like In vitro fertilization (IVF), Gamete intrafallopian transfer (GIFT), Zygote intrafallopian transfer (ZIFT), Intracytoplasmic Sperm Injection (ICSI)."
    //       },
    //       "MATERNITY_BENEFITS": {
    //         "key": "Maternity Benefits",
    //         "value": "Covered up to ₹15,000 under M-iracle benefit, with a 24-month waiting period",
    //         "tooltip": "Cover for cost related to maternity and child birth",
    //         "source_info": "M-iracle Waiting Period: 24 Months. M-iracle: The benefit Sum Insured 15,000. The M-iracle benefit covers parenthood expenses including antenatal check-ups, vaccines for the expecting mother, delivery (Normal or Caesarian), surrogacy, assisted reproduction (IVF, GIFT, ZIFT, ICSI), medical termination of pregnancy, infertility treatment, and charges for legally adopting a child."
    //       },
    //       "MORBID_OBESITY_SURGERIES": {
    //         "key": "Weight Reduction Surgeries",
    //         "value": "Covered up to Sum Insured if specific conditions (like BMI >= 40, or BMI >= 35 with co-morbidities) are met.",
    //         "tooltip": "Coverage for treatment/surgery of morbid obesity",
    //         "source_info": "Expenses related to the surgical treatment of obesity that does not fulfil all the below conditions: a. Surgery to be conducted is upon the advice of the Doctor. b. The surgery/Procedure conducted should be supported by clinical protocols. c. The member has to be 18 years of age or older and; d. Body Mass Index (BMI); i. greater than or equal to 40 or ii. greater than or equal to 35 in conjunction with any of the following severe co-morbidities following failure of less invasive methods of weight loss"
    //       },
    //       "HEALTH_CHECK_UP": {
    //         "key": "Health Check-up",
    //         "value": "Covered once per policy year from day 1 for a defined list of tests. <button>Click here to see the details</button>",
    //         "tooltip": "Annual preventive health check up to determine general health and wellness of the insured",
    //         "source_info": "Annual Health Check-up (Only Cashless)\nCovered for defined list of tests",
    //         "table_data": "<table style=\"border-collapse:collapse;width:100%;\"><tr style=\"background:#f2f2f2;\"><th style=\"border:1px solid #ddd;padding:6px;\">Tests Covered</th></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Complete blood count (CBC)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Physical Examination</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Urine Routine</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">ESR</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Fasting Blood sugar (FBS)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Lipid Profile</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Kidney function test</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Liver Function Test (LFT)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">ECG</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">X-Ray chest</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Serum Vitamin D</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Mammogram</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">PAP smear</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Post prandial blood sugar</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Uric Acid</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Serum Electrolytes</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">HbA1C</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Thyroid function test</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Treadmill test (TMT) or 2D ECHO</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Ultrasound test (USG)</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Serum calcium</td></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">Colonoscopy (for >50 year olds)</td></tr></table>"
    //       }
    //     },
    //     "otherBenefitsAndLimits": {
    //       "ORGAN_DONAR_COVER": {
    //         "key": "Organ Donor Cover",
    //         "value": "Covered up to ₹15,00,000",
    //         "source_info": "Organ Donor\nCovered up to Sum Insured"
    //       },
    //       "RE_FILL": {
    //         "key": "ReAssure+ Benefit",
    //         "value": "Unlimited Sum Insured triggered on first claim. Maximum for any single claim is up to the Base Sum Insured.",
    //         "tooltip": "Restores the sum insured after it has been exhausted.",
    //         "source_info": "ReAssure+ ReAssure \"Forever\": First claim paid triggers ReAssure, forever. It is unlimited. Each claim under ReAssure \"Forever\" will be up to Base Sum Insured."
    //       },
    //       "LOYALTY_BONUS": {
    //         "key": "Live Healthy Benefit",
    //         "value": "Up to 30% discount on renewal premium based on health points earned from walking.",
    //         "tooltip": "A benefit that rewards policyholders for staying with the insurer over time, often in the form of a premium discount or enhanced coverage.",
    //         "source_info": "Live Healthy\nUp to 30% Discount on Renewal premium basic steps taken."
    //       },
    //       "NO_CLAIM_BONUS": {
    //         "key": "Booster+ Benefit",
    //         "value": "Unutilized Base Sum Insured is carried forward, up to a maximum of ₹75,00,000 (5 times the Base Sum Insured).",
    //         "tooltip": "A reward for not making any claims in a policy year, usually as an increase in sum insured at no extra cost.",
    //         "source_info": "Booster+\nCarry forward unutilized sum Insured Maximum up to 5X times of Base Sum Insured"
    //       },
    //       "CO-PAYMENT": {
    //         "key": "Co-payment",
    //         "value": "Not Opted",
    //         "tooltip": "A fixed percentage of the claim amount that the policyholder must pay out-of-pocket.",
    //         "source_info": "Co-payment Not Opted"
    //       }
    //     },
    //     "waitingPeriodAndSubLimitsV2": {
    //       "STANDARD_WAITING_PERIOD": {
    //         "key": "Standard Waiting Period",
    //         "value": "30 days from the first policy commencement date for all illnesses.",
    //         "tooltip": "Only accidental claims are covered in the first 30 days of policy.",
    //         "source_info": "Initial Waiting Period (Excl03) - 30 days for all illnesses (not applicable in case of continuous renewal or accidents)"
    //       },
    //       "PRE_EXISTING_DISEASE_WAITING_PERIOD": {
    //         "key": "Pre-existing diseases Waiting Period",
    //         "value": "36 months from the first policy commencement date.",
    //         "tooltip": "The time period after which pre-existing medical conditions are covered by the policy.",
    //         "source_info": "Pre-existing diseases (Excl01): Pre-existing Disease (PED) and its direct complications shall be excluded until the expiry of 36 Months of continuous coverage."
    //       },
    //       "SPECIFIC_WAITING_PERIOD": {
    //         "key": "Named (specific) ailments waiting period",
    //         "value": "24 months for a specific list of ailments. <button>Click here to see the details</button>",
    //         "tooltip": "These are a specific set of diseases that are covered after a specified waiting period.",
    //         "source_info": "Specific Waiting Period (Not applicable for claims arising due to an accident) (Excl02): 24 months for all of the following conditions",
    //         "table_data": "<table style=\"border-collapse:collapse;width:100%;\"><tr style=\"background:#f2f2f2;\"><th style=\"border:1px solid #ddd;padding:6px;\">Duration</th><th style=\"border:1px solid #ddd;padding:6px;\">Ailments</th></tr><tr><td style=\"border:1px solid #ddd;padding:6px;\">24 months Waiting Period</td><td style=\"border:1px solid #ddd;padding:6px;\">Pancreatitis and stones in biliary and urinary system<br>Cataract, glaucoma and retinal detachment<br>Hyperplasia of prostate, hydrocele and spermatocele<br>Prolapse uterus or cervix, endometriosis, Fibroids, Polycystic ovarian disease (PCOD), hysterectomy (unless necessitated by Malignancy)<br>Hemorrhoids, fissure, fistula or abscess of anal and rectal region<br>Hernia of any site or type<br>Osteoarthritis, joint replacement, osteoporosis, systemic connective tissue disorders, inflammatory polyarthropathies, Rheumatoid Arthritis, gout, intervertebral disc disorders, arthroscopic surgeries for ligament repair<br>Varicose veins of lower extremities<br>All internal or external benign neoplasms/ tumours, cyst, sinus, polyps, nodules, mass or lump<br>Ulcer, erosion or varices of gastro intestinal tract<br>Surgical treatment for diseases of middle ear and mastoid (including otitis media, cholesteatoma, perforation of tympanic membrane), Tonsils and adenoids, nasal septum and nasal sinuses</td></tr></table>"
    //       }
    //     },
    //     "exclusions": [
    //       "Treatment for, alcoholism, drug or substance abuse or any addictive condition and consequences thereof.",
    //       "Expenses for cosmetic or plastic surgery, or any treatment to change appearance unless for reconstruction following an Accident, Burn(s) or Cancer.",
    //       "Expenses related to any unproven treatment, services, and supplies.",
    //       "All dental treatments other than due to accidents and cancers.",
    //       "Artificial life maintenance for the Insured Person who has been declared brain dead or in vegetative state.",
    //       "Expenses related to rest cure, rehabilitation, and respite care.",
    //       "Treatment for any Injury or Illness resulting directly or indirectly from nuclear, radiological emissions, war or war like situations.",
    //       "Expenses for any admission primarily for diagnostic and evaluation purposes."
    //     ],
    //     "addOns": [],
    //     "logs": null,
    //     "version": 2
    //   }
    // };



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
