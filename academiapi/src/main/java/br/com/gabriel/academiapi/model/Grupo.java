// Este arquivo fica em: src/main/java/br/com/gabriel/academiapi/model/Grupo.java

package br.com.gabriel.academiapi.model; // Pacote correto do novo projeto

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity // Diz ao JPA: "Esta classe é um espelho de uma tabela"
@Table(name = "grupos") // Diz: "O nome da tabela no banco é 'grupos'"
public class Grupo {

    @Id // Marca este campo como a Chave Primária (Primary Key)
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Diz ao Postgres para gerar o ID (SERIAL)
    private Integer id;

    private String nome;

    // O JPA precisa de um construtor vazio
    public Grupo() {
    }

    // --- Getters e Setters ---
    // (O JPA usa isso para ler e escrever nos campos)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}