package br.com.gabriel.academiapi.controller;

import br.com.gabriel.academiapi.model.Exercicio;
import br.com.gabriel.academiapi.model.Grupo;
import br.com.gabriel.academiapi.repository.ExercicioRepository;
import br.com.gabriel.academiapi.repository.GrupoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TreinoController {

    @Autowired
    private GrupoRepository grupoRepository;

    @Autowired
    private ExercicioRepository exercicioRepository;

    @GetMapping("/grupos")
    public List<Grupo> listarGrupos() {
        return grupoRepository.findAll();
    }

    @GetMapping("/exercicios/{grupoId}")
    public List<Exercicio> listarExerciciosPorGrupo(@PathVariable Integer grupoId) {
        return exercicioRepository.findByGrupoId(grupoId);
    }
}