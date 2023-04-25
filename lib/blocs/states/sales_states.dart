import 'package:equatable/equatable.dart';
import 'package:lojahub/models/sales/SalesOverviewModel.dart';

abstract class SalesState extends Equatable {}

// DATA LOADING STATE
class SalesLoadingState extends SalesState {
  @override
  List<Object?> get props => [];
}

// DATA LOADED STATE
class SalesLoadedState extends SalesState {
  SalesLoadedState(this.salesOverview);
  final SalesOverviewModel salesOverview;
  @override
  List<Object?> get props => [salesOverview];
}

// DATA ERROR LOADING STATE
class SalesErrorState extends SalesState {
  SalesErrorState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
