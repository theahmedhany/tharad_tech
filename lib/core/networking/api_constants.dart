class ApiConstants {
  // Base URL for the API
  static const String apiBaseUrl = "https://flutter.tharadtech.com/api/";

  // Auth Endpoints
  static const String apiLogin = "auth/login";
  static const String apiRegister = "auth/register";
  static const String apiLogout = "auth/logout";
  static const String apiOtp = "otp";

  static const String apiUserDetails = "profile-details";
  static const String apiUpdateProfile = "Update-Profile";
}

class ApiErrors {
  static const String badRequestError =
      "طلب غير صالح. يرجى التحقق من البيانات المدخلة.";
  static const String noContent = "لا يوجد محتوى متاح.";
  static const String forbiddenError = "ليس لديك صلاحية للوصول إلى هذا المورد.";
  static const String unauthorizedError = "يجب عليك تسجيل الدخول للمتابعة.";
  static const String notFoundError = "لم يتم العثور على المورد المطلوب.";
  static const String conflictError = "حدث تعارض في البيانات.";
  static const String internalServerError =
      "حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقاً.";
  static const String unknownError =
      "حدث خطأ غير معروف. يرجى المحاولة مرة أخرى.";
  static const String timeoutError =
      "انتهت مهلة الاتصال. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.";
  static const String defaultError =
      "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.";
  static const String cacheError = "حدث خطأ في ذاكرة التخزين المؤقت.";
  static const String noInternetError =
      "لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.";
  static const String loadingMessage = "جاري التحميل...";
  static const String retryAgainMessage = "يرجى المحاولة مرة أخرى";
  static const String ok = "حسناً";
}
