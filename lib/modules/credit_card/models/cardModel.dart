class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String cvv;
  final String expiryDate;

  CardModel(
      {required this.cardNumber,
      required this.cardHolderName,
      required this.cvv,
      required this.expiryDate});
}
