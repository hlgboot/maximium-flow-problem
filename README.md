# Problema do Fluxo Máximo (Maximum Flow Problem)

Implementação do **Problema do Fluxo Máximo (Maximum Flow Problem)** utilizando **Programação Linear** e o solver **GLPK**, desenvolvida como parte do Trabalho Prático V da disciplina **EPD113 — Implementação Matemático-Computacional de Modelos de Pesquisa Operacional**.

## Sobre o projeto

O Problema do Fluxo Máximo é um problema clássico de otimização em redes que consiste em determinar a maior quantidade de fluxo que pode ser transportada de um vértice de origem, denominado **fonte**, até um vértice de destino, denominado **sumidouro**, respeitando as capacidades dos arcos da rede.

A rede é representada por um grafo direcionado \(G=(V,E)\), no qual cada arco possui uma capacidade máxima de transporte.

Neste projeto, o problema é formulado por meio de **Programação Linear**, utilizando o GLPK para encontrar a solução ótima.

## Modelagem matemática

### Parâmetros

- `V`: conjunto de vértices da rede.
- `E`: conjunto de arcos direcionados `(i,j)`.
- `c[i,j]`: capacidade máxima de fluxo do arco `(i,j)`.
- `s`: vértice de origem (fonte).
- `t`: vértice de destino (sumidouro).

### Variáveis de decisão

- `u[i,j]`: quantidade de fluxo transportada pelo arco `(i,j)`.
- `f`: fluxo total transportado da fonte até o sumidouro.

Todas as variáveis são contínuas e não negativas.

### Função objetivo

Maximizar o fluxo total transportado pela rede:

**Maximizar:**

`Z = f`

### Restrições

**1. Conservação de fluxo**

A diferença entre o fluxo que sai e o fluxo que entra em cada vértice deve ser:

- `f`, para o vértice fonte.
- `0`, para os vértices intermediários.
- `-f`, para o vértice sumidouro.

Matematicamente:

`Σ u[i,j] - Σ u[k,i] = b[i]`

Onde:

- `b[s] = f`
- `b[t] = -f`
- `b[i] = 0` para os demais vértices.

**2. Capacidade dos arcos**

O fluxo em cada arco não pode ultrapassar sua capacidade máxima:

`u[i,j] ≤ c[i,j]`

**3. Não negatividade**

O fluxo transportado em cada arco deve ser não negativo:

`u[i,j] ≥ 0`

`f ≥ 0`

## Estrutura do projeto

```text
problema-do-fluxo-maximo/
├── model.mod
├── small.dat
├── big.dat
└── README.md
```

- **model.mod:** modelo matemático de otimização implementado em MathProg.
- **small.dat:** conjunto de dados pequeno para validação do modelo.
- **big.dat:** conjunto de dados com uma rede de maior complexidade para testar a formulação.

## Como executar

### Pré-requisitos

É necessário ter o **GLPK (GNU Linear Programming Kit)** instalado, incluindo o utilitário de linha de comando `glpsol`.

A instalação pode ser realizada com Homebrew:

```bash
brew install glpk
```

Para verificar a instalação:

```bash
glpsol --version
```

### Executando o modelo

Clone o repositório:

```bash
git clone https://github.com/hlgboot/maximium-flow-problem.git
cd maximium-flow-problem
```

Para executar o modelo com a instância simples:

```bash
glpsol -m model.mod -d small.dat
```

Para executar com a instância complexa:

```bash
glpsol -m model.mod -d big.dat
```

## Tecnologias utilizadas

- **Linguagem de modelagem:** GNU MathProg (GMPL).
- **Solver:** GLPK (GNU Linear Programming Kit).
- **Modelagem matemática:** Programação Linear.
- **Controle de versão:** Git e GitHub.

## Aplicações

O Problema do Fluxo Máximo possui aplicações em diversas áreas, como:

- **Redes de transporte:** maximização da quantidade de veículos ou mercadorias transportadas.
- **Redes de comunicação:** otimização da transmissão de dados.
- **Sistemas de distribuição:** determinação da capacidade máxima de escoamento.
- **Logística:** otimização do fluxo de produtos em redes de distribuição.
- **Infraestrutura:** análise de capacidade em redes de abastecimento.

---

Projeto desenvolvido para fins acadêmicos e de estudo de técnicas de Pesquisa Operacional.