import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

double calcIMC(
  double? pWeight,
  double? pSize,
  bool pIsImperial,
  double? pFeet,
) {
  if (pWeight == null || pSize == null) {
    return -1;
  }

  double weight = pWeight;
  double size = pSize;

  if (pIsImperial) {
    weight *= 703;
    if (pFeet != null) {
      size = pSize + 12 * pFeet;
    } else {
      return -1;
    }
  }

  if (pIsImperial) {
    double imc = (weight / math.pow(size, 2));
    return double.parse(imc.toStringAsFixed(2));
  }

  double imc = (weight / math.pow(size, 2)) * 10000;
  return double.parse(imc.toStringAsFixed(2));

  //return double.parse(imc.toStringAsFixed(2));
}

bool? calcBodyFatBoolean(
  int? pAge,
  String? pGenre,
  double? pIMC,
) {
  if (pAge == null || pGenre == null || pIMC == null) {
    return false;
  } else {
    if (pGenre == "Women") {
      return true;
    } else if (pGenre == "Men") {
      return true;
    } else {
      return false;
    }
  }
}

double calcBodyFatDouble(
  int? pAge,
  String? pGenre,
  double? pIMC,
) {
  if (pAge == null || pGenre == null || pIMC == null) {
    return -1;
  } else {
    double vAge = pAge.toDouble();
    if (pGenre == "Women") {
      double vBodyFat = ((1.2 * pIMC) + (0.23 * vAge) - 5.4);
      return vBodyFat;
    } else if (pGenre == "Men") {
      double vBodyFat = ((1.2 * pIMC) + (0.23 * vAge) - (10.8) - 5.4);
      return vBodyFat;
    } else {
      return -1;
    }
  }
}

String? calcBodyFat(
  int? pAge,
  String? pGenre,
  double? pIMC,
) {
  if (pAge == null || pGenre == null || pIMC == null) {
    return "Impossible to calculate your body fat index";
  } else {
    double vAge = pAge.toDouble();
    if (pGenre == "Women") {
      double vBodyFat = ((1.2 * pIMC) + (0.23 * vAge) - 5.4);
      return "≈ " + vBodyFat.toStringAsFixed(2) + "%";
    } else if (pGenre == "Men") {
      double vBodyFat = ((1.2 * pIMC) + (0.23 * vAge) - (10.8) - 5.4);
      return "≈ " + vBodyFat.toStringAsFixed(2) + "%";
    } else {
      return "Impossible to calculate your body fat index";
    }
  }
}

String calcCalorie(
  double? pWeight,
  double? pSize,
  int? pAge,
  String? pActivity,
  String? pGoal,
  String? pGenre,
  bool pImperial,
  double? pFeet,
) {
  if (pWeight == null ||
      pSize == null ||
      pAge == null ||
      pActivity == null ||
      pGoal == null) {
    return "It is not possible to calculate your daily calorie requirement using only the data you have provided.";
  } else {
    double vMB = 0;
    String vCalGoal = "";
    if (pImperial) {
      pWeight /= 2.205;
      if (pFeet != null) {
        pSize += pFeet * 12;
      } else {
        return "It is not possible to calculate your daily calorie requirement using only the data you have provided.";
      }

      pSize *= 2.54;
    }
    if (pGenre == "Women") {
      vMB = 88.362 + (13.397 * pWeight) + (4.799 * pSize) - (5.677 * pAge);
    } else if (pGenre == "Men") {
      vMB = 447.593 + (9.247 * pWeight) + (3.098 * pSize) - (4.330 * pAge);
    } else {
      return "It is not possible to calculate your daily calorie requirement using only the data you have provided.";
    }
    switch (pActivity) {
      case "Very little physical activity":
        vMB *= 1.2;
        break;
      case "Occasional light physical activity":
        vMB *= 1.375;
        break;
      case "Moderate to intense physical exercise, 3-5 times a week":
        vMB *= 1.55;
        break;
      case "Intense physical exercise most days of the week":
        vMB *= 1.725;
        break;
      case "Intense physical exercise every day of the week":
        vMB *= 1.9;
        break;
    }
    switch (pGoal) {
      case "Weight loss":
        vCalGoal +=
            ", and to achieve your goals you need a calorie deficit of between 500 and 1000, which corresponds to a daily calorie count of between " +
                (vMB - 1000.0).toStringAsFixed(2) +
                " and " +
                (vMB - 500.0).toStringAsFixed(2) +
                " calories a day.";
        break;
      case "Weight maintenance":
        vCalGoal +=
            ", and to maintain your weight, you need to respect your daily calorie requirements.";
        break;
      case "Weight gain":
        vCalGoal +=
            ", and to achieve your goals you need to increase your daily calorie intake by 250 to 500 calories in relation to your daily calorie requirement, which corresponds to : " +
                (vMB + 250.0).toStringAsFixed(2) +
                " to " +
                (vMB + 500.0).toStringAsFixed(2) +
                " calories per day";
        break;
    }

    return "You need around " +
        vMB.toStringAsFixed(2) +
        " calories per day" +
        vCalGoal;
  }
}

