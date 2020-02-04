import 'package:flutter_app/go_to_market/api/repository.dart';
import 'package:flutter_app/go_to_market/blocs/market_event.dart';
import 'package:flutter_app/go_to_market/blocs/market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MarketBloc extends Bloc<MarketEvent, MarketState> {

  final MarketRepo repo;

  MarketBloc(this.repo);

  @override
  MarketState get initialState => EmptyState();

  @override
  Stream<MarketState> mapEventToState(MarketEvent event) async* {
    if (event is FetchMarketEvent) {

      yield MarketLoading();
      try {
        final data = await repo.fetchData();
        yield MarketLoaded(data);
      } catch (_) {
        yield MarketError();
      }
    }
  }


}