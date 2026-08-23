import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/market_data_bloc.dart';
import '../widgets/market_data_list.dart';

class MarketDataPage extends StatelessWidget {
  const MarketDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Data'),
      ),
      body: BlocBuilder<MarketDataBloc, MarketDataState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(
                child: Text('Starting market data...'),
              ),
            Loading() => const Center(
                child: CircularProgressIndicator(),
              ),
            Loaded(:final marketData) => MarketDataList(
                marketData: marketData,
              ),
            Error(:final message) => Center(
                child: Text(message),
              ),
          };
        },
      ),
    );
  }
}