# Rick And Morty

 Aplicativo desenvolvido em Flutter/Dart como solução para  desafio técnico.
O objetivo do aplicativo é consumir a API pública [Rick and Morty API](https://rickandmortyapi.com/) para:

Consultar e listar personagens da série Rick and Morty

Exibir informações básicas de cada personagem na listagem

Permitir a visualização de uma página de detalhes contendo:

Nome

Status (vivo, morto, desconhecido)

Espécie

O projeto foi desenvolvido com foco em boas práticas de código,arquitetura MVVM,layout responsivo e boa usuabilidade,separação de responsabilidades e consumo de API REST.


#### Imagens do App

<img src="https://github.com/user-attachments/assets/ff75525f-bb55-4527-9caa-d1306d71c614" height="450em" /> 
<img src="https://github.com/user-attachments/assets/958a9256-335d-40af-9e93-63a93330e70e" height="450em" /> 



 ### Estrutura do Projeto
 *  **lib/**/: Possui a pasta app com estrutura base do aplicativo e arquivo main.dart.
 *  **lib/app_widget**/: Classe principal,ponto de entrado do app contendo as configurções do MaterialApp.
 *  **lib/app_module**/: Classe com módulo e rota principal do app.
 *  **lib/app/core**/: Possui classes de acesso global do aplicativo,client http,tema,excessões personaliadas,widget,dto.
 *  **lib/app/modulos**/: Possui a pasta de cada módulo e sua resepectiva classe de módulo,view-model e page.
 *  **lib/app/model**: Possui classes de modelo do app
 *  **lib/app/repository**: Possui classes com lógica para acesso a dados externos.
 *  **lib/app/usecase**: Possui classes com lógica de negócio do app.
   

### Como Rodar 
<p>
 Pra rodar e testar, basta ter o Flutter instalado,clonar ou fazer um fork deste repositório e executar com:
</p>

```
 flutter pub get
 flutter pub run
```

### Funcionalidades do App
---
* Listagem de personagens com seus respectivos nomes e imagens,scroll infinito.
* Exibição de tela de detalhes do personagem,contendo nome,status e espécie.


 ### Tecnologias utilizadas
 ---
 * Flutter modular para injeção de Dependência
 * ChangeNotifier para Gerencimento de estado.
 * Consumo da API Rest com Package [Dio](https://pub.dev/packages/dio/)

  vesão do sdk Flutter  3.27.1
  vesão do sdk Dart  3.6.0
  
  ![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)
  ![Badge em dart](http://img.shields.io/static/v1?label=LENGUAGE&message=%20DART&color=BLUEN&style=for-the-badge)
  ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
  ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

