class TickerDto {
  final String id;
  final String symbol;
  final String price;

  const TickerDto({
    required this.id,
    required this.symbol,
    required this.price,
  });

  factory TickerDto.fromJson(Map<String, dynamic> json) {
    return TickerDto(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      price: json['priceUsd'] as String,
    );
  }
}
