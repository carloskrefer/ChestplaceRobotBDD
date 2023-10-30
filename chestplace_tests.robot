*** Settings ***
Documentation    Essa suíte testa o site da Chestplace
Resource         chestplace_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - O sistema preenche automaticamente o endereço com o CEP no formulário de cadastro de vendedor
	[Documentation]    Esse teste verifica se ao preencher um CEP existente o sistema preenche corretamente a rua, bairro, número, cidade e Estado, mantendo o complemento vazio.
	[Tags]             caso_teste_01
	Dado que estou na página de cadastro de vendedor
	Quando preencho um CEP real no campo CEP, "80630100"
	E pressiono a tecla TAB
	E aguardo 2s
	Então deve ser automaticamente preenchido "Rua Rio Grande do Norte" no campo "Rua"
	E deve ser automaticamente preenchido "Guaíra" no campo "Bairro"
	E deve ser automaticamente preenchido "Curitiba" no campo "Cidade"
	E deve ser automaticamente preenchido "PR" no campo "Estado"

Caso de Teste 02 - O sistema permite o cadastro de um novo vendedor
	[Documentation]    Esse teste verifica se o sistema permite o cadastro de um novo vendedor
	[Tags]             caso_teste_02
	Dado que estou na página de cadastro de vendedor
	Quando preencho um nome real, "Jose das Couves" no campo do nome
	E preencho um e-mail real e não cadastrado no campo de e-mail
	E preencho uma senha válida, "aaaAAA1!" na senha
	E preencho a mesma senha que antes, "aaaAAA1!" na confirmção da senha
	E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento 
	E preencho um CNPJ real e não cadastrado no campo de CNPJ
	E preencho um e-mail real e não cadastrado no campo de e-mail de contato
	E preencho um telefone válido, "41993456792" no campo de telefone de contato
	E preencho um CEP real, "80630100" no campo de CEP
	E preencho um número de endereço válido, "123" no campo de número do endereço
	E aguardo 2s	
	E clico no botão Salvar
	Então é exibido um modal informando "Usuário cadastrado com sucesso!"
	  
Caso de teste 03 - O sistema não permite o cadastro de um novo vendedor com CNPJ já cdastrado
 	[Documentation]    Esse teste verifica se o sistema não permite o cadastro de um novo vendedor com CNPJ já cadastrado
 	[Tags]             caso_teste_03
	Dado que estou na página de cadastro de vendedor
	Quando preencho um nome real, "Jose das Couves" no campo do nome
	E preencho um e-mail real e não cadastrado no campo de e-mail
	E preencho uma senha válida, "aaaAAA1!" na senha
	E preencho a mesma senha que antes, "aaaAAA1!" na confirmção da senha
	E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento 
	E preencho um CNPJ real e já cadastrado, "05.702.358/0001-80" no campo de CNPJ
	E preencho um e-mail real e não cadastrado no campo de e-mail de contato
	E preencho um telefone válido, "41993456792" no campo de telefone de contato
	E preencho um CEP real, "80630100" no campo de CEP
	E preencho um número de endereço válido, "123" no campo de número do endereço
	E aguardo 2s	
	E clico no botão Salvar
	Então é exibido um modal informando "Email e/ou documento já cadastrado."

Caso de teste 04 - O sistema não aceita o uso de caracteres especiais no campo de nome no fomrulário de cadastro de vendedor
 	[Documentation]    Esse teste verifica se o sistema não aceita o uso de caracteres especiais no campo de nome no fomrulário de cadastro de vendedor
 	[Tags]             caso_teste_03
	Dado que estou na página de cadastro de vendedor
	Quando preencho um nome com caracteres especiais, "Jo$e das Couve$" no campo do nome
	E preencho um e-mail real e não cadastrado no campo de e-mail
	E preencho uma senha válida, "aaaAAA1!" na senha
	E preencho a mesma senha que antes, "aaaAAA1!" na confirmção da senha
	E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento 
	E preencho um CNPJ real e não cadastrado no campo de CNPJ
	E preencho um e-mail real e não cadastrado no campo de e-mail de contato
	E preencho um telefone válido, "41993456792" no campo de telefone de contato
	E preencho um CEP real, "80630100" no campo de CEP
	E preencho um número de endereço válido, "123" no campo de número do endereço
	E aguardo 2s	
	E clico no botão Salvar
	Então é exibido um modal informando "Não é permitido o uso de caracteres especiais no campo de nome."


Caso de Teste 05 - O sistema impede o usuário de cadastrar um vendedor com senhas diferentes
    [Documentation]    Esse teste verifica o cadastro de um usuário vendedor com senhas diferentes
    [Tags]             caso_teste_05 cadastro_vendedor senhas_diferentes cadastro_inválido  

    Dado que estou na página de cadastro de vendedor
    Quando preencho um nome real, "Jose das Couves" no campo do nome
    E preencho um e-mail real e não cadastrado no campo de e-mail
    E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento
	E preencho um CNPJ real e não cadastrado no campo de CNPJ
    E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    E preencho um telefone válido, "41993456792" no campo de telefone de contato
    E preencho um CEP real, "80215010" no campo de CEP
    E preencho um número de endereço válido, "123" no campo de número do endereço
	E preencho uma senha válida, "S3NH4@12E4" na senha
    E preencho uma senha diferente da anterior, "SENHA@1234" no campo confirmação de senha
    E clico no botão Salvar
    Então permaneço na página de cadastro

