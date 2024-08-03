import 'package:equatable/equatable.dart';
import 'package:my_app_9a/data/models/camion_model.dart';

abstract class CamionState extends Equatable{
  @override
  List<Object> get props => [];
}

class CamionInitial extends CamionState{}

class CamionLoading extends CamionState{}

class CamionSuccess extends CamionState {
  final List<CamionModel> camions;
  CamionSuccess({required this.camions});
  @override
  List<Object> get props => [camions];
}

class CamionError extends CamionState {
  final String message;

  CamionError({required this.message});
  @override
  List<Object> get props => [message];
}
