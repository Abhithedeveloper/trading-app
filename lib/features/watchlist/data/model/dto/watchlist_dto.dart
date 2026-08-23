class WatchlistDto {
  const WatchlistDto({
    required this.id,
    required this.name,
    required this.symbols,
  });

  final String id;
  final String name;
  final List<String> symbols;

  factory WatchlistDto.fromJson(Map<String, dynamic> json) {
    return WatchlistDto(
      id: json['id'] as String,
      name: json['name'] as String,
      symbols: List<String>.from(json['symbols'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbols': symbols,
    };
  }
}