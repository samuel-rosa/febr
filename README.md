<!-- Generated by knitr: do not edit by hand. Please edit the content in README.Rmd -->

Repositório Brasileiro Livre para Dados Abertos do Solo (FEBR)
==============================================================

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![packageversion](https://img.shields.io/badge/devel%20version-1.6.0-firebrick.svg?style=flat-square)](commits/master)
[![Build
Status](https://travis-ci.org/samuel-rosa/febr-package.svg?branch=master)](https://travis-ci.org/samuel-rosa/febr-package)
[![CRAN](https://www.r-pkg.org/badges/version/febr)](https://cran.r-project.org/package=febr)
[![cran
checks](https://cranchecks.info/badges/worst/febr)](https://cran.r-project.org/web/checks/check_results_febr.html)
[![Downloads](https://cranlogs.r-pkg.org/badges/febr?color=brightgreen)](https://www.r-pkg.org/pkg/febr)

Instalação
----------

O pacote febr para [R](https://www.r-project.org/) foi criado para
facilitar o acesso aos conjuntos de dados publicados no Repositório
Brasileiro Livre para Dados Abertos do Solo, também conhecido como
[FEBR](https://www.pedometria.org/projeto/febr/) (/ˈfɛ.bɾe/). Ele pode
ser descarregado do [CRAN](https://CRAN.R-project.org/package=febr) da
seguinte maneira:

    install.packages(pkgs = "febr")

Já a versão de desenvolvimento, disponível no
[GitHub](https://github.com/samuel-rosa/febr-package), pode ser
instalada—usando o pacote `remotes`—da seguinte maneira:

    if (!require(remotes)) {
      install.packages(pkgs = "remotes")
    }
    remotes::install_github("samuel-rosa/febr-package")

Utilização básica
-----------------

A principal função de descarregamento de dados do pacote febr chama-se
`readFEBR`. Ela aceita dois argumentos: `data.set`, o código de
identificação do conjunto de dados no FEBR, e `data.table`, o nome de
uma ou mais tabelas de dados contidas no conjunto de dados escolhido—as
opções são `"identificacao"`, `"versionamento"`, `"metadado"`,
`"observacao"`, and `"camada"`. Veja alguns exemplos a seguir:

    # Descarregar todas as tabelas de dados do conjunto de dados ctb0003
    dados <- febr::readFEBR(data.set = "ctb0003")

    # Descarregar todas as tabelas de dados dos conjuntos de dados ctb0001, ctb0002 e ctb0003
    dados <- febr::readFEBR(data.set = c("ctb0001", "ctb0002", "ctb0003"))

    # Descarregar apenas a tabela de dados de identificação dos conjuntos de dados ctb0001, ctb0002 e ctb0003
    dados <- febr::readFEBR(data.set = c("ctb0001", "ctb0002", "ctb0003"), data.table = "identificacao")

O objeto retornado é uma lista de conjuntos de dados, os quais são
listas com suas próprias tabelas de dados. Para processar esses dados,
você pode usar funções como `lapply`.

<!-- O pacote `febr` possui cinco funções para descarregamento de dados: -->
<!-- 1. `dataset`, para descarregar os dados de identificação de um ou mais conjuntos de dados; -->
<!-- 2. `observation`, para descarregar os dados das observações do solo de um ou mais conjuntos de dados; -->
<!-- 3. `layer`, para descarregar os dados das camadas das observações do solo de um ou mais conjuntos de dados; -->
<!-- 4. `metadata`, para descarregar os dados sobre os dados de um ou mais conjuntos de dados; -->
<!-- 5. `febr`, para descarregar todos os dados e metadados de um único conjunto de dados. -->
<!-- O principal argumento dessas cinco funções é `dataset`. Para esse argumento é passado o código de identificação de um ou mais conjuntos de dados publicados no FEBR. Isso descarrega os dados da tabela de dados indicada pela função escolhida. Por exemplo, -->
<!-- ```R -->
<!-- observation(dataset = "ctb0003") -->
<!-- ``` -->
<!-- descarrega os dados das observações do solo do conjunto de dados `ctb0003`. O código de identificação de todos os conjuntos de dados publicados no FEBR estão catalogados em http://www.ufsm.br/febr/catalog/. -->
<!-- No caso das funções `observation`, `layer` e `febr`, o segundo principal argumento é `variable`. Para esse argumento é passado o código de identificação da(s) variável(is) cujos dados devem ser retornados pela função escolhida. Por exemplo, -->
<!-- ```R -->
<!-- layers(dataset = "ctb0003", variable = "argila") -->
<!-- ``` -->
<!-- retorna os dados da variável `argila` do conjunto de dados `ctb0003`. O código de identificação de todas as variáveis contidas nos conjuntos de dados publicados no FEBR estão catalogados em https://goo.gl/hi77sB. -->

Quero colaborar
---------------

Nós usamos o modelo de desenvolvimento colaborativo *fork & pull*. Isso
significa que você tem liberdade para fazer um cópia paralela – *fork* –
do código fonte e fazer as alterações que julgar necessárias. Isso tudo
sem que seja necessário pedir qualquer autorização para a gente. Caso as
alterações que você realizou na sua cópia pessoal do código fonte sejam
interessantes e você tenha interesse em compartilhar as mesmas conosco,
então basta solicitar que sejam puxadas – *pull request* – para o código
fonte original. Depois de uma revisão das alterações, nós decidiremos se
elas podem ser fundidas – *merge* – com o código fonte original.
