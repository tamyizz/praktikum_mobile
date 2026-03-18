void greet(String name) {
  print('Hello, $name!');
}

int add(int a, int b) {
  return a + b;
}

void main() {
  greet('Alice');
  int sum = add(10, 5);
  print('Sum: $sum');
}