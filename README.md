Esse é o aplicativo do Dr. Cash, com login e lista de clínicas disponíveis.
=======
# Acessando o aplicativo

Inicialmente, baixar o aplativo como ZIP e descompatar em alguma pasta do seu computador ou efetuar o clone do repostiróio;

Executar os comandos: 

## flutter pub get 
Para baixar as dependencias utilizadas no aplicativo.

# Solução apresentada
## Querys
Para esse teste foram utilizadas algumas dependencias que suportam as requisições, como o http_flutter, essa dependencia foi escolhida pois é mais fácil utilizar setando estados para os Fetchs das querys, usando ferramentas como o QuickType, facilitam a criação e geração dos Jsons e para o Token, basta usar a função do Http.

## Estrutura do Projeto
Por ser um projeto mais objetivo, foi utilizado padrões de organizações de features e core, contendo suas respectivas estruturas, mantendo o código de fácil compreensão e estruturado de forma limpa e para uso de Rotas foi utilizada o MaterialPageRoute.

## Gerencia de Estados
Para a Gerência de Estados, foi utilizado o Provider, por ser mais simples e mais escalável para a proposta do aplicativo.

## Lógica da aplicação
Para as consultas das querys, foi utilizado o http_flutter para a manipulação das querys e o QuickType para geração do arquivo Json, com a organização desse arquivo foram criadas Maps para manipular listas das querys vindas do result das Fetchs apresentadas pela url apresentada.

## Layout da aplicação
O layout foi pensado na palheta de cores do Dr.Cash, apresentando um design simples e de fácil visualização, seguindo os padrões retirados do próprio site, fazendo uso de imagens para montagem de Carousels, customizações e padrões da própria empresa (visuais). A ideia é utilizar uma aplicação fácil e bem objetiva para o usuário, não perdendo a idealização de bem-estar e conforto ao utilizar a aplicação, podendo assim, coletar informações de humor do paciente pensando na experiência do usuário.

## Resultado das querys
Todas as consultas foram manipuladas dentro do BD para que possam estar refletindo dentro da aplicação de forma dinâmica e com um Future para salvar os estados e mounted para evitar multiplos inserções de memória, já que a aplicação baseia-se no initState e setState.

## Testes
Não possuo muito familiaridade para testes, só trabalhei repassando as informações para o QA. Mas proponho total disponibilidade para aprender e utilizar durante o trabalho! :)

## Considerações finais
Por fim, agradeço pelo teste, apesar de objetivo, explora vários conhecimentos técnicos. Espero que gostem! :)
