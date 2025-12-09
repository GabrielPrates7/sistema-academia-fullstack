// Este arquivo fica em: src/main/java/br/com/gabriel/academiapi/controller/TreinoController.java

package br.com.gabriel.academiapi.controller; // Pacote correto

// Importa nossos modelos e repositórios
import br.com.gabriel.academiapi.model.Exercicio;
import br.com.gabriel.academiapi.model.Grupo;
import br.com.gabriel.academiapi.repository.ExercicioRepository;
import br.com.gabriel.academiapi.repository.GrupoRepository;

// Importa as ferramentas do Spring Web
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController // Diz ao Spring: "Esta classe é uma API REST"
@RequestMapping("/api") // Define a URL base para todos os métodos (ex: http://localhost:8080/api)
public class TreinoController {

    // --- Injeção de Dependência ---
    // Pedimos ao Spring para "injetar" (nos dar uma instância)
    // dos repositórios que criamos.

    @Autowired
    private GrupoRepository grupoRepository;

    @Autowired
    private ExercicioRepository exercicioRepository;


    // --- ENDPOINT 1: Listar todos os Grupos Musculares ---
    //
    // @GetMapping("/grupos"): Mapeia este método para requisições GET
    // na URL: /api/grupos
    //
    @GetMapping("/grupos")
    public List<Grupo> listarGrupos() {
        // Usa o repositório para buscar TODOS os grupos no banco.
        // O Spring vai converter essa "List<Grupo>" em JSON automaticamente!
        return grupoRepository.findAll();
    }


    // --- ENDPOINT 2: Listar Exercícios por ID do Grupo ---
    //
    // @GetMapping("/exercicios/{grupoId}"): Mapeia para requisições GET
    // na URL: /api/exercicios/1 (para Peito), /api/exercicios/2 (para Costas), etc.
    //
    @GetMapping("/exercicios/{grupoId}")
    public List<Exercicio> listarExerciciosPorGrupo(@PathVariable Integer grupoId) {
        // @PathVariable "pega" o número da URL (ex: 2) e o coloca na variável "grupoId".

        // Usa o método customizado que criamos no ExercicioRepository.
        // O Spring também converte isso em JSON automaticamente.
        return exercicioRepository.findByGrupoId(grupoId);
    }
}