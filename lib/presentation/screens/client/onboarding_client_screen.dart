import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_9a/presentation/cubit/camion_cubit.dart';
import 'package:my_app_9a/presentation/cubit/camion_state.dart';
import 'package:my_app_9a/presentation/widgets/admin/camion_widget.dart';

class OnboardingClientScreen extends StatefulWidget {
  final String titles;

  const OnboardingClientScreen({Key? key, required this.titles}) : super(key: key);

  @override
  _OnboardingClientScreenState createState() => _OnboardingClientScreenState();
}

class _OnboardingClientScreenState extends State<OnboardingClientScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CamionCubit>().getAllCamions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titles),
      ),
      body: BlocBuilder<CamionCubit, CamionState>(
        builder: (context, state) {
          if (state is CamionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CamionSuccess) {
            if (state.camions.isEmpty) {
              return Center(child: Text('No hay camiones disponibles.'));
            }
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: state.camions.length,
              itemBuilder: (context, index) {
                final camion = state.camions[index];
                return CamionWidget(camion: camion);
              },
            );
          } else if (state is CamionError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No hay datos disponibles.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/formCamion');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
