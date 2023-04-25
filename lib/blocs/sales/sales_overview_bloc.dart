import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/blocs/events/sales_events.dart';
import 'package:lojahub/blocs/states/sales_states.dart';
import 'package:lojahub/repositories/sales_repository.dart';

class SalesOverviewBloc extends Bloc<SalesEvents, SalesState> {
  final SalesRepository _salesRepository;
  SalesOverviewBloc(this._salesRepository) : super(SalesLoadingState()) {
    on((event, emit) async {
      // Default Loading
      emit(SalesLoadingState());

      // Searching Data
      try {
        final salesOverview = await _salesRepository.getSalesOverview();
        print(salesOverview);
        emit(SalesLoadedState(salesOverview));
      } catch (e) {
        // Error Validation
        emit(SalesErrorState(e.toString()));
      }
    });
  }
}
