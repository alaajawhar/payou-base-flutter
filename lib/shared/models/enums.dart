enum Currency {
  usd(label: 'Main', symbol: '\$'),
  lbp(label: 'Loan', symbol: '\$'),
  saving(label: 'Saving', symbol: '\$');

  const Currency({
    required this.label,
    required this.symbol,
  });

  final String label;
  final String symbol;
}