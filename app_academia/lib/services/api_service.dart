import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_academia/models/grupo_model.dart';
import 'package:app_academia/models/exercicio_model.dart';

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<Grupo>> fetchGrupos() async {
    final url = Uri.parse('$_baseUrl/grupos');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final String body = response.body;

        final List<dynamic> jsonList = jsonDecode(body);

        final List<Grupo> grupos =
            jsonList.map((jsonItem) => Grupo.fromJson(jsonItem)).toList();

        return grupos;
      } else {
        throw Exception(
            'Falha ao carregar os grupos. Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  Future<List<Exercicio>> fetchExercicios(int grupoId) async {
    final url = Uri.parse('$_baseUrl/exercicios/$grupoId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final String body = response.body;

        final List<dynamic> jsonList = jsonDecode(body);

        final List<Exercicio> exercicios =
            jsonList.map((jsonItem) => Exercicio.fromJson(jsonItem)).toList();

        return exercicios;
      } else {
        throw Exception(
            'Falha ao carregar os exercícios. Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
