abstract class AppConstants {
  static const double pageHorizontalPadding=20;
  static const double borderRadius=8;
  static const String apiBaseUrl="https://fakestoreapi.com/";
  static const String mockText="mock text";
  static const String placeholerImg="https://picsum.photos/seed/775/600";


  //shared-preference keys

  static const String usernameKey="Username";
  static const String isLoggedInKey="isLoggedIn";
}

typedef JSON = Map<String, dynamic>;

enum AppStateStatus {
  initial,
  loadingBody,
  successLoaded,
  error,
  loadingButton,
  successSubmit
}
