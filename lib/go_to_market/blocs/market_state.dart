import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object> get props => [];
}

class EmptyState extends MarketState {}

class MarketLoading extends MarketState {}

class MarketError extends MarketState {}

class MarketLoaded extends MarketState {
  final  List<Map> mapList;

  MarketLoaded(this.mapList);

  @override
  List<Object> get props => [mapList];
}
