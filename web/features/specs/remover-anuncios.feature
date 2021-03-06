#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anunciante que possui equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter meu Dashboard atualizado

    Contexto: Login
        * Login com "olivia@gmail.com" e "pwd123"

    @excluir_anuncio
    Cenario: Remover um anúncio
        Dado que eu tenho um anúncio indesejado:
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard

    @manter_anuncio
    Cenario: Desistir da exclusão
        Dado que eu tenho um anúncio indesejado:
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 100       |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a solicitação
        Então esse item deve permanecer no meu Dashboard