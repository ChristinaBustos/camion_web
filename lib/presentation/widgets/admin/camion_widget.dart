import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_9a/presentation/cubit/camion_cubit.dart';
import 'package:my_app_9a/presentation/screens/client/delete_confirmation_screen.dart';
import 'package:my_app_9a/data/models/camion_model.dart';
import 'package:my_app_9a/presentation/screens/client/edit_camion_screen.dart';

class CamionWidget extends StatelessWidget {
  final CamionModel camion;

  const CamionWidget({required this.camion});

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteConfirmationScreen(model: camion.model,id:camion.id),
      ),
    );

    if (confirmed) {
      context.read<CamionCubit>().deleteCamion(camion.id.toString());
    }
  }

  Future<void> _editCamion(BuildContext context) async {
    final updatedCamion = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCamionScreen(camion: camion),
      ),
    );

    if (updatedCamion != null && updatedCamion is CamionModel) {
      context.read<CamionCubit>().updateCamion(updatedCamion);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.car_repair, size: 50),
            title: Text(camion.model, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(camion.branch),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Capacidad de carga: ${camion.capacity_load}"),
                SizedBox(height: 2.0),
                Text("Tipo de combustible: ${camion.fuel_type}"),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.yellow,
                ),
                onPressed: () => _editCamion(context),
                child: Text('Editar'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () => _confirmDelete(context),
                child: Text('Eliminar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
