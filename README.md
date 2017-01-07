# R/GA Challenge

  O objetivo da aplicação é exibir uma lista de contatos disponível em um endpoint, os contatos devem ser persistidos em um banco local utilizando REALM, permitindo adicionar novos contatos na lista, excluí-los e alterá-los. O aplicativo deve conter uma tela de lista (Contact List) e uma de detalhes (Details).

# Contact List
<img src="http://imageshack.com/a/img922/3094/OoFEpK.png" width="320"/>
<img src="http://imageshack.com/a/img923/179/6mmeEY.png" width="320"/>
# Contact Detail / Edit
<img src="http://imageshack.com/a/img924/4899/U9wxXw.png" width="320"/>
<img src="http://imageshack.com/a/img923/1841/uWtLPK.png" width="320"/>
# Create a new contact
<img src="http://imageshack.com/a/img923/9205/cfv2uU.png" width="320"/>
# Bibliotecas utilizadas
- pod 'SDWebImage', '~> 3.8'
- pod 'JsonSwiftson', '~> 3.0'

Utilizei a biblioteca "SDWebImage" pela facilidade na requisição assíncrona e cache das imagens de acordo com o valor da URL em questão, caso não consiga obter a imagem possivel adicionar um placeholder-image:

Em "JsonSwiftson" não utilizei o "pod", pois se trata de única classe onde dentro do projeto foi renomeado para "RGAWrapper.swift", tambem gosto desta library pela facilidade de e agilidade em mapear objetos, atualmente na maioria dos projetos que desenvolvo não utilizo biblotecas de requisição ou mapeamento pois trabalho com "URSession" e "guard let":
