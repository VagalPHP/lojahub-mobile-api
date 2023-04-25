import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SalesEvents extends Equatable {
  const SalesEvents();
}

class LoadSalesOverviewEvent extends SalesEvents {
  @override
  List<Object?> get props => [];
}
