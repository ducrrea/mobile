# json_path_provider_todo_list

Criação de uma aplicativo que permite o cadastro de usuarios e tarefas para o usuário

O diferencial da tarefa é que em vez de salvar apenas uma lista de tarefas, usaremos um JSON quue será um objeto(Ma/Dicionário) onde a chave é o nome do usuário e o valor é a lista de tarefas dele

## A estrutura do JSON

```json
{
    "João":[
        {"titulo":"Estudar Flutter", "concluida":false},
        {"titulo":"Fazer Compras", "concluida":true},
    ],
    "Maria":[
        {"titulo":"Ler livro", "concluida":false},
        {"titulo":"Comprar pão", "concluida":true},
    ],
}
```