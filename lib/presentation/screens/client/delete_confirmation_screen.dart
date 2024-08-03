import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_9a/presentation/cubit/camion_cubit.dart';

class DeleteConfirmationScreen extends StatelessWidget {
  final String model;
  final int? id;

  const DeleteConfirmationScreen({Key? key, required this.model,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmar Eliminación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿Estás seguro de que deseas eliminar el camión "$model"?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para eliminar el camión
                    Navigator.pop(context, true);  // Indica que se ha confirmado la eliminación
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Eliminar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CamionCubit>().deleteCamion(id.toString());
                    Navigator.pop(context, false);  // Indica que se ha cancelado la eliminación
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
