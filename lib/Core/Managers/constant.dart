import '../Utils/utils.dart';

const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');
const bool kDebugMode = !kReleaseMode && !kProfileMode;
var regExpPhone = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
var regExpPassword =
RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#$&*~]).{8,}$');

void printDB(Object msg){
  if(kDebugMode){
    print(msg);
  }
}
class Constant {
  static const String baseUrl = 'https://api.github.com/';// 'http://127.0.0.1:8000/api';


  static const String isLoginKey = 'isLogin';
  static const String accessTokenKey = 'accessToken';

  static const int successResponse = 200;
  static const int notFoundResponse = 404;
  static const int badResponse = 400;
  static const int unAuthorisedResponse = 401;
  static const int errorResponse = 500;
  static const int successStoreResponse = 201;

  bool? _languageIsArabic;

  bool get languageIsArabic =>
      _languageIsArabic ?? Utils.languageIsArabicFunBool();

  set languageIsArabic(bool value) {
    _languageIsArabic = value;
  }

  bool? _isLogin;

  bool get isLogin => _isLogin ?? false;

  set isLogin(bool value) {
    _isLogin = value;
  }
}
