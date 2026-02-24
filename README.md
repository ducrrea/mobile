#AULA DO DIA 27/01

Na aula de hoje, começamos instalando o Git no computador e, em seguida, realizamos a integração do Git com o GitHub, possibilitando o controle e o armazenamento dos projetos online. Utilizamos o Git Bash para executar comandos diretamente no terminal, incluindo comandos para criar pastas de forma prática, sem precisar usar o explorador de arquivos.

Também configuramos o Git usando o comando git config --global, que serve para definir configurações globais do Git no computador, ou seja, essas configurações passam a valer para todos os projetos do usuário. Dentro dessa configuração, utilizamos user.email para informar o e-mail cadastrado no GitHub e user.name para definir o nome de usuário do GitHub, garantindo que todas as alterações feitas nos projetos fiquem corretamente identificadas.

Após isso, instalamos o Visual Studio Code (VS Code) e o conectamos ao GitHub, facilitando o desenvolvimento dos projetos. Por fim, utilizamos a extensão Live Server, que permitiu acompanhar em tempo real as atividades realizadas pelo professor diretamente em nosso computador, tornando o processo de aprendizado mais claro e eficiente.

----------------------------------------------------------------------------------------------

## Introdução ao Desenvolvimento Mobile

### Tipos de Desenvolvimento
- Nativo
    - Android:
        - SDK: Android SDK
        - IDE: Android Studio
        - Linguagens: Kotlin e Java
        - Ambientes: Mac, Win, Linux

    - Ios:
        - SDK: Cocoa Touch
        - IDE: Xcode
        - Linguagens: Swift / Objectype-C
        - Ambientes: Mac

- Multiplataforma
    - React Native:
        - SDK: Node.JS
        - IDE: VSCode
        - Linguagens: JavaScripit / TypeScripit
        - Ambiente: Mac, Win, Linux

    - Flutter:
        - SDK: Flutter SDK
        - IDE: VSCode, Android Studio
        - Linguagens: Dart
        - Ambientes: Mac, Win, Linux


## Preparação do ambiente de desenvolvimento

## Instalação Flutter SDK
- download do arquivo ZIP na página flutter.dev
- inclusão do flutter na pasta C:\src
- inclusão do flutter\bin nas variáveis de ambiente
- teste o flutter --version

### Instalação do AndroidSDK
- download do Android SDK - Command Line Tools
- adicionar o Command-line ao c:\src\AndroidSDK
- adicionar o SDKManager as Variáveis de Ambiente
- download doa pacotes
    - emulador
    - platforms
    - platforms-tools
    - build-tools
- adicionar ADB e o Emulator as Varíaveis de Ambiente
- Criação da imagem do Emulador - via sdkmanager
- Build do Emulador - via sdkmanager

### Criação de Projetos e Códigos da Linha de Comando

- criação de projetos
    - flutter create nome_do_app
        - flags(parâmetros):
            - --empty : Cria um aplicativo "vazio"(hello World!)
            - --platforms : permite a seleção de uma plataforma de desenvolvimento
                - ex: --platforms=android (a criação do projeto será somente para a plataforma android)
    - exemplo de criação de uma aplicativo android vazio
        - flutter create nome_do_app --empty --platforms=android
        - obs: nome do aplicativo: todas as letras minúsculas, separação de palavras com "_";
    - flutter doctor
        - permite correção de pequenos problemas no flutter e identificação dos parâmetros funcionais em relação as plataforma de desenvolvimento
        - sempre rodar o flutter doctor no começo do desenvolvimento
    - flutter clean
        - limpa cache do build(apaga o apk anterior)
    - flutter run -v 
        - build do app (apk)
    