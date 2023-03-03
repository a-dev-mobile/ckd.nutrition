/// AppSpacing Singleton class
class AppSpacing {
  factory AppSpacing() => _internalSingleton;
  AppSpacing._internal();
  static final AppSpacing _internalSingleton = AppSpacing._internal();

  static const double small = 4;
  static const double semiSmall = 8;
  static const double regular = 12;
  static const double semiBig = 22;
  static const double big = 32;
}
