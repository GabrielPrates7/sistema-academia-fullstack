import 'package:flutter/material.dart';

import 'package:app_academia/models/grupo_model.dart';
import 'package:app_academia/services/api_service.dart';

import 'package:app_academia/screens/detalhes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiService apiService;
  late Future<List<Grupo>> _gruposFuture;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    _gruposFuture = apiService.fetchGrupos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                Image.asset(
                  'assets/images/logo_gymtracker.png',
                  height: 50,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GymTracker',
                      style: TextStyle(
                        color: const Color(0xFF00FF88),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    Text(
                      'Seu treino, seu ritmo',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Escolha seu treino',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecione o grupo muscular e comece agora',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder<List<Grupo>>(
                future: _gruposFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xFF00FF88),
                    ));
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Falha ao carregar treinos.\nVerifique a conexão e se a API está rodando.\nErro: ${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    final List<Grupo> grupos = snapshot.data!;

                    return GridView.builder(
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: grupos.length,
                      itemBuilder: (context, index) {
                        final Grupo grupo = grupos[index];
                        return _buildTreinoCard(context, grupo);
                      },
                    );
                  }

                  return const Center(
                      child: Text('Nenhum grupo muscular encontrado.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreinoCard(BuildContext context, Grupo grupo) {
    final Map<String, String> imagens = {
      "Peito": "assets/images/peito.png",
      "Costas": "assets/images/costas.png",
      "Braços": "assets/images/bracos.png",
      "Pernas": "assets/images/pernas.png",
      "Ombro": "assets/images/ombro.png",
    };

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesScreen(
              grupoId: grupo.id,
              grupoNome: grupo.nome,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagens[grupo.nome] ?? 'assets/images/logo_gymtracker.png',
                height: 60,
              ),
              const Spacer(),
              Text(
                grupo.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
