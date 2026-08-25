import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../market_data/presentation/bloc/market_data_bloc.dart'
    as market;
import '../bloc/trading_bloc.dart' as trading;
import '../widgets/buy_sell_ticket.dart';
import '../widgets/holdings_list.dart';

class TradingPage extends StatelessWidget {
  const TradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<market.MarketDataBloc>(
          create: (_) => getIt<market.MarketDataBloc>()
            ..add(
              const market.MarketDataEvent.started(),
            ),
        ),
        BlocProvider<trading.TradingBloc>(
          create: (_) => getIt<trading.TradingBloc>()
            ..add(
              const trading.TradingEvent.started(),
            ),
        ),
      ],
      child: const _TradingView(),
    );
  }
}

class _TradingView extends StatelessWidget {
  const _TradingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading'),
      ),
      body: BlocListener<
          trading.TradingBloc,
          trading.TradingState>(
        listener: (context, state) {
          switch (state) {
            case trading.Loaded(:final message):
              if (message != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
              }

            case trading.Error(:final message):
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );

            default:
              break;
          }
        },
        child: BlocBuilder<
            market.MarketDataBloc,
            market.MarketDataState>(
          builder: (context, marketState) {
            return switch (marketState) {
              market.Initial() => const Center(
                  child: Text(
                    'Starting market data...',
                  ),
                ),

              market.Loading() => const Center(
                  child: CircularProgressIndicator(),
                ),

              market.Error(:final message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              market.Loaded(:final marketData) =>
                BlocBuilder<
                    trading.TradingBloc,
                    trading.TradingState>(
                  builder: (context, tradingState) {
                    return switch (tradingState) {
                      trading.Initial() => const Center(
                          child: CircularProgressIndicator(),
                        ),

                      trading.Loading() => const Center(
                          child: CircularProgressIndicator(),
                        ),

                      // Initial holdings load fail hua hai.
                      // Transaction error ke liye ye state use nahi hogi.
                      trading.Error(:final message) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                      trading.Loaded(
                        :final holdings,
                      ) =>
                        Column(
                          children: [
                            BuySellTicket(
                              marketData: marketData,
                              onBuy: ({
                                required symbol,
                                required quantity,
                                required price,
                              }) {
                                context
                                    .read<trading.TradingBloc>()
                                    .add(
                                      trading.TradingEvent.buy(
                                        symbol: symbol,
                                        quantity: quantity,
                                        price: price,
                                      ),
                                    );
                              },
                              onSell: ({
                                required symbol,
                                required quantity,
                                required price,
                              }) {
                                context
                                    .read<trading.TradingBloc>()
                                    .add(
                                      trading.TradingEvent.sell(
                                        symbol: symbol,
                                        quantity: quantity,
                                        price: price,
                                      ),
                                    );
                              },
                            ),
                            Expanded(
                              child: HoldingsList(
                                holdings: holdings,
                              ),
                            ),
                          ],
                        ),
                    };
                  },
                ),
            };
          },
        ),
      ),
    );
  }
}