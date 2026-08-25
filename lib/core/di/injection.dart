import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trading_app/features/market_data/data/data_source/mock_market_data_source.dart';
import 'package:trading_app/features/market_data/data/repository/market_data_repository_impl.dart';
import 'package:trading_app/features/market_data/domain/repository/market_data_repository.dart';
import 'package:trading_app/features/market_data/domain/usecase/get_market_data.dart';
import 'package:trading_app/features/market_data/presentation/bloc/market_data_bloc.dart';

import '../../features/watchlist/data/datasource/watchlist_local_datasource.dart';
import '../../features/watchlist/data/repository/watchlist_repository_impl.dart';
import '../../features/watchlist/domain/repository/watchlist_repository.dart';
import '../../features/watchlist/domain/usecase/add_stock_to_watchlist.dart';
import '../../features/watchlist/domain/usecase/create_watchlist.dart';
import '../../features/watchlist/domain/usecase/delete_watchlist.dart';
import '../../features/watchlist/domain/usecase/get_watchlists.dart';
import '../../features/watchlist/domain/usecase/remove_stock_from_watchlist.dart';
import '../../features/watchlist/domain/usecase/rename_watchlist.dart';
import '../../features/watchlist/domain/usecase/reorder_watchlist.dart';
import '../../features/watchlist/presentation/bloc/watchlist_bloc.dart';
import '../storage/local_storage.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // SharedPreferences
  final sharedPreferences =
      await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(
    sharedPreferences,
  );

  // Local Storage
getIt.registerLazySingleton<LocalStorage>(
  () => LocalStorage(
    getIt<SharedPreferences>(),
  ),
);
  // =========================
  // Market Data
  // =========================

  // Market Data DataSource
  getIt.registerLazySingleton<MarketDataDataSource>(
    () => MockMarketDataDataSource(),
  );

  // Market Data Repository
  getIt.registerLazySingleton<MarketDataRepository>(
    () => MarketDataRepositoryImpl(
      dataSource: getIt<MarketDataDataSource>(),
    ),
  );

  // Market Data UseCase
  getIt.registerLazySingleton<WatchMarketDataUseCase>(
    () => WatchMarketDataUseCase(
      repository: getIt<MarketDataRepository>(),
    ),
  );

  // Market Data BLoC
 getIt.registerFactory<MarketDataBloc>(
  () => MarketDataBloc(
    watchMarketDataUseCase:
        getIt<WatchMarketDataUseCase>(),
  ),
);
  // Watchlist Local DataSource
  getIt.registerLazySingleton<WatchlistLocalDataSource>(
    () => WatchlistLocalDataSourceImpl(
      localStorage: getIt<LocalStorage>(),
    ),
  );

  // Watchlist Repository
  getIt.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(
      localDataSource: getIt<WatchlistLocalDataSource>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton<GetWatchlists>(
    () => GetWatchlists(
    getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<CreateWatchlist>(
    () => CreateWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<DeleteWatchlist>(
    () => DeleteWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<RenameWatchlist>(
    () => RenameWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<AddStockToWatchlist>(
    () => AddStockToWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<RemoveStockFromWatchlist>(
    () => RemoveStockFromWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  getIt.registerLazySingleton<ReorderWatchlist>(
    () => ReorderWatchlist(
       getIt<WatchlistRepository>(),
    ),
  );

  // Watchlist BLoC
  getIt.registerFactory<WatchlistBloc>(
    () => WatchlistBloc(
      getWatchlists: getIt<GetWatchlists>(),
      createWatchlist: getIt<CreateWatchlist>(),
      deleteWatchlist: getIt<DeleteWatchlist>(),
      renameWatchlist: getIt<RenameWatchlist>(),
      addStockToWatchlist: getIt<AddStockToWatchlist>(),
      removeStockFromWatchlist:
          getIt<RemoveStockFromWatchlist>(),
      reorderWatchlist: getIt<ReorderWatchlist>(),
    ),
  );
}