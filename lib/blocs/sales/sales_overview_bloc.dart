import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/blocs/events/sales_events.dart';
import 'package:lojahub/blocs/states/sales_states.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';
import 'package:lojahub/repositories/sales_repository.dart';

class SalesOverviewBloc extends Bloc<SalesEvents, SalesState> {
  final SalesRepository _salesRepository;
  SalesOverviewBloc(this._salesRepository) : super(SalesLoadingState()) {
    on((event, emit) async {
      // Default Loading
      emit(SalesLoadingState());
    });

    on<LoadSalesOverviewEvent>((event, emit) async {
      // Searching Data
      try {
        final UserSalesModel userSales =
            await _salesRepository.getSalesOverview(event.monthReference);
        emit(SalesLoadedState(userSales));
      } catch (e) {
        print("Error ${e.toString()}");
        // Error Validation
        emit(SalesErrorState(e.toString()));
      }
    });
  }
}
