// Este arquivo fica em: src/main/java/br/com/gabriel/academiapi/repository/GrupoRepository.java

package br.com.gabriel.academiapi.repository; // Pacote correto

import br.com.gabriel.academiapi.model.Grupo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Boa prática para indicar que é um Repositório
public interface GrupoRepository extends JpaRepository<Grupo, Integer> {
    // <Grupo, Integer> significa:
    // "Este repositório gerencia a Entidade 'Grupo'
    // e o tipo da Chave Primária (ID) é 'Integer'".

    // Ao estender JpaRepository, ganhamos de graça métodos como:
    // - findAll() (busca todos)
    // - findById(Integer id) (busca por ID)
    // - save(Grupo grupo) (salva ou atualiza)
    // - deleteById(Integer id) (deleta)
}