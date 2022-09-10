Este é um teste de Dev que recebi da empresa Leadster, e fui instruido para criar um aplicativo que sua tarefa consiste em criar um sistema para uma ​agenda de contatos, ela tem uma tela inicial que permite o usuario cadastrar os dados pessoais do seu contato, e depois de cadastrar o contacto, o usuário é redirecionado para uma outra tela para que possa obrigatoriamente digitar um numero CEP do Brazil de 8 digitos, depois de digitar o codigo CEP o aplicativo fara automaticamente um API request e voltara com dados sobre o endereço do CEP digitado.

Neste projeto eu utilizei o Ruby on Rails 6 no pattern MVC. Também utilizei algumas gems importantes do Ruby e do Rails e outras tecnologias como o Fetch() da linguagem javascript() para comunicar com o serviço no backend.

## Screenshot

![screenshot](./app/assets/images/Screenshot2.png)
![screenshot](./app/assets/images/Screenshot3.png)
![screenshot](./app/assets/images/Screenshot1.png)
  

## Built WithScreenshot from 2022-09-10 12-29-18.png

- [Ruby](https://www.ruby-lang.org/en/) 3.1.2
- [Rails](https://guides.rubyonrails.org/getting_started.html) 6.1.3
- [Gems](https://rubygems.org/)

## Live Demo

[Click here to view it live on Heroku](https://bootstrap-blog-rails.herokuapp.com/)

## Initial settings to run the project

```bash
# clonar o projeto
git clone https://github.com/ixboy/agenda.git

# enter directory clonado
cd agenda

# instalar Rails dependencies
bundle install

# instalar Node dependencies
yarn install

# criar o development e o test databases
rails db:create

# criar tabelas do database
rails db:migrate

# popular a data do db:seed
rails db:seed

# run the project
rails s
```

### Prerequisites

- Ruby on Rails v6.x. Para aprender como instalar Ruby on Rails, siga este [link](https://guides.rubyonrails.org/getting_started.html)

### Usage

- start a server with `rails s`

- open `http://localhost:3000/` in your browser.

- Inscreva-se com seu e-mail e senha, um e-mail de confirmação será enviado para você e você poderá começar a aproveitar o aplicativo...



## Deployment

- A App vai ser deployed no Heroku Brevemente.

## Author

👤 **Iyunda Ismael Antonio**

- GitHub: [@ixboy](https://github.com/ixboy)
- Twitter: [@ismaelixboy](https://twitter.com/ismaelixboy)
- LinkedIn: [ismael-antonio](https://www.linkedin.com/in/ismaelantonio/)


## Acknowledgments

#### Leadster
