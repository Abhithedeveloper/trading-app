import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trading_event.dart';
part 'trading_state.dart';
part 'trading_bloc.freezed.dart';

class TradingBloc extends Bloc<TradingEvent, TradingState> {
  TradingBloc() : super(_Initial()) {
    on<TradingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
