# Contracts Spike

Este é um pequeno exercício de arquitetura solicitado em um processo de seleção.

Há apenas os models conforme descritos no diagram [ER](./erd.pdf) e nos [testes](test/models/)
e um [serviço de exemplo](app/services/signing_service.rb) que mostra como
recuperar dados para o processo de assinatura.

Para simplificação, uploads de arquivo são tratados pelo CarrerWave com storage em disco.

Além disso, pode-se fazer melhorias com helpers para o testes e talvez alguma refatoração nos models.


## Como Criar Contratos

Para criação de contratos, é necessário que haja um Produto e um Cliente cadastrados de mesmo segmento.

Assim, Ao selecionar um Produto, o usuário deverá ou selecionar um cliente de já existente do mesmo segmento ou então cadastrá-lo.

### Cliente Pessoa Jurídica

Caso o segmento do produto seja "company", o usuário cadastrará o Nome da Empresa e seu CNPJ, seguido de 1 ou 2 prepostos.

### Cliente Pessoa Física

Caso o produto seja do segmento "pessoa", o usuário cadastrará, Nome, CPF e E-mail da pessoa física em questão (mesmos dados se aplicam para prepostos da empresa).


### Criação do Contrato

Após a criação do cliente, faz-se a vinculação do produto e do cliente ao contrato, e faz-se upload de arquivo caso o produto tenha documento requerido.

## Processo de Assinatura

Com o contrato criado, inicia-se o processo de assinatura conforme descrito no [serviço de exemplo](app/services/signing_service.rb) e inicia-se monitoramento ou por url de callback ou agendamento periódico de checagem de assinatura para então alterar-se o status do contrato.

## Listagem de Contratos

Por conta da modelagem, não há dificuldade em listar todos os contratos, podendo-se utilizar-se do pattern decorator para facilitar a obtenção de dados do produto e de documento requerido caso necessário.
