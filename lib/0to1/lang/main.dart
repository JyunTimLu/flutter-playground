void main() {
  // c2_2_2();

  // c2_2_3();

  c2_2_6();
}

void c2_2_2() {
  print("start ==== c2_2_2 ====");

  var number;
  number = 15;
  print("the number is $number");

  number = '123';
  print(number);

  final c = 30;
  print(c);

  const d = 30;
  print(d);
}

void c2_2_3() {
  print("start ==== c2_2_3 ====");

  num a = 10;
  print(a);
  a = 30.2;
  print(a);
}

void c2_2_6() {
  var a = 15;
  var b = 10;

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);

  print(a.isEven);
  print(a.isOdd);
}
