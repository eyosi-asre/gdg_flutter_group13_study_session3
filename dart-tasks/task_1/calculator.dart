import 'dart:io';
import 'dart:math';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  
  double divide(double a, double b) {
    if (b == 0) {
      throw IntegerDivisionByZeroException();
    }
    return a / b;
  }
  
  double modulus(double a, double b) {
    if (b == 0) {
      throw IntegerDivisionByZeroException();
    }
    return a % b;
  }
  
  double power(double a, double b) => pow(a, b).toDouble();
}

Future<double> calculateResult(double num1, double num2, String operator) async {
  final calc = Calculator();
  
  await Future.delayed(Duration(seconds: 5));
  
  switch (operator) {
    case '+': return calc.add(num1, num2);
    case '-': return calc.subtract(num1, num2);
    case '*': return calc.multiply(num1, num2);
    case '/': return calc.divide(num1, num2);
    case '%': return calc.modulus(num1, num2);
    case '^': return calc.power(num1, num2);
    default: throw FormatException('Invalid operator');
  }
}

void main() async {
  while (true) {
    print('\n=== Simple Calculator ===');
    print('Operations: +, -, *, /, %, ^');
    print('Enter "exit" to quit');
    
    try {
      stdout.write('Enter first number: ');
      stdout.flush();
      String? input1 = stdin.readLineSync();
      if (input1?.toLowerCase() == 'exit') break;
      double num1 = double.parse(input1!);
      
      stdout.write('Enter operator: ');
      stdout.flush();
      String? operator = stdin.readLineSync();
      if (operator?.toLowerCase() == 'exit') break;
      
      if (!['+', '-', '*', '/', '%', '^'].contains(operator)) {
        throw FormatException('Unsupported operator. Use +, -, *, /, %, or ^');
      }
      
      stdout.write('Enter second number: ');
      stdout.flush();
      String? input2 = stdin.readLineSync();
      if (input2?.toLowerCase() == 'exit') break;
      double num2 = double.parse(input2!);
      
      print('Calculating...');
      
      double result = await calculateResult(num1, num2, operator!);
      print('Result: $num1 $operator $num2 = $result');
      
    } on FormatException catch (e) {
      print('Error: ${e.message}');
      print('Please enter valid numbers or a valid operator');
    } on IntegerDivisionByZeroException {
      print('Error: Division by zero is not allowed');
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
    
    stdout.write('\nPress Enter to continue or type "exit" to quit: ');
    stdout.flush();
    String? continueInput = stdin.readLineSync();
    if (continueInput?.toLowerCase() == 'exit') break;
  }
  
  print('Calculator closed. Goodbye!');
}