Caso de Teste 06 - O sistema impede o usuário de cadastrar um vendedor com CEP inválido
    [Documentation]    Esse teste verifica o cadastro de um usuário vendedor com um CEP inválido
    [Tags]             caso_teste_06 cadastro_vendedor cep_invalido cadastro_invalido

    Dado que estou na página de cadastro de vendedor
	Quando preencho um nome real, "Jose das Couves" no campo do nome
    E preencho um e-mail real e não cadastrado no campo de e-mail
    E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento 
    E preencho uma senha válida, "S3NH4@12E4" na senha
    E preencho a mesma senha que antes, "S3NH4@12E4" na confirmção da senha
    E preencho um CNPJ real e não cadastrado no campo de CNPJ
    E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    E preencho um telefone válido, "41993456792" no campo de telefone de contato
    E preencho um número de endereço válido, "123" no campo de número do endereço
    E preencho um CEP inválido, "123" no campo de CEP
    E clico no botão Salvar
    Então permaneço na página de cadastro


Caso de Teste 07 - O usuário é informado sobre os campos obrigatórios não preenchidos ao tentar confirmar os dados
	[Documentation]    Esse teste verifica se o usuário é informado quando deixa de preencher campos obrigatórios na tela de cadastro de vendedor
	[Tags]             caso_teste_07
	Dado que estou na página de cadastro de vendedor
	Quando clico no botao de salvar sem preencher nenhum outro campo
	Então é indicado que um campo obrigatório deixou de ser preenchido

Caso de Teste 08 - O sistema deve avisar se o CPF informado for inválido ou não existente
	[Documentation]    Esse teste verifica se o usuário é informado quando informa um CPF inválido na tela de cadastro de vendedor
	[Tags]             caso_teste_08
	Dado que estou na página de cadastro de vendedor
	Quando preencho um nome real, "Joao" no campo do nome
	E preencho um e-mail real e não cadastrado no campo de e-mail
	E preencho uma senha válida, "Joao@123" na senha
	E preencho a mesma senha que antes, "Joao@123" na confirmção da senha
	E preencho um nome válido, "Joao Camisetas Ltda" no campo nome do estabelecimento 
	E preencho um CPF não existente, "12312331" no campo de CPF
	E preencho um e-mail real e não cadastrado no campo de e-mail de contato
	E preencho um telefone válido, "41995454732" no campo de telefone de contato
	E preencho um CEP real, "80630100" no campo de CEP
	E preencho um número de endereço válido, "123" no campo de número do endereço
	E aguardo 2s	
	E clico no botão Salvar
	Então é indicado que o campo CPF não foi preenchido com um valor válido

Caso de Teste 9 - O sistema deve exigir confirmação de senha para cadastro de vendedor
	[Documentation]    O teste verifica se o sistema exige a confirmação da senha para o cadastro de vendedor
	[Tags]             Caso_de_Teste_9_ValConfSen
	Dado que estou na página de cadastro de vendedor
    Quando preencho um nome válido, "Nome" no campo do nome
    E preencho um email real, "email@gmail.com" no campo de email
    E preencho um CNPJ real e não cadastrado no campo de CNPJ
    E preencho um nome válido, "nomeesta" no campo de nome de estabelecimento
    E preencho um CEP válido, "89256630" no campo de CEP
    E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    E preencho um telefone válido, "4137286768" no campo de telefone de contato
    E aguardo 2s
    E preencho uma senha válida, "Nome!123" no campo de senha
	E não preencho a mesma senha, "Nome!1231" no campo de confirmação de senha
    E aguardo 2s
    E clico no botão Salvar
    Então é exibido a mensagem de confirmação de senha inválida


Caso de Teste 10 _ O sistema deve validar se o CNPJ informado for inválido ou não existente para cadastro de vendedor
	[Documentation]    O teste verifica se o sistema informa se o CNPJ não for válido ou não existente
	[Tags]             Caso_de_Teste_10_valCNPJ
	Dado que estou na página de cadastro de vendedor
    Quando preencho um nome, "Nome" no campo do nome
    E preencho um email real, "email@gmail.com" no campo de email
    E preencho um nome válido, "nomeesta" no campo de nome de estabelecimento
    E preencho uma senha válida, "Nome!123" no campo de senha
	E preencho a mesma senha, "Nome!1231" no campo de confirmação de senha
    E preencho um CEP válido, "89256630" no campo de CEP
    E preencho um e-mail real e não cadastrado no campo de e-mail de contato
    E preencho um telefone válido, "4137286768" no campo de telefone de contato
    E aguardo 2s
    E preencho um CNPJ inválido, "0000000000000" no campo de CNPJ
    E aguardo 2s
    E clico no botão Salvar
    Então é exibido uma mensagem de que o campo é inválido

