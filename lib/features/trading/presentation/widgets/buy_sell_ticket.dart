// import 'package:flutter/material.dart';

// typedef TradeCallback = void Function({
//   required String symbol,
//   required int quantity,
//   required double price,
// });

// class BuySellTicket extends StatefulWidget {
//   const BuySellTicket({
//     super.key,
//     required this.onBuy,
//     required this.onSell,
//   });

//   final TradeCallback onBuy;
//   final TradeCallback onSell;

//   @override
//   State<BuySellTicket> createState() => _BuySellTicketState();
// }

// class _BuySellTicketState extends State<BuySellTicket> {
//   final _symbolController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _priceController = TextEditingController();

//   @override
//   void dispose() {
//     _symbolController.dispose();
//     _quantityController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }

//   void _buy() {
//     final symbol =
//         _symbolController.text.trim().toUpperCase();

//     final quantity =
//         int.tryParse(_quantityController.text.trim());

//     final price =
//         double.tryParse(_priceController.text.trim());

//     if (symbol.isEmpty || quantity == null || price == null) {
//       _showError();
//       return;
//     }

//     if (quantity <= 0 || price <= 0) {
//       _showError();
//       return;
//     }

//     widget.onBuy(
//       symbol: symbol,
//       quantity: quantity,
//       price: price,
//     );

//     _clear();
//   }

//   void _sell() {
//     final symbol =
//         _symbolController.text.trim().toUpperCase();

//     final quantity =
//         int.tryParse(_quantityController.text.trim());

//     final price =
//         double.tryParse(_priceController.text.trim());

//     if (symbol.isEmpty || quantity == null || price == null) {
//       _showError();
//       return;
//     }

//     if (quantity <= 0 || price <= 0) {
//       _showError();
//       return;
//     }

//     widget.onSell(
//       symbol: symbol,
//       quantity: quantity,
//       price: price,
//     );

//     _clear();
//   }

//   void _showError() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text(
//           'Enter valid symbol, quantity and price',
//         ),
//       ),
//     );
//   }

//   void _clear() {
//     _quantityController.clear();
//     _priceController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Buy / Sell',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),

//             TextField(
//               controller: _symbolController,
//               textCapitalization:
//                   TextCapitalization.characters,
//               decoration: const InputDecoration(
//                 labelText: 'Stock Symbol',
//                 hintText: 'RELIANCE',
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _quantityController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Quantity',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: TextField(
//                     controller: _priceController,
//                     keyboardType:
//                         const TextInputType.numberWithOptions(
//                       decimal: true,
//                     ),
//                     decoration: const InputDecoration(
//                       labelText: 'Price',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: _buy,
//                     child: const Text('BUY'),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: _sell,
//                     child: const Text('SELL'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../market_data/domain/entity/market_data_entity.dart';

typedef TradeCallback = void Function({
  required String symbol,
  required int quantity,
  required double price,
});

class BuySellTicket extends StatefulWidget {
  const BuySellTicket({
    super.key,
    required this.marketData,
    required this.onBuy,
    required this.onSell,
  });

  final Map<String, MarketDataEntity> marketData;
  final TradeCallback onBuy;
  final TradeCallback onSell;

  @override
  State<BuySellTicket> createState() => _BuySellTicketState();
}

class _BuySellTicketState extends State<BuySellTicket> {
  final _quantityController = TextEditingController();

  String? _selectedSymbol;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  MarketDataEntity? get _selectedMarketData {
    if (_selectedSymbol == null) {
      return null;
    }

    return widget.marketData[_selectedSymbol];
  }

  void _buy() {
    _trade(widget.onBuy);
  }

  void _sell() {
    _trade(widget.onSell);
  }

  void _trade(TradeCallback callback) {
    final symbol = _selectedSymbol;

    final quantity = int.tryParse(
      _quantityController.text.trim(),
    );

    final marketData = _selectedMarketData;

    if (symbol == null ||
        quantity == null ||
        quantity <= 0 ||
        marketData == null) {
      _showError(
        'Select a stock and enter valid quantity',
      );
      return;
    }

    callback(
      symbol: symbol,
      quantity: quantity,
      price: marketData.ltp,
    );

    _quantityController.clear();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final symbols = widget.marketData.keys.toList()
      ..sort();

    final selectedData = _selectedMarketData;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Buy / Sell',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _selectedSymbol,
              decoration: const InputDecoration(
                labelText: 'Stock',
                border: OutlineInputBorder(),
              ),
              items: symbols.map(
                (symbol) {
                  final data =
                      widget.marketData[symbol]!;

                  return DropdownMenuItem<String>(
                    value: symbol,
                    child: Text(
                      '$symbol  ₹${data.ltp.toStringAsFixed(2)}',
                    ),
                  );
                },
              ).toList(),
              onChanged: (symbol) {
                setState(() {
                  _selectedSymbol = symbol;
                });
              },
            ),

            const SizedBox(height: 12),

            if (selectedData != null)
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8),
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedData.symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'LTP ₹${selectedData.ltp.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${selectedData.change >= 0 ? '+' : ''}'
                      '${selectedData.change.toStringAsFixed(2)} '
                      '(${selectedData.changePercent.toStringAsFixed(2)}%)',
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 12),

            TextField(
              controller: _quantityController,
              keyboardType:
                  TextInputType.number,
              decoration:
                  const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _buy,
                    child: const Text('BUY'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _sell,
                    child: const Text('SELL'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}