// ignore_for_file: non_constant_identifier_names, avoid-non-null-assertion 
//          --TURN_GEN--
//  *************************************
//           GENERATED CODE 
//  *************************************
  
class Un {


  const Un.data({int i = 10, required double f}):
        _tag = _UnTag.data,
        _i_data = i,
        _f_data = f,
        _i_dadta = null,
        _f_dadta = null,
        _a_load = null,
        _a_load3 = null;
  const Un.dadta({required int i, required double f}):
        _tag = _UnTag.dadta,
        _i_data = null,
        _f_data = null,
        _i_dadta = i,
        _f_dadta = f,
        _a_load = null,
        _a_load3 = null;
  const Un.load({required List<String> a}):
        _tag = _UnTag.load,
        _i_data = null,
        _f_data = null,
        _i_dadta = null,
        _f_dadta = null,
        _a_load = a,
        _a_load3 = null;
  const Un.load3({required String a}):
        _tag = _UnTag.load3,
        _i_data = null,
        _f_data = null,
        _i_dadta = null,
        _f_dadta = null,
        _a_load = null,
        _a_load3 = a;
  const Un.load0():
        _tag = _UnTag.load0,
        _i_data = null,
        _f_data = null,
        _i_dadta = null,
        _f_dadta = null,
        _a_load = null,
        _a_load3 = null;


  T when<T>({
    required T Function (int i, double f) data,
    required T Function (int i, double f) dadta,
    required T Function (List<String> a) load,
    required T Function (String a) load3,
    required T Function () load0,
}) {
    switch (_tag) {
      case _UnTag.data:
        return data(_i_data!, _f_data!);
      case _UnTag.dadta:
        return dadta(_i_dadta!, _f_dadta!);
      case _UnTag.load:
        return load(_a_load!);
      case _UnTag.load3:
        return load3(_a_load3!);
      case _UnTag.load0:
        return load0();
    }
  }


  @override
  String toString() {
    switch (_tag) {

      case _UnTag.data:
        return 'Un.data(i: $_i_data, f: $_f_data)';
      case _UnTag.dadta:
        return 'Un.dadta(i: $_i_dadta, f: $_f_dadta)';
      case _UnTag.load:
        return 'Un.load(a: $_a_load)';
      case _UnTag.load3:
        return 'Un.load3(a: $_a_load3)';
      case _UnTag.load0:
        return 'Un.load0()';  
  }
}

  final _UnTag _tag;
  final int? _i_data;
  final double? _f_data;
  final int? _i_dadta;
  final double? _f_dadta;
  final List<String>? _a_load;
  final String? _a_load3;


}

enum _UnTag {
  data,
  dadta,
  load,
  load3,
  load0,



}
 
