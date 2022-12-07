<h1 align="center"> <b> Projeto Adventure Works  </h1>

<p align="center">
  <img src="aw_elt\Images\logo.png" /  heigth = "500" width = "500">
  
</p>

---

<br/>

# Índice 

* [Índice](#índice)
* [Descrição do Projeto](#descrição-do-projeto)
* [Acesso ao Projeto](#acesso-ao-projeto)
* [Rodando o Projeto](#rodando-o-projeto)
* [Documentação do Projeto](#documentação-do-projeto)
* [Tecnologias Utilizadas](#tecnologias-utilizadas)
* [Dúvidas](#dúvidas)
<br/>
<br/>

# 📋 Descrição do Projeto  
Trata-se de projeto com a finalidade de obtenção da certificação em Engenharia de Analytics by Indicium.

O objetivo desta certificação é avaliar as competências do(a) requerente em um projeto prático de Engenharia de Analytics conforme a metodologia do Modern Analytics Stack, desenvolvida pela Indicium mas que guarda muitas semelhanças com o Modern Data Stack utilizado por milhares de times de dados modernos.

Será avaliado conhecimentos em:
- Tradução de problemas de negócio para projeto de dados
- Data Warehousing
- Star Schemas
- Processos de ELT
- Ingestão de dados
- Uso de ferramenta dbt
- Construção de dashboards de BI

Foi utilizado os dados da Adventure Works (PostgreSQL) que representa uma indústria de bicicletas. Esses dados estão distribuídos em 68 tabelas divididas em 5 schemas: HR (recursos humanos), sales (vendas), production (produção) e purchasing (compras).

O projeto tinha como principal objetivo a resposta das seguintes questões fornecidas em um BI:

- Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

- Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país?

- Quais os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?

- Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

- Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano (dica: gráfico de série de tempo)?

- Qual produto tem a maior quantidade comprada para o motivo “Promotion”?

<br/>
<br/>

# 📁 Acesso ao projeto

Clone o repositório pelo link:

```
$ git clone https://github.com/mayaramatos/Desafio_AW.git
```

Então, recomenda-se criar um ambiente virtual na sua máquina, através do seguinte código:

```
$ py -3.8 -m venv nome_da_venv ---> Bash no windows
```
> Recomenda-se utilizar a versão 3.8 do python, pois verificou-se que versões posteriores havia algumas incompatibilidades com o dbt. 


Após **ativação** do seu ambiente virtual, instale os *_requirements_* do projeto com o comando:

```
$ pip install -r requirements.txt
```
> E por fim, configure suas credenciais no arquivo profile.yml que ficará na sua máquina.  

<br/>
<br/>

# ▶️ Rodando o Projeto

Antes de rodar o projeto, poderá verificar o status das suas credenciais com o comando: 

```
$ dbt debug
```

Caso retorne a mensagem *_"All checks passed!"_*, poderá rodar o projeto com o comando:
```
$ dbt run
```

Caso realize alguma alteração no projeto, recomenda-se rodar os testes novamente para garantir a integridade do modelo. O comando para executar essa tarefa é o:

```
$ dbt test
```
<br/>
<br/>

# 📄 Documentação do Projeto

O dbt disponibiliza a possibilidade de gerar um site local com a documentação do projeto usando a CLI. Dessa forma, torna-se muito mais simples a compreensão do projeto.

Para a geração da documentação, primeiro execute:

```
$ dbt docs generate
```
Este comando diz ao dbt para compilar informações relevantes sobre o projeto. Será criada uma pasta chamada target com a documentação. Certifique-se de ter criado os modelos com dbt run previamente.
Para conseguir visualizar a documentação execute:

```
$ dbt docs serve   ---> Para utilizar os arquivos .json da pasta target e hospedar um servidor local
```
<br/>
<br/>
 
# 🛠️ Tecnologias Utilizadas

> Python 3.8.10

> dbt 1.3

> Google Big Query

> Stitch Data

<br/>
<br/>

# 📍 Dúvidas
- Saiba mais sobre o dbt em [docs](https://docs.getdbt.com/docs/introduction)
- Confira [Discussões](https://discourse.getdbt.com/) para perguntas e respostas frequentes

