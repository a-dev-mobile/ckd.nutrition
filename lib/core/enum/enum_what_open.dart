  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  
  
  enum EnumWhatOpen {
  dialog,
  bottom,
  page,
  none,
    
}
  */
  
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  

enum EnumWhatOpen with Comparable<EnumWhatOpen> { 
  dialog('dialog'),
  bottom('bottom'),
  page('page'),
  none('none');

  const EnumWhatOpen(this.value);

  final String value;

  static EnumWhatOpen fromValue(
    String? value, {
    EnumWhatOpen? fallback,
  }) {
    switch (value) {
      case 'dialog':
        return dialog;
      case 'bottom':
        return bottom;
      case 'page':
        return page;
      case 'none':
        return none;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }


  T map<T>({
    required T Function() dialog,
    required T Function() bottom,
    required T Function() page,
    required T Function() none,

  }) {
    switch (this) {
      case EnumWhatOpen.dialog:
        return dialog();     
      case EnumWhatOpen.bottom:
        return bottom();     
      case EnumWhatOpen.page:
        return page();     
      case EnumWhatOpen.none:
        return none();     

    }
  }

  T mapConst<T>({
    required T dialog,
    required T bottom,
    required T page,
    required T none,

  }) {
    switch (this) {
      case EnumWhatOpen.dialog:
        return dialog;     
      case EnumWhatOpen.bottom:
        return bottom;     
      case EnumWhatOpen.page:
        return page;     
      case EnumWhatOpen.none:
        return none;     

    }
  }

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? dialog,
    T Function()? bottom,
    T Function()? page,
    T Function()? none,

  }) =>
      map<T>(
      dialog: dialog ?? orElse,     
      bottom: bottom ?? orElse,     
      page: page ?? orElse,     
      none: none ?? orElse,     

      );

  T? maybeMapOrNull<T>({
    T Function()? dialog,
    T Function()? bottom,
    T Function()? page,
    T Function()? none,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        dialog: dialog,  
        bottom: bottom,  
        page: page,  
        none: none,  
        
      );

  @override
  int compareTo(EnumWhatOpen other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
