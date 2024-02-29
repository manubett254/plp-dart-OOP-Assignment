import 'dart:io';

String? get_String() {
  String? name = stdin.readLineSync();
  return name;
}

int? get_int() {
  String? read = stdin.readLineSync();
  if (read != null) {
    int? age = int.tryParse(read);
    return age;
  }
  return null;
}

double? get_double() {
  String? read = stdin.readLineSync();
  if (read != null) {
    double? value = double.tryParse(read);
    return value;
  }
  return null;
}
