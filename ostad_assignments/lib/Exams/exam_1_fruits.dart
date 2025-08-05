void main() {
  // List of fruits represented as maps
  List<Map<String, dynamic>> fruits = [
    {'name': 'Apple', 'color': 'Red', 'price': 2.5},
    {'name': 'Banana', 'color': 'Yellow', 'price': 1.0},
    {'name': 'Grapes', 'color': 'Purple', 'price': 3.0},
  ];
 
  print('Original Fruit Details before Discount:\n');
  displayFruitDetails(fruits);

  // Apply 10% discount
  applyPriceDiscount(fruits, 10);

  print('\nFruit Details After Applying 10% Discount:\n');
  displayFruitDetails(fruits);
}

// Function to display fruit details
void displayFruitDetails(List<Map<String, dynamic>> fruits) {
  for (var fruit in fruits) {
    print('Name: ${fruit['name']}, Color: ${fruit['color']}, Price: \$${fruit['price']}');
  }
}

// Function to apply discount to each fruit's price
void applyPriceDiscount(List<Map<String, dynamic>> fruits, double discountPercent) {
  for (var fruit in fruits) {
    double originalPrice = fruit['price'];
    double discountAmount = (originalPrice * discountPercent) / 100;
    fruit['price'] = (originalPrice - discountAmount).toStringAsFixed(2);
  }
}
