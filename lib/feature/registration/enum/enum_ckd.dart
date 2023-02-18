  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum EnumCkd {
  one,
  two,
  threeA,
  threeB,
  four,
  five,
  calculate,
  none,
}

  */
  
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  

enum EnumCkd with Comparable<EnumCkd> { 
  one('one'),
  two('two'),
  threeA('threeA'),
  threeB('threeB'),
  four('four'),
  five('five'),
  calculate('calculate'),
  none('none');

  const EnumCkd(this.value);

  final String value;

  static EnumCkd fromValue(
    String? value, {
    EnumCkd? fallback,
  }) {
    switch (value) {
      case 'one':
        return one;
      case 'two':
        return two;
      case 'threeA':
        return threeA;
      case 'threeB':
        return threeB;
      case 'four':
        return four;
      case 'five':
        return five;
      case 'calculate':
        return calculate;
      case 'none':
        return none;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  /// Pattern matching
  T map<T>({
    required T Function() one,
    required T Function() two,
    required T Function() threeA,
    required T Function() threeB,
    required T Function() four,
    required T Function() five,
    required T Function() calculate,
    required T Function() none,

  }) {
    switch (this) {
      case EnumCkd.one:
        return one();     
      case EnumCkd.two:
        return two();     
      case EnumCkd.threeA:
        return threeA();     
      case EnumCkd.threeB:
        return threeB();     
      case EnumCkd.four:
        return four();     
      case EnumCkd.five:
        return five();     
      case EnumCkd.calculate:
        return calculate();     
      case EnumCkd.none:
        return none();     

    }
  }
  
  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? one,
    T Function()? two,
    T Function()? threeA,
    T Function()? threeB,
    T Function()? four,
    T Function()? five,
    T Function()? calculate,
    T Function()? none,

  }) =>
      map<T>(
      one: one ?? orElse,     
      two: two ?? orElse,     
      threeA: threeA ?? orElse,     
      threeB: threeB ?? orElse,     
      four: four ?? orElse,     
      five: five ?? orElse,     
      calculate: calculate ?? orElse,     
      none: none ?? orElse,     

      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? one,
    T Function()? two,
    T Function()? threeA,
    T Function()? threeB,
    T Function()? four,
    T Function()? five,
    T Function()? calculate,
    T Function()? none,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        one: one,  
        two: two,  
        threeA: threeA,  
        threeB: threeB,  
        four: four,  
        five: five,  
        calculate: calculate,  
        none: none,  
        
      );

  @override
  int compareTo(EnumCkd other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
