import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_9a/data/models/camion_model.dart';
import 'package:my_app_9a/presentation/cubit/camion_cubit.dart';


class EditCamionScreen extends StatefulWidget {
  final CamionModel camion;

  const EditCamionScreen({Key? key, required this.camion}) : super(key: key);

  @override
  _EditCamionScreenState createState() => _EditCamionScreenState();
}

class _EditCamionScreenState extends State<EditCamionScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _branchController;
  late TextEditingController _capacityLoadController;
  late TextEditingController _modelController;
  late TextEditingController _fuelTypeController;

  @override
  void initState() {
    super.initState();
    _branchController = TextEditingController(text: widget.camion.branch);
    _capacityLoadController = TextEditingController(text: widget.camion.capacity_load);
    _modelController = TextEditingController(text: widget.camion.model);
    _fuelTypeController = TextEditingController(text: widget.camion.fuel_type);
  }

  @override
  void dispose() {
    _branchController.dispose();
    _capacityLoadController.dispose();
    _modelController.dispose();
    _fuelTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Camión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _branchController,
                decoration: InputDecoration(labelText: 'Sucursal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la sucursal';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacityLoadController,
                decoration: InputDecoration(labelText: 'Capacidad de Carga'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la capacidad de carga';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el modelo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fuelTypeController,
                decoration: InputDecoration(labelText: 'Tipo de Combustible'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el tipo de combustible';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final camionCubit = context.read<CamionCubit>();
                    final camion = CamionModel(
                      id: widget.camion?.id,
                      branch: _branchController.text,
                      capacity_load: _capacityLoadController.text,
                      model: _modelController.text,
                      fuel_type: _fuelTypeController.text,
                    );
                    if (widget.camion == null) {
                      camionCubit.createCamion(camion);
                    } else {
                      camionCubit.updateCamion(camion);
                    }


                    Navigator.pop(context, camion);
                  }
                },
                child: Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
