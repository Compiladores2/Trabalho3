# Trabalho 3 de Compiladores 2

## Compilador Gerador de Receitas

## Grupo
  - Guilherme Nishi Kanashiro - 628298
  - Jorge de Carvalho Kawamura - 595136
  - Rodolfo Krambeck Asbahr - 628042
  
## Requisitos de Software
  - Eclipse com plugin Xtext
  - ANTLR (instalado automaticamente pelo plugin Xtext)

## Instalação do Xtext
Inicie uma instância do Eclipse. Na parte superior da janela, selecione a opção "Help -> Install New Software".

Insira no campo "Work with" a URL http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/ e clique em "Add".

Selecione a opção "Xtext SDK" disponível na categoria "Xtext" e termine a instalação seguindo as instruções do instalador. O Eclipse iniciará o download dos arquivos necessários. Após o término da instalação, reinicie o Eclipse, que já contará com o Xtext pronto para uso.

## Configuração do projeto
Inicie um novo projeto no menu File -> New -> Project.

Na janela de criação de projetos, selecione a opção Xtext -> Xtext Project e clique em "Next".

Serão disponibilizados os campos de configuração do projeto. Para este projeto, utilizamos as seguintes configurações:
```
Project name: trabalho3
Language name: ReceitaHTML
Language extensions: receita
```
Ao finalizar a configuração, serão criados o projeto principal e quatro derivados (com finais *.ide, *tests, *.ui, *.ui.tests).

Os arquivos disponibilizados neste repositório devem ser distribuídos no projeto principal da seguinte forma:
```
ReceitaHTML.xtext: src -> trabalho3
ReceitaHTMLGenerator.xtend: src -> trabalho3.generator
ReceitaHTMLValidator.xtend: src -> trabalho3.validation
```
## Execução e testes
Após alocarmos os arquivos em seus respectivos caminhos, podemos gerar os artefatos da gramática. Para isso, abra o arquivo ReceitaHTML.xtext e clique com o botão direito no editor de texto. Selecione a opção

```
Run As -> 1 Generate Xtext Artifacts
```

Caso não haja erros, podemos testar a linguagem. No navegador de pacotes, clique com o botão direito no projeto principal (trabalho3) e selecione a opção

```
Run As -> 1 Eclipse Application
```

Uma nova instância do Eclipse será iniciada. Na nova instância, crie um novo projeto:

```
File -> New Project -> Java Project
```

Os arquivos *.receita devem ser importados na pasta src do novo projeto. Automaticamente será gerada uma pasta src-gen com os programas objetos correspondentes.

