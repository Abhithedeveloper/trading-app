import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../bloc/trading_bloc.dart';
import '../widgets/buy_sell_ticket.dart';
import '../widgets/holdings_list.dart';

class TradingPage extends StatelessWidget {
  const TradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TradingBloc>()
        ..add(
          const TradingEvent.started(),
        ),
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
      body: BlocBuilder<TradingBloc, TradingState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(
                child: CircularProgressIndicator(),
              ),

            Loading() => const Center(
                child: CircularProgressIndicator(),
              ),

            Loaded(:final holdings) => Column(
                children: [
                  BuySellTicket(
                    onBuy: ({
                      required symbol,
                      required quantity,
                      required price,
                    }) {
                      context.read<TradingBloc>().add(
                            TradingEvent.buy(
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
                      context.read<TradingBloc>().add(
                            TradingEvent.sell(
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

            Error(:final message) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}