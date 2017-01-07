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
# Podfile - run pod install version 1.1.1
```<swift>
platform :ios, '9.0'

target 'RGA_Test' do

use_frameworks!

pod 'RealmSwift'
pod 'SDWebImage', '~> 3.8'
pod 'RxSwift', '~> 3.0.0.beta.1'
pod 'RxCocoa', '~> 3.0.0.beta.1'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
end
```
# Bibliotecas utilizadas
- pod 'SDWebImage', '~> 3.8'
- pod 'JsonSwiftson', '~> 3.0'

Utilizei a biblioteca "SDWebImage" pela facilidade na requisição assíncrona e cache das imagens de acordo com o valor da URL em questão, caso não consiga obter a imagem possivel adicionar um placeholder-image:

```<swift>
contactPhoto.sd_setImage(with: URL(string: contact.photo),placeholderImage: UIImage(named: "image-placeholder"))
```

Em "JsonSwiftson" não utilizei o "pod", pois se trata de única classe onde dentro do projeto foi renomeado para "RGAWrapper.swift", também gosto desta biblioteca pela facilidade e agilidade em mapear objetos, atualmente na maioria dos projetos que desenvolvo não utilizo biblotecas de requisição ou mapeamento pois trabalho com "URSession" e "guard let":

```<swift>
let wrapper = RGAWrapper(json: JSON)

let contacts:[RGAContactModel]? = wrapper.mapArrayOfObjects { mapper in
             
  let rgaContact = RGAContactModel()
  
  rgaContact.name = mapper[self.KeyName].map() ?? ""
  rgaContact.email = mapper[self.KeyEmail].map() ?? ""
  rgaContact.born = mapper[self.KeyBorn].map() ?? ""
  rgaContact.bio = mapper[self.KeyBio].map() ?? ""
  rgaContact.photo = mapper[self.KeyPhoto].map() ?? ""
                
  return rgaContact
}
```
# Arquitetura MVC - (Layers)
- Infrastructure:
  Centralizei todas as "Constants", "Mensagems", "Fonts" e "Resources", a fim de abstrair o máximo todos estes mecanismos da aplicação.
  
- ViewController:
  Esta camada atua como uma intermediária entre as camadas View e Manager, ela é reponsável por notificar as Views sobre eventuais mudanças de modelos e vice-versa, ainda nesta camada faço algumas tratativas de eventos, tais como: IBActions e Delegates/DataSources.
  
- View:
  Responsável por toda parte de apresentação, animação a regras de view. Para abstrair um pouco e deixar mais organizado mantenho todos os IBOutlets aqui ele eles são acessados direto pela controller:
```<swift>
private var mainView: RGAContactView {
  return self.view as! RGAContactView
}
```

- Manager:
  Nesta camada controlo o fluxo de requisições entre a camada ViewController e Business. Ela é exclusivamente chamda pela camada ViewController.
  
- Business:
  Esta é uma das mais importantes camadas do aplicativo, aqui é onde comtém estruturas internas responsáveis por todas as regras de negócio. Ela deve ser exclusivamente acessada pela camada Manager e invocar a camada Provider (quando necessário). Ainda nesta camada, é onde recebo os "dados primitivos" (ex:. NSData?, NSDictionary?) e criá-los em modelos através da realização do parse.

- Provider: 
  É responsável pela abstração das camadas da aplicação com acesso às fontes de dados e biblioteca de terceiros. Aqui deve sempre retornar tipos de "dados primitivos", e ser exclusivamente acessada pelo "Business".
  
- Model:
  Camada que contém entidades que representam os objetos consumidos via serviço ou banco de dados.

# O que faria/mudaria com mais tempo

- Abstrair controle de fluxo do app.
- Ajustaria "keyboards" para tela de "add new contact", ex:. datepicker para o campo "born".
- Suporte a landscape e portrait.
- Abstrair camada HTTP resquest visando ter mais chamadas dentro da aplicação.
- XCUITests e XCTests.
- Implementação Rx databiding para "datasources" da lista.
