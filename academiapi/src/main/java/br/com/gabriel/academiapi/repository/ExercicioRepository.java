// Este arquivo fica em: src/main/java/br/com/gabriel/academiapi/repository/ExercicioRepository.java

package br.com.gabriel.academiapi.repository; // Pacote correto

import br.com.gabriel.academiapi.model.Exercicio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExercicioRepository extends JpaRepository<Exercicio, Integer> {
    // Gerencia a Entidade 'Exercicio', cuja chave primária (ID) é 'Integer'.

    // --- A MÁGICA CUSTOMIZADA (Query Method) ---
    //
    // Precisamos de um método para "Buscar todos os exercícios de um grupo específico".
    // O Spring Data JPA escreve o SQL para nós se seguirmos a regra de nomenclatura:
    //
    // "findByGrupoId" é traduzido automaticamente para:
    // "SELECT * FROM exercicios WHERE grupo_id = ?"
    //
    List<Exercicio> findByGrupoId(Integer grupoId);
}