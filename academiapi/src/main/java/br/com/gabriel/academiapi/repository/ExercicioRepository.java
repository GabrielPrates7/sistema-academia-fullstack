package br.com.gabriel.academiapi.repository;

import br.com.gabriel.academiapi.model.Exercicio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExercicioRepository extends JpaRepository<Exercicio, Integer> {
    List<Exercicio> findByGrupoId(Integer grupoId);
}