class User {
  final double money = 11500;
  final double moneyInQueue = 5400;
  final CreditCard creditCard = CreditCard(
    limit: 10000,
    used: 2300.45
  );
}

class CreditCard {
  CreditCard({ required this.limit, required this.used });

  final double limit;
  final double used;
}