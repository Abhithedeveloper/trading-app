import 'package:flutter/material.dart';

typedef TradeCallback = void Function({
  required String symbol,
  required int quantity,
  required double price,
});

class BuySellTicket extends StatefulWidget {
  const BuySellTicket({
    super.key,
    required this.onBuy,
    required this.onSell,
  });

  final TradeCallback onBuy;
  final TradeCallback onSell;

  @override
  State<BuySellTicket> createState() => _BuySellTicketState();
}

class _BuySellTicketState extends State<BuySellTicket> {
  final _symbolController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _symbolController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _buy() {
    final symbol =
        _symbolController.text.trim().toUpperCase();

    final quantity =
        int.tryParse(_quantityController.text.trim());

    final price =
        double.tryParse(_priceController.text.trim());

    if (symbol.isEmpty || quantity == null || price == null) {
      _showError();
      return;
    }

    if (quantity <= 0 || price <= 0) {
      _showError();
      return;
    }

    widget.onBuy(
      symbol: symbol,
      quantity: quantity,
      price: price,
    );

    _clear();
  }

  void _sell() {
    final symbol =
        _symbolController.text.trim().toUpperCase();

    final quantity =
        int.tryParse(_quantityController.text.trim());

    final price =
        double.tryParse(_priceController.text.trim());

    if (symbol.isEmpty || quantity == null || price == null) {
      _showError();
      return;
    }

    if (quantity <= 0 || price <= 0) {
      _showError();
      return;
    }

    widget.onSell(
      symbol: symbol,
      quantity: quantity,
      price: price,
    );

    _clear();
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Enter valid symbol, quantity and price',
        ),
      ),
    );
  }

  void _clear() {
    _quantityController.clear();
    _priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buy / Sell',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _symbolController,
              textCapitalization:
                  TextCapitalization.characters,
              decoration: const InputDecoration(
                labelText: 'Stock Symbol',
                hintText: 'RELIANCE',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    keyboardType:
                        const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
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