  // ignore_for_file: constant_identifier_names, non_constant_identifier_names, lines_longer_than_80_chars
  /*
  enum DaDataEnum { name, surname, patronymic, all }
  */
  
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  

enum DaDataEnum with Comparable<DaDataEnum> { 
  name('name'),
  surname('surname'),
  patronymic('patronymic'),
  all('all');

  const DaDataEnum(this.value);

  final String value;

  static DaDataEnum fromValue(
    String? value, {
    DaDataEnum? fallback,
  }) {
    switch (value) {
      case 'name':
        return name;
      case 'surname':
        return surname;
      case 'patronymic':
        return patronymic;
      case 'all':
        return all;

      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }


  T map<T>({
    required T Function() name,
    required T Function() surname,
    required T Function() patronymic,
    required T Function() all,

  }) {
    switch (this) {
      case DaDataEnum.name:
        return name();     
      case DaDataEnum.surname:
        return surname();     
      case DaDataEnum.patronymic:
        return patronymic();     
      case DaDataEnum.all:
        return all();     

    }
  }

  T mapConst<T>({
    required T name,
    required T surname,
    required T patronymic,
    required T all,

  }) {
    switch (this) {
      case DaDataEnum.name:
        return name;     
      case DaDataEnum.surname:
        return surname;     
      case DaDataEnum.patronymic:
        return patronymic;     
      case DaDataEnum.all:
        return all;     

    }
  }

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? name,
    T Function()? surname,
    T Function()? patronymic,
    T Function()? all,

  }) =>
      map<T>(
      name: name ?? orElse,     
      surname: surname ?? orElse,     
      patronymic: patronymic ?? orElse,     
      all: all ?? orElse,     

      );

  T? maybeMapOrNull<T>({
    T Function()? name,
    T Function()? surname,
    T Function()? patronymic,
    T Function()? all,

  }) =>
      maybeMap<T?>(
        orElse: () => null,
        name: name,  
        surname: surname,  
        patronymic: patronymic,  
        all: all,  
        
      );

  @override
  int compareTo(DaDataEnum other) => index.compareTo(other.index);

  @override
  String toString() => value;
   }
