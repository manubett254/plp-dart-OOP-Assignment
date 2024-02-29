import 'dart:io';
import 'userInput.dart'; // user defined function to get user inputs

void main() {
  type();
}

// Method to read the nationality from a file
String? Nationality() {
  File file = File("Nationality.txt");
  String? read = file.readAsStringSync();
  return read;
}

// Method to prompt the user to choose an age group and display corresponding information
void type() {
  stdout.write("Choose your age group:\n1. Adult\n2. Child\nEnter your choice: ");
  var choice = int.tryParse(stdin.readLineSync() ?? '');

  switch (choice) {
    case 1:
      var adult = Adult();
      adult.readInfo(); // Read information specific to adults
      adult.printInfo(); // Print adult-specific information
      break;
    case 2:
      var child = Child();
      child.readInfo(); // Read information specific to children
      child.printInfo(); // Print child-specific information
      break;
    default:
      print("Please choose a correct option.");
      type(); // Recursive call to handle incorrect input
  }
}

// An object-oriented model that uses classes and inheritance
abstract class Citizen {
  String? name;
  int? age;
  
  String? nationality = Nationality(); // Using a method to retrieve nationality from a file

  // Constructor
  Citizen();

  // Method to read common information (name and age)
  void readInfo() {
    stdout.write("Enter your name: ");
    name = get_String();
    stdout.write("Enter your age: ");
    age = get_int();
  }

  // Method to print common information (nationality, name, and age)
  void printInfo() {
    print("Nationality: $nationality");
    print("Name: $name");
    print("Age: $age");
  }
}

// Class representing adults, inheriting from Citizen
class Adult extends Citizen {
  int? idNum;

  // Overridden method to read additional information for adults
  @override
  void readInfo() {
    super.readInfo(); // Call the parent method to read common information
    stdout.write("Enter your ID number: ");
    idNum = get_int();
  }

  // Overridden method to print adult-specific information
  @override
  void printInfo() {
    super.printInfo(); // Call the parent method to print common information
    print("ID number: $idNum");
  }
}

// Class representing children, inheriting from Citizen
class Child extends Citizen {
  int? birthCert;

  // Overridden method to read additional information for children
  @override
  void readInfo() {
    super.readInfo(); // Call the parent method to read common information
    stdout.write("Enter your birth certificate number: ");
    birthCert = get_int();
  }

  // Overridden method to print child-specific information
  @override
  void printInfo() {
    super.printInfo(); // Call the parent method to print common information
    print("Birth Certificate: $birthCert");
  }
}
