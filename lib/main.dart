import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_9a/data/models/camion_model.dart';
import 'package:my_app_9a/data/repository/camion_repository.dart';
import 'package:my_app_9a/presentation/cubit/camion_cubit.dart';
import 'package:my_app_9a/presentation/screens/client/delete_confirmation_screen.dart';
import 'package:my_app_9a/presentation/screens/client/edit_camion_screen.dart';
import 'package:my_app_9a/presentation/screens/client/form_camion_screen.dart';
import 'package:my_app_9a/presentation/screens/client/onboarding_client_screen.dart';

void main() {
  final CamionRepository camionRepository = CamionRepository(apiUrl: 'https://xpejmaey0c.execute-api.us-west-1.amazonaws.com/Dev');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CamionCubit(camionRepository: camionRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camión',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingClientScreen(titles: "CRUD Camión"),
      routes: {
        '/formCamion': (context) => FormCamionScreen(),
        '/deleteConfirmation': (context) => DeleteConfirmationScreen(model: 'Default Model',id:0),  // Esto es solo un placeholder
        '/editCamion': (context) => EditCamionScreen(camion: CamionModel(id: 0, branch: 'Default', capacity_load: 'Default', model: 'Default', fuel_type: 'Default')),  // Esto es solo un placeholder
      },
    );
  }
}