String? bMIZone(double? pIMC) {
  // This fonction return the zone of the BMI take in parameter
  if (pIMC == null) {
    return null;
  } else if (pIMC < 16.5) {
    return 'Severe thinness';
  } else if (pIMC < 18.5) {
    return 'Moderate thinness';
  } else if (pIMC < 25) {
    return 'Normal';
  } else if (pIMC < 30) {
    return 'Overweight';
  } else if (pIMC < 35) {
    return 'Obese Class I';
  } else if (pIMC < 40) {
    return 'Obese Class II';
  } else {
    return 'Obese Class III';
  }
}

bool? isIMC(double? pIMC) {
  // Return false if pIMC = 0
  if (pIMC == 0 || pIMC == -1) {
    return false;
  }
  return true;
}

String todayDateString() {
  // This fonction return the date of today with this format : DD-MON-YEAR
  final now = DateTime.now();
  final formatter = DateFormat('dd-MMM-yyyy');
  return formatter.format(now);
}

DateTime toDayDate() {
  // return the today date
  return DateTime.now();
}

int numberDateFromInstall(DateTime pInstall) {
  // return the number of day from the date in parametre
  DateTime now = DateTime.now();
  Duration difference = now.difference(pInstall);
  return difference.inDays;
}

double calcNavyBodyFat(
  String? pGenre,
  double? pWaist,
  double? pNeck,
  double? pHip,
  double? pSize,
  double? pWeight,
  bool pImperial,
  double? pFeetWaist,
  double? pFeetNeck,
  double? pFeetHip,
  double? pFeet,
) {
  if (pGenre != "Women" && pGenre != "Men" ||
      pWaist == null ||
      pNeck == null ||
      (pGenre == "Women" && pHip == null) ||
      pSize == null ||
      pWeight == null) {
    return -1;
  }

  double log10(num x) {
    return math.log(x) / math.log(10);
  }

  if (pImperial) {
    /*
    if (pGenre == "Men") {
      return (86.010 * (log10(pWaist - pNeck) + 70.041 * (log10(pSize))) +
          36.76);
    } else if (pGenre == "Women" && pHip != null) {
      return (163.205 *
              (log10(pWaist + pHip - pNeck) - 97.684 * (log10(pSize))) -
          78.387);
    }
  } else {
    */
    if (pFeetWaist != null && pFeetNeck != null && pFeet != null) {
      pWaist += pFeetWaist * 12;
      pNeck += pFeetNeck * 12;
      pSize += pFeet * 12;
    } else {
      return -1;
    }

    pWaist *= 2.54;
    pNeck *= 2.54;
    if (pGenre == "Women" && pHip != null && pFeetHip != null) {
      pHip += pFeetHip * 12;
      pHip *= 2.54;
    }
    pSize *= 2.54;
    pWeight /= 2.205;
  }
  if (pGenre == "Men") {
    return 495 /
            (1.0324 -
                0.19077 * log10(pWaist - pNeck) +
                0.15456 * log10(pSize)) -
        450;
  } else if (pGenre == "Women" && pHip != null) {
    return 495 /
            (1.29579 -
                0.35004 * log10(pWaist + pHip - pNeck) +
                0.22100 * log10(pSize)) -
        450;
  }

  return -1;
}

double calcFatMass(
  double pBodyFat,
  double pWeight,
) {
  return (pBodyFat * pWeight) / 100;
}

double calcLeanMass(
  double pWeight,
  double pFM,
) {
  return pWeight - pFM;
}
