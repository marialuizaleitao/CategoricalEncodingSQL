# Projeto de Análise de Câncer de Mama - Categorização e Codificação em SQL

Este projeto visa realizar uma análise detalhada da base de dados sobre câncer de mama, utilizando técnicas avançadas de manipulação e transformação de dados em SQL. Abaixo, detalho o processo passo a passo:

## Extração e Preparação dos Dados

Dados sobre câncer de mama foram obtidos do [UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/dataset/14/breast+cancer).   

O arquivo original no formato .data foi convertido para .csv para facilitar a importação e adicionado um cabeçalho com os títulos das colunas.

Uma tabela foi criada no MySQL, traduzindo os nomes das colunas para o português.

## Transformações e Manipulações
1. Binarização da Coluna 'Classe':

A binarização é uma técnica que transforma variáveis categóricas em valores binários (0 ou 1). Neste contexto, a coluna 'Classe' foi binarizada para representar duas classes distintas do câncer de mama: 'no-recurrence-events' foi convertido para 0 e 'recurrence-events' para 1. Isso simplifica a análise ao associar valores numéricos às diferentes categorias, permitindo uma interpretação mais direta dos dados.

2. Binarização da Coluna 'Irradiando':
   
Semelhante à binarização da 'Classe', a coluna 'Irradiando' foi binarizada para converter valores 'no' em 0 e 'yes' em 1. Essa abordagem facilita a compreensão e utilização desses dados em algoritmos e visualizações, onde valores binários são frequentemente mais convenientes.

3. Label Encoding da Coluna 'Node_Caps':
   
O Label Encoding é uma técnica que atribui rótulos numéricos a categorias distintas em uma variável. Na 'Node_Caps', que possui três possíveis valores ('no', 'yes' e valores ausentes), foi aplicado o Label Encoding, onde 'no' recebeu o rótulo 0, 'yes' recebeu o rótulo 1, e valores ausentes foram codificados como 2. Essa estratégia preserva a informação dos valores ausentes e os mantém úteis na análise.

4. Categorização da Variável 'Seio':
   
A Categorização é a atribuição de rótulos a diferentes categorias, geralmente utilizada para simplificar variáveis. Na variável 'Seio', os valores 'left' foram transformados em 'E' e 'right' em 'D' através da cláusula CASE. Essa abordagem torna mais claro o significado desses valores, facilitando a interpretação dos dados.

5. Recategorização da Variável 'Tamanho_Tumor':
   
A Recategorização é a reorganização de categorias existentes em uma variável. Na 'Tamanho_Tumor', originalmente com 11 categorias, foi tomada a decisão estratégica de criar 6 novas categorias ('muito pequeno', 'pequeno', 'medio', 'grande', 'muito grande' e 'tratamento urgente'). Essa simplificação auxilia na visualização e compreensão da informação contida nessa coluna.

6. Label Encoding da Variável 'Quadrante':
    
Assim como na 'Node_Caps', a variável 'Quadrante' passou pelo processo de Label Encoding. Cada quadrante foi mapeado para números de 1 a 5, com o quadrante central representado como 5. Valores nulos foram tratados como 0, mantendo sua relevância na análise.

## Query Final e Exportação

Foi elaborada uma query abrangente, reunindo todas as transformações realizadas durante o processo. Essa query não apenas incorpora as mudanças efetuadas nas etapas anteriores, mas também serve como uma ferramenta essencial para a inserção desses dados em uma nova tabela.     

Posteriormente, essa tabela foi exportada para um arquivo CSV, consolidando assim a base de dados com todas as alterações efetuadas. Esse arquivo CSV representa uma versão modificada e otimizada dos dados sobre câncer de mama, pronta para análises mais aprofundadas e compatível com diversas ferramentas de visualização de dados.
