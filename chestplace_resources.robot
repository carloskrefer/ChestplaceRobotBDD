*** Settings ***
Library	SeleniumLibrary
Library    GeradorCnpjValido.py
Library    XML

*** Variables ***
${BROWSER}	chrome 
${URL}	http://localhost/chestplace/

*** Keywords ***
Dado que estou na página de cadastro de vendedor
    Sleep    0.5s
    Go To    url=${URL}
    Click Element   xpath=//button[text()='Cadastrar-se']
    Sleep    0.5s
    Click Element   xpath=//button[text()='Sou vendedor']
    Sleep    0.5s

Quando preencho um CEP real no campo CEP, ${CEP}
    Input Text    id=cep    ${CEP}

E pressiono a tecla ${nomeTecla}
    Press Keys    None    ${nomeTecla}

E aguardo ${tempoSegundos}
    Sleep    ${tempoSegundos}

Então deve ser automaticamente preenchido "${nomeRua}" no campo "Rua"
    Element Attribute Value Should Be  id=rua   value   ${nomeRua}

E deve ser automaticamente preenchido "${nomeBairro}" no campo "Bairro"
    Element Attribute Value Should Be  id=bairro    value   ${nomeBairro}

E deve ser automaticamente preenchido "${nomeCidade}" no campo "Cidade"
    Element Attribute Value Should Be  id=cidade    value   ${nomeCidade}

E deve ser automaticamente preenchido "${nomeEstado}" no campo "Estado"
    Element Attribute Value Should Be  id=displayEstadoSelect   value    ${nomeEstado}

Preencher nome "${NOME}" no campo do nome
    Input Text    id=nome    ${NOME}

Quando preencho um nome real, "${NOME}" no campo do nome
    Preencher nome "${NOME}" no campo do nome
    
Quando preencho um nome com caracteres especiais, "${NOME}" no campo do nome
    Preencher nome "${NOME}" no campo do nome

E preencho um e-mail real e não cadastrado no campo de e-mail
    Input Text    id=emailLogin    ${{''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '@hotmail.com'}}

E preencho uma senha válida, "${senhaValida}" na senha
    Input Text    id=senha    ${senhaValida}

E preencho a mesma senha que antes, "${senhaValida}" na confirmção da senha
    Input Text    id=confirmacaoSenha    ${senhaValida}

E preencho um nome válido, "${nomeEstabelecimento}" no campo nome do estabelecimento 
    Input Text    id=nomeEstabelecimento    ${nomeEstabelecimento}

Preencher "${cpfCNPJ}" no campo de CPF ou CNPJ
    Input Text    id=cpfCnpj    ${cpfCNPJ}

E preencho um CNPJ real e não cadastrado no campo de CNPJ
    Preencher "${{GeradorCnpjValido.cnpj(True)}}" no campo de CPF ou CNPJ    

E preencho um CNPJ real e já cadastrado, "${cnpjJaCadastrado}" no campo de CNPJ
    Preencher "${cnpjJaCadastrado}" no campo de CPF ou CNPJ  

E preencho um CPF não existente, "${cpf}" no campo de CPF
    Preencher "${cpf}" no campo de CPF ou CNPJ

Então é indicado que o campo CPF não foi preenchido com um valor válido
    Element Should Be Focused    id=cpfCnpj  

E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    Input Text    id=emailContato    ${{''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '@hotmail.com'}}

E preencho um telefone válido, "${telefoneContato}" no campo de telefone de contato
    Input Text    id=telefoneContato    ${telefoneContato}

E preencho um CEP real, "${CEP}" no campo de CEP
    Input Text    id=cep    ${CEP}

E preencho um número de endereço válido, "${numeroEndereco}" no campo de número do endereço
    Input Text    id=numero    ${numeroEndereco}

Clicar no botão Salvar
    Click Element    id=salvar

E clico no botão Salvar
    Clicar no botão Salvar

Quando clico no botao de salvar sem preencher nenhum outro campo
    Clicar no botão Salvar

Então é exibido um modal informando "${mensagemAlerta}"
    Alert Should Be Present    ${mensagemAlerta}    ACCEPT    5s

Então é indicado que um campo obrigatório deixou de ser preenchido
    Element Should Be Focused    id=nomeEstabelecimento  

Abrir o navegador
    Open Browser	browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser