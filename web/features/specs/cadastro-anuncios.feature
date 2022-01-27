#language: pt

Funcionalidade: Cadastro de anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizá-los para locação

    Contexto: Login
        * Login com "karina@gmail.com" e "pwd123"

    @anuncio
    Cenario: Novo equipo
        Dado que acesso o formulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @tentativa_anuncio
    Esquema do Cenario: Tentativa de cadastro de anúncios
        Dado que acesso o formulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento:
            | thumb     | <thumb>     |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta "<mensagem_output>"

        Exemplos:
            | thumb         | nome             | categoria | preco | mensagem_output                      |
            |               | Violão de Nylon  | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                  | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure  |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trmpete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga            | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga            | Outros    | 100a  | O valor da diária deve ser numérico! |