Scripts para tentar automatizar a escolha de bancas para o programa de bioinformática da USP. 

A ideia é :

* Juntar nomes de possíveis professores para bancas.

* Registrar as afiliações (Bioinformática ou Outro / USP ou outro).

* Registrar a área de trabalho.

   *Todo os textos da área de "Projetos de Pesquisa" do Lattes que estejam marcados como "Atual".
       * Usar o Script Lattes + processamento de strings
   
   *Converter sempre pra 
   
   *Remover palavras vazias ("and", "or", etc)
   
   * Ideia 1 : Bag of Words para cada pesquisador. 
   
   * Ideia 2 : Embedding das 10 palavras mais comuns de cada pesquisador.
   
* Ordenar os pesquisadores da lista por proximidade com as keywords   
* Ordenar os pesquisadores da lista por proximidade com o abstract 


* Usar ambas as listas para fazer os  matches finais 

* Criar uma interface de usuário

O programa irá pegar um resumo e palavras chaves e encontrar os melhores matches baseado nas áreas de pesquisa. 

Os matches serão retornados na forma de duplas.  


== Protótipo ==

Para o protótipo, irei juntar manualmente as informações iniciais, scrapar do Escavador os projetos de pesquisa e fazer o match por bag of word.

Como fazer o scraping?


Buscar os nomes no escavador.

Opções: 
    *selenium 
    *activesoup
    
Puxar as informações da página:

    *bs4 

Pegar os textos dos nós (ul) abaixo do h3 com o texto  "projeto de pesquisa".
# banca_maker
