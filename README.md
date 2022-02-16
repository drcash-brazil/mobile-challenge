# Mobile Challenge

Seja bem-vindo ao repositório do projeto DrCashClinic, um caso de uso que deve ser implementado como um aplicativo.
Obrigado por participar do desafio da Dr.Cash! Estamos muito contentes pelo seu primeiro passo para fazer parte de um time excepcional.

## Afinal, o que é esse desafio?

Primeiramente é importante se atentar aos pilares da Dr.Cash, seguindo metodologias de desenvolvimento ágil.

- [Transparência] - Todo momento é momento para perguntar, tirar dúvidas e conversar sobre os processos e tarefas a serem executados, comunicação em primeiro lugar, sempre.

- [Adaptabilidade] - Ofereça melhorias baseado em perspectivas e fundamentos, como também se adeque as normas impostas visando padrões já estipulados.

- [Autonomia] - Ser Autodidata, proativo e fidelidade na busca constante por conhecimento.

---

## Desafio

A ideia desse desafio é desenvolver um aplicativo simples que consiste em uma tela de login, uma tela com os objetivos de um usuário e uma tela com os detalhes do objetivo.
O seu prazo será de 1 semana para a entrega, que deve ser realizada por etapas, pois parte importante do projeto é a colaboração e resposta aos comentários/sugestões.

---

## Contexto do Projeto

Lucas é um típico usuário de aplicativos que está em busca de uma boa clínica estética para sua esposa realizar alguns procedimentos.

Através desta procura Lucas encontrou o aplicativo DrCashClinics, que exibe todas as clínicas da sua região ordenadas por proximidade e seus detalhes de contato.

---

## Desenvolvimento da Tela de Login

Supreenda-nos com a criação de uma Tela de Login para o app de Clínicas que Lucas encontrou.

Para logar é preciso informar o e-mail e senha, que neste caso são:

```
{
  "email": "lucas@gmail.com",
  "password": "drcashclinics123!#"
}
```

Rota de Autenticação: https://apihml.drcash.com.br/api/v1/identity/token


```
Retorno de Autenticação

{
  "userId": "string",
  "token": "string",
  "refreshToken": "string",
  "expiresIn": 0,
  "success": true,
  "errors": [
    "string"
  ],
  "errorStatus": 0
}
```

## Desenvolvimento da Home e Listagem de Clínicas

- 1. Após a realização do Login, o usuário deve ser redirecionado para a tela de Home, onde será possível navegar em listagem de clínicas, no qual o usuário poderá clicar em um dos cards das clínicas e visualizar seus detalhes.
- 2. O componente que exibirá os detalhes da clínica será um modal.

Rota da Listagem de Clínicas: https://apihml.drcash.com.br/api/v1/clinics/public


```
Parâmetros para Requisição

{
  "pageNumber":
  "pageSize":
  "orderBy":
  "city":
  "state":
}
```


```
Retorno da Lista de Clínicas

[
  {
    "id": 0,
    "tradingName": "string",
    "city": "string",
    "state": "string",
    "clinicTypeId": 0,
    "clinicType": "string",
    "phoneNumber": "string",
    "isActive": true
  }
]
```

---

## Tecnologias

> Como pré-requisito deste projeto, o desenvolvimento do aplicativo deve ser realizado em Flutter, de preferência na versão mais atualizada.

---

## Pontos a serem observados:

- Usar Material UI Flutter como biblioteca para desenvolver layouts.
- Fique livre para tratar as questões de boas práticas, convenções, nomenclaturas, padrões, frameworks e etc...

---

## Bonus:
- Tela de Splash;
- Transições e animações;
- Tratamento de erros e apresentação dos fluxos de exceção: Generic Error's e Loading's

---

## O que será avaliado:
> Principal
- Atenção com UI/UX (Isso é muuuito importante pra gente! Nossos apps são recomendados como inspiração);
- Colaboração através do GitHub. Abrindo Pull Requests para features isoladas no aplicativo, respondendo e resolvendo comentários e sugestões.
- Seguir guidelines e padrões do sistema iOS/Android;
- Estrutura e solução dos problemas;
- Lógica, modularização, organização, clareza de código, escalabilidade e documentação;
- Testes unitários de parte do projeto.

---

## Futuro

> Descreva sobre possíveis planos para este projeto, melhorias ou alterações que você realizaria em prol de aumentar a qualidade no desenvolvimento.

---

# **ATENÇÃO**

Depois de implementar a solução, envie um **pull request** para este repositório pela interface do Github.

O nome da branch deve seguir o seguinte padrão: **nome-sobrenome**.

Deve conter um passo-a-passo para execução do projeto e deve ser encaminhado o APK do aplicativo para os e-mails: henrique.pereira@drcash.com.br e joao.vilela@drcash.com.br

O processo de Pull Request funciona da seguinte maneira:

- Faça um fork deste repositório (não clonar direto!);
- Faça seu projeto neste fork;
- Commit e suba as alterações para o SEU fork;
- Pela interface do Github, envie um Pull Request.
- Deixe o fork público para facilitar a inspeção do código.
> Obs.: Não tente fazer o PUSH diretamente para ESTE repositório!

