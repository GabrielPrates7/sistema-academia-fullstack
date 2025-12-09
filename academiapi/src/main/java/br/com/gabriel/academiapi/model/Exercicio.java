// Este arquivo fica em: src/main/java/br/com/gabriel/academiapi/model/Exercicio.java

package br.com.gabriel.academiapi.model; // Pacote correto do novo projeto

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity // Esta classe também é uma tabela
@Table(name = "exercicios") // O nome da tabela é 'exercicios'
public class Exercicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nome;

    // --- A Relação (A Mágica) ---
    // @ManyToOne: "Muitos" Exercícios podem pertencer a "Um" Grupo.
    @ManyToOne
    // @JoinColumn: "Qual coluna na tabela 'exercicios' guarda o ID do grupo?"
    @JoinColumn(name = "grupo_id") // Este nome TEM que ser igual ao da sua tabela
    private Grupo grupo;

    // Construtor vazio
    public Exercicio() {
    }

    // --- Getters e Setters ---

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

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }
}