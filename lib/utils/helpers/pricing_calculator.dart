

class FPricingCalculator
{

  //calculates the total price of a product based on its base price, location
  static double calculateTotalPrice(double productPrice, String location) {

    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //calculate tax amount
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
  return taxAmount.toStringAsFixed(2);
  }



  static double getTaxRateForLocation(String location) {
    //lookup the tax rate of the given location from a database or API
  return 0.07; // Example tax rate, you can implement logic to return different rates based on location
  }

  static double getShippingCost(String location) {
    //lookup the shipping cost for the given location from a database or API
    return 5.99; // Example shipping cost, you can implement logic to return different costs based on location
  }

  //static double calculateCartTotal(Cartmodel cart) {
  //  return cart.items.map((e) => calculateTotalPrice(e.product.price, cart.location)).reduce((a, b) => a + b);
  //}


}