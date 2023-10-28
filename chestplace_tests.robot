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
	Quando preencho um CEP válido no campo CEP, "80630100"
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
	Quando preencho "Jose das Couves" no campo do nome
	E preencho um e-mail real e não cadastrado no campo de e-mail
	E preencho uma senha válida, "aaaAAA1!" na senha
	E preencho a mesma senha que antes, "aaaAAA1!" na confirmção da senha
	E preencho um nome válido, "Jose Camisetas Ltda" no campo nome do estabelecimento 
	E preencho um CNPJ real e não cadastrado no campo de CNPJ
	E preencho um e-mail real e não cadastrado no campo de e-mail de contato
	E preencho um telefone válido, "41993456792" no campo de telefone de contato
	E preencho um CEP válido, "80630100" no campo de CEP
	E preencho um número de endereço válido, "123" no campo de número do endereço
	E aguardo 2s	
	E clico no botão Salvar
	Então é exibido um modal informando "Usuário cadastrado com sucesso!"
	  
