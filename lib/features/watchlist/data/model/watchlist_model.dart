


import 'package:trading_app/features/watchlist/domain/entity/watchlist_entity.dart';

import 'dto/watchlist_dto.dart';

class WatchlistModel {
  const WatchlistModel({
    required this.id,
    required this.name,
    required this.symbols,
  });

  final String id;
  final String name;
  final List<String> symbols;

  factory WatchlistModel.fromDto(WatchlistDto dto) {
    return WatchlistModel(
      id: dto.id,
      name: dto.name,
      symbols: dto.symbols,
    );
  }

  WatchlistEntity toEntity() {
    return WatchlistEntity(
      id: id,
      name: name,
      symbols: symbols,
    );
  }

  WatchlistDto toDto() {
    return WatchlistDto(
      id: id,
      name: name,
      symbols: symbols,
    );
  }
}