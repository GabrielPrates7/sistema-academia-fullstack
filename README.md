# 🏋️ GymTracker - App de Treino (Fullstack)

> Projeto acadêmico desenvolvido no 6º período de Ciência da Computação (Matéria: Programação para Dispositivos Móveis). O objetivo foi integrar um aplicativo Flutter a uma API Java Spring Boot.

O sistema é focado na experiência do usuário, permitindo escolher um grupo muscular e simular a execução de um treino completo com feedback visual.

## 📱 Telas e Fluxo do App

O aplicativo conta com **2 telas principais** projetadas para serem simples e diretas:

1.  **Home (Tela Inicial):**
    * Menu visual com Cards para escolha do grupo muscular:
    * 💪 Peito, Costas, Pernas, Braços e Ombro.
2.  **Tela de Exercícios:**
    * Lista os 5 exercícios cadastrados para aquele grupo.
    * Botão **"Iniciar Treino"**: Começa a contagem/sessão.
    * Botão **"Finalizar"**: Encerra o treino.
    * **Feedback:** Ao terminar, uma mensagem de *"Parabéns por ter concluído"* é exibida e o app retorna à tela inicial.

---

## 🛠️ Tecnologias

* **Mobile:** Flutter (Dart) - VS Code
* **Backend:** Spring Boot (Java) - IntelliJ IDEA
* **Banco de Dados:** PostgreSQL (PgAdmin 4)

## 🚀 Como testar (Passo a Passo)

### 1. Backend (API)
* Abra a pasta `academiapi` no IntelliJ.
* Crie um banco de dados vazio no PgAdmin.
* **Importe/Restaure o arquivo `backup_academia.sql` (que está na raiz do projeto) para criar as tabelas e exercícios.** * Dê o **Run** na aplicação Spring Boot.

### 2. Mobile (App)
* Com a API rodando, abra a pasta `app_academia` no VS Code.
* Abra um emulador ou conecte seu celular.
* Rode o comando: `flutter run`.
* *Nota:* O app consome os dados da API para listar os exercícios.

---

## 👨‍💻 Autor
**Gabriel Diniz Prates**
* Ciência da Computação - Centro Unifor-MG
