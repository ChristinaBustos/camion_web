import 'package:bloc/bloc.dart';
import 'package:my_app_9a/data/models/camion_model.dart';
import 'package:my_app_9a/data/repository/camion_repository.dart';
import 'package:my_app_9a/presentation/cubit/camion_state.dart';


class CamionCubit extends Cubit<CamionState> {
  final CamionRepository camionRepository;

  CamionCubit({required this.camionRepository}) : super(CamionInitial());

  Future<void> createCamion(CamionModel camion) async {
    try {
      emit(CamionLoading());
      await camionRepository.createCamion(camion);
      final camiones = await  camionRepository.getallCamiones();
      emit(CamionSuccess(camions: camiones));
    } catch (e) {
      emit(CamionError(message: e.toString()));
    }
  }

  Future<void> updateCamion(CamionModel camion) async {
    try {
      emit(CamionLoading());
      await camionRepository.updateCamion(camion);
      final camiones = await  camionRepository.getallCamiones();
      emit(CamionSuccess(camions: camiones));
    } catch (e) {
      emit(CamionError(message: e.toString()));
    }
  }

  Future<void> deleteCamion(String id) async {
    try {
      emit(CamionLoading());
      await camionRepository.deleteCamion(id);
      final camiones = await  camionRepository.getallCamiones();
      emit(CamionSuccess(camions: camiones));
    } catch (e) {
      emit(CamionError(message: e.toString()));
    }
  }

  Future<void> getAllCamions() async {
    try {
      emit(CamionLoading());
      final camiones = await camionRepository.getallCamiones();
      emit(CamionSuccess(camions: camiones));
    } catch (e) {
      emit(CamionError(message: e.toString()));
    }
  }
}