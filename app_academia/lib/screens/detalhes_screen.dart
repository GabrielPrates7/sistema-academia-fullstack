import 'package:flutter/material.dart';

import 'package:app_academia/services/api_service.dart';
import 'package:app_academia/models/exercicio_model.dart';

class DetalhesScreen extends StatefulWidget {
  final int grupoId;
  final String grupoNome;

  const DetalhesScreen({
    super.key,
    required this.grupoId,
    required this.grupoNome,
  });

  @override
  State<DetalhesScreen> createState() => _DetalhesScreenState();
}

class _DetalhesScreenState extends State<DetalhesScreen> {
  bool _treinoIniciado = false;

  late final ApiService apiService;
  late Future<List<Exercicio>> _exerciciosFuture;

  final Set<int> _exerciciosConcluidos = {};

  @override
  void initState() {
    super.initState();

    apiService = ApiService();

    _exerciciosFuture = apiService.fetchExercicios(widget.grupoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.grupoNome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<Exercicio>>(
                future: _exerciciosFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Falha ao carregar exercícios.\nErro: ${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum exercício encontrado.'));
                  }

                  final List<Exercicio> exercicios = snapshot.data!;
                  final int contagemExercicios = exercicios.length;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Subtítulos
                      const Text(
                        'Exercícios do Treino',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$contagemExercicios exercícios • Execute cada um com qualidade',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Expanded(
                        child: ListView.builder(
                          itemCount: contagemExercicios,
                          itemBuilder: (context, index) {
                            final exercicio = exercicios[index];

                            final bool isChecked =
                                _exerciciosConcluidos.contains(exercicio.id);

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (isChecked) {
                                    _exerciciosConcluidos.remove(exercicio.id);
                                  } else {
                                    _exerciciosConcluidos.add(exercicio.id);
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2C2C2E),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green[700],
                                      radius: 14,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        exercicio.nome,
                                        style: TextStyle(
                                          color: isChecked
                                              ? Colors.grey
                                              : Colors.white,
                                          fontSize: 16,
                                          decoration: isChecked
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      isChecked
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      color: isChecked
                                          ? Colors.green[700]
                                          : Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          icon: Icon(
            _treinoIniciado ? Icons.stop_circle_outlined : Icons.play_arrow,
            color: Colors.black87,
          ),
          label: Text(
            _treinoIniciado ? 'Finalizar Treino' : 'Iniciar Treino',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00FF88),
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            setState(() {
              _treinoIniciado = !_treinoIniciado;
            });

            if (_treinoIniciado == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bom trabalho! Treino Concluído!'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
