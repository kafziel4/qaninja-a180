#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome  | email           | senha  |
            | Laura | laura@gmail.com | pwd123 |
        Então sou redirecionado para o Dashboard

    @tentativa_cadastro
    Esquema do Cenario: Tentativa de cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input   | email_input       | senha_input | mensagem_output                  |
            |              | manuela@gmail.com | pwd123      | Oops. Informe seu nome completo! |
            | Manuela      |                   | pwd123      | Oops. Informe um email válido!   |
            | Manuela      | manuela*gmail.com | pwd123      | Oops. Informe um email válido!   |
            | Manuela      | manuela@gmail     | pwd123      | Oops. Informe um email válido!   |
            | Manuela      | manuela@gmail.com |             | Oops. Informe sua senha secreta! |