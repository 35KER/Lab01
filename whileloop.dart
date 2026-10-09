import 'dart:io';

// Pizza Order Calculator improved with while loop, input validation, and continuous ordering
void main() {
  print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large:10 USD"');
  String? pizzaSize, quantity, size;
  int subtotal = 0;
  while (true) {
    print('Please enter your pizza size(small, medium, or large):');

    while (true) {
      size = stdin.readLineSync();
      if (size == '') {
        continue;
      }

      pizzaSize = size!.toLowerCase().trim();
      if (pizzaSize != 'small' &&
          pizzaSize != 'medium' &&
          pizzaSize != 'large') {
        print('!!! Invalid pizza size. Please enter small, medium, or large.');
        continue;
      }
      break;
    }

    print('How many pizzas do you want of $pizzaSize?');

    while (true) {
      quantity = stdin.readLineSync();
      if (quantity == '') {
        continue;
      }

      if (int.tryParse(quantity!.trim()) == null) {
        print('!!! Please enter a valid quantity.');
        continue;
      }

      int qty = int.parse(quantity.trim());
      if (qty <= 0) {
        print('!!! Please enter a valid quantity.');
        continue;
      }

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
      subtotal += total;
      break;
    }

    String? again;
    while (true) {
      print('Do you want to order another pizza? (yes/no)');
      again = stdin.readLineSync();

      if (again == '') {
        continue;
      }
      if (again!.toLowerCase().trim() == 'yes' || again.toLowerCase().trim() == 'y') {
        break;
      } 
      else if (again.toLowerCase().trim() == 'no' || again.toLowerCase().trim() == 'n') {
        print("Your Total Payment is: \$$subtotal");
        return;
      } 
      else {
        print('!!! Please enter yes or no.');
      }
    }
  }
}
