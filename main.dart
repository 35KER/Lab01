import 'dart:io';

void main() {
  print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD');
  print('Please enter your pizza size (small, medium, or large): ');
  String? size = stdin.readLineSync();

  if (size == null) {
    print('Please enter a valid pizza size.');
    return;
  }

  String pizzaSize = size.toLowerCase().trim();

  if (pizzaSize != 'small' && pizzaSize != 'medium' && pizzaSize != 'large') {
    print('Invalid pizza size. Please enter small, medium, or large.');
    return;
  }

  print('How many pizzas do you want of $pizzaSize?');
  String? quantity = stdin.readLineSync();

  if (quantity == null ||
      int.tryParse(quantity.trim()) == null ||
      int.parse(quantity.trim()) <= 0) {
    print('Please enter a valid quantity.');
    return;
  }

  int qty = int.parse(quantity.trim());

  int? price;
  switch (pizzaSize) {
    case 'small':
      price = 5;
      break;
    case 'medium':
      price = 7;
      break;
    case 'large':
      price = 10;
      break;
  }

  int total = price! * qty;
  print("Your Total Payment is: \$$total");
}
