import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app_9a/data/models/camion_model.dart';

class CamionRepository {
  final String apiUrl;

  CamionRepository({
    required this.apiUrl,
  });

  Future<void> createCamion(CamionModel camion) async {
    final response = await http.post(
      Uri.parse('$apiUrl/create-camion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(camion.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al crear patinete.');
    }
  }

  Future<CamionModel> getOneCamion(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/get_one_camion/$id'),
      headers: <String, String>{},
    );

    if (response.statusCode == 200) {
      return CamionModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Error al cargar patinete.');
    }
  }

  Future<void> updateCamion(CamionModel camion) async {
    final response = await http.put(
      Uri.parse('$apiUrl/put-camion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(camion.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar patinete.');
    }
  }

  Future<void> deleteCamion(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete_camion/$id'),
      headers: <String, String>{
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar patinete.');
    }
  }

  Future<List<CamionModel>> getallCamiones() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get-camion'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body)['data'];
      return List<CamionModel>.from(
          l.map((model) => CamionModel.fromJson(model)));
    } else {
      throw Exception('Error al cargar patinetes.');
    }
  }
}