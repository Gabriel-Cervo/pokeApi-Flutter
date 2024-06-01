# PokeApi

## Visão Geral

O presente aplicativo é o resultado de um desafio técnico para a Versotech, e contava com os seguintes requisitos:
- O app deve consumir a seguinte API: https://pokeapi.co
- O app deve conter duas telas (tela inicial e detalhes do Pokemon)
- Na primeira tela, exibir uma lista do Pokemons disponíveis na API, mostrando nome e imagem de cada um. Ao tocar em um item, navegar para a segunda tela.
- Na segunda tela, deve ser exibido as informações detalhadas do Pokemon selecionado (nome, altura, peso, habilidades...).

O projeto também contava com os seguintes requisitos adicionais:
- As requisições à API devem ser feitas de forma assíncrona para evitar bloqueios na interface do usuário.
- Tratamento de erros, como falhas na conexão com a API ou respostas inválidas.
- O aplicativo deve utilizar gerenciamento de estado MobX.

## Tecnologias Utilizadas

Para este projeto foi utilizado o framework Flutter com a linguagem Dart.

### Dependências

O projeto conta com as seguintes dependências em seu 'pubspec.yaml':
- json_annotation
- dio 
- mobx
- flutter_mobx
- mobx_codegen
- dartz
- logging
- get_it
- flutter_launcher_icons
- cached_network_image
- flutter_animate

## Arquitetura

O projeto conta com a arquitetura MVVM (Model-View-ViewModel) e segue os conceitos da Clean Architecture, realizando a separação em camadas. A arquitetura implementada permite de modo fácil retirar, atualizar ou inserir novas funcionalidades com bastante facilidade e manutenabilidade, permitindo que o app escale caso necessário.

## Execução

Para executar o app é necessário ter instalado o Flutter 3 e um emulador de mobile (iOS ou Android) a sua escolha.

Para rodar, basta abrir a pasta do projeto e executar os seguintes comandos:

- Instalação das dependências:
```
flutter pub get
```

- Abrir simulador de iOS:
```
open -a simulator 
```

- Executar o app no simulador aberto:
```
flutter run -d iph 
```

Também é possivel executar o app através de plugins em certos editores (como vscode) ou utilizando um simulador de Android no lugar. Para isso, é necessário ter o Android Studio instalado com um emulador de Android, e executar os seguintes comandos:

- Ver a lista de emuladores disponíveis:
```
flutter emulators
```

- Executar o emulador:
```
flutter emulators --launch [NOME_DO_EMULADOR_AQUI]
```


- Executar o app:
```
flutter run -d [ID_DO_EMULADOR]
```
