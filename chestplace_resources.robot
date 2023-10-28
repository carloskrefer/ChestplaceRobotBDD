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

Quando preencho um CEP válido no campo CEP, ${CEP}
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

Quando preencho um nome real, "${NOME}" no campo do nome
    Input Text    id=nome    ${NOME}
    
E preencho um e-mail real e não cadastrado no campo de e-mail
    Input Text    id=emailLogin    ${{''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '@hotmail.com'}}

E preencho uma senha válida, "${senhaValida}" na senha
    Input Text    id=senha    ${senhaValida}

E preencho a mesma senha que antes, "${senhaValida}" na confirmção da senha
    Input Text    id=confirmacaoSenha    ${senhaValida}

E preencho um nome válido, "${nomeEstabelecimento}" no campo nome do estabelecimento 
    Input Text    id=nomeEstabelecimento    ${nomeEstabelecimento}

E preencho um CNPJ real e não cadastrado no campo de CNPJ
    Input Text    id=cpfCnpj    ${{GeradorCnpjValido.cnpj(True)}}

E preencho um CNPJ real e já cadastrado, "${cnpjJaCadastrado}" no campo de CNPJ
    Input Text    id=cpfCnpj    ${cnpjJaCadastrado}

E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    Input Text    id=emailContato    ${{''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '@hotmail.com'}}

E preencho um telefone válido, "${telefoneContato}" no campo de telefone de contato
    Input Text    id=telefoneContato    ${telefoneContato}

E preencho um CEP válido, "${CEP}" no campo de CEP
    Input Text    id=cep    ${CEP}

E preencho um número de endereço válido, "${numeroEndereco}" no campo de número do endereço
    Input Text    id=numero    ${numeroEndereco}

E clico no botão Salvar
    Click Element    id=salvar

Então é exibido um modal informando "${mensagemAlerta}"
    Alert Should Be Present    ${mensagemAlerta}    ACCEPT    5s

Abrir o navegador
    Open Browser	browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Close Browser