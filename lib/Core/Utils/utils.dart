import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repo_git/Core/Managers/ColorManager.dart';
import 'package:user_repo_git/Core/Utils/singleton_services.dart';
import '../Managers/constant.dart';

class Utils {

  static bool languageIsArabicFunBool() {
    if (Locales.lang == 'ar') {
      return true;
    } else {
      return false;
    }
  }

  static String getTranslate(context, text) => Locales.string(context, text);

  static String priceHelper(context, price) => "$price ${getTranslate(context, 'sar')}" ;

  static void goToPage(
      {required BuildContext context,
      required Widget widget,
      bool? isPushAndRemoveUntil = false,
      bool? isReplacement = false}) {
    if (isPushAndRemoveUntil!) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return widget;
      }), (route) => false);
    } else if (isReplacement!) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return widget;
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return widget;
      }));
    }
  }

  static showToast(String msg,
      {bool multiLang = false, BuildContext? context}) {
    Fluttertoast.showToast(
      msg: multiLang ? Locales.string(context!, msg) : msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: ColorManager.lightYellow,
      textColor: ColorManager.darkBlue,
      fontSize: 14,
    );
  }

  static bool checkIfLogin() {
    return getFromSingleton<SharedPreferences>().getBool(Constant.isLoginKey) ??
        false;
  }


}
