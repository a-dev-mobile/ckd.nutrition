extension ValidatorX on String {
  bool maxSymbol(int value) => RegExp('^.{$value,}\$').hasMatch(this);
  bool minSymbol(int value) => RegExp('^.{0,$value}\$').hasMatch(this);
}
