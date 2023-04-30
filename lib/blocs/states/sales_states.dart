import 'package:equatable/equatable.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';

abstract class SalesState extends Equatable {}

// DATA LOADING STATE
class SalesLoadingState extends SalesState {
  @override
  List<Object?> get props => [];
}

// DATA LOADED STATE
class SalesLoadedState extends SalesState {
  SalesLoadedState(this.userSales);
  final UserSalesModel userSales;
  @override
  List<Object?> get props => [userSales];
}

// DATA ERROR LOADING STATE
class SalesErrorState extends SalesState {
  SalesErrorState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
