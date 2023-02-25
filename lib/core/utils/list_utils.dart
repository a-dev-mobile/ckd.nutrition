/// ListUtils Singleton class
class ListUtils {
  factory ListUtils() => _internalSingleton;
  ListUtils._internal();

  static final ListUtils _internalSingleton = ListUtils._internal();

  static List<bool> getListBoolByIndexTrue({
    required int length,
    int? indexTrue,
  }) {
    final list = <bool>[];

    for (var i = 0; i < length - 1; i++) {
      if (i == indexTrue) {
        list.add(true);
      } else {
        list.add(false);
      }
    }

    return list;
  }
}
