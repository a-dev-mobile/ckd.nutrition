extension ValidatorX on String {
  bool validName() => RegExp('n').hasMatch(this);
  bool maxSymbol(int value) => RegExp('^.{$value,}\$').hasMatch(this);
}
