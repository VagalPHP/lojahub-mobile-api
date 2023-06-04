import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SalesEvents extends Equatable {
  const SalesEvents();
}

class LoadSalesOverviewEvent extends SalesEvents {
  const LoadSalesOverviewEvent({required this.monthReference});

  final int? monthReference;

  @override
  List<Object?> get props => [monthReference];
}
