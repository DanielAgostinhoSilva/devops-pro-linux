# Guia Rápido do Editor Vi

O **`vi`** é um editor de texto poderoso e amplamente utilizado no Linux. Ele é especialmente útil para editar arquivos de configuração e scripts diretamente no terminal.

---

## **Abrindo o vi**

Para abrir o editor `vi` e iniciar a edição de um arquivo:

```bash
vi <nome_do_arquivo>
```

### Exemplos
1. Abrir um arquivo existente:
   ```bash
   vi meu_arquivo.txt
   ```
2. Criar um novo arquivo (se o arquivo não existir, ele será criado):
   ```bash
   vi novo_arquivo.txt
   ```

---

## **Modos do Vi**

O `vi` possui três modos principais:

1. **Modo Normal** (commando):
    - Este é o modo inicial no `vi`. Ele permite navegar pelo texto, excluir, copiar e colar.
    - Para garantir que esteja no "modo normal", pressione `Esc`.

2. **Modo de Inserção** (edição):
    - Usado para inserir ou editar texto.
    - Para entrar nesse modo, pressione **`i`**, **`a`**, ou **`o`**:
        - **`i`**: Insere texto antes do cursor.
        - **`a`**: Insere texto após o cursor.
        - **`o`**: Cria uma nova linha abaixo para edição.
    - Para retornar ao "modo normal", pressione **`Esc`**.

3. **Modo de Comando** (salvar/sair):
    - Usado para salvar, sair ou realizar operações específicas.
    - Para entrar no "modo de comando", pressione **`:`** no "modo normal".

---

## **Comandos Básicos no Vi**

#### **Navegação**
- **`h`**: Move o cursor para a esquerda.
- **`l`**: Move o cursor para a direita.
- **`j`**: Move o cursor para baixo.
- **`k`**: Move o cursor para cima.
- **`G`**: Vai para a última linha do arquivo.
- **`gg`**: Vai para a primeira linha do arquivo.
- **`nG`**: Vai para a linha `n`.

#### **Inserção e Edição**
- **`i`**: Modo de inserção antes do cursor.
- **`a`**: Modo de inserção após o cursor.
- **`o`**: Cria uma nova linha abaixo e entra em "modo de inserção".
- **`dd`**: Exclui a linha atual.
- **`yy`**: Copia a linha atual.
- **`p`**: Cola o texto copiado após o cursor.
- **`u`**: Desfaz a última alteração.

#### **Busca**
- **`/termo`**: Busca um termo no arquivo.
    - Após digitar `/`, insira o termo que deseja procurar e pressione **Enter**.
- **`n`**: Vai para a próxima ocorrência do termo.
- **`N`**: Vai para a ocorrência anterior.

---

## **Operações com Arquivos**
Para salvar ou sair do arquivo, é necessário usar o "modo de comando". Para isso:

1. Pressione **`Esc`** para entrar no "modo normal".
2. Digite **`:`** para entrar no "modo de comando".
3. Use os seguintes comandos:
    - **`:w`**: Salva o arquivo.
    - **`:q`**: Sai do `vi`.
    - **`:wq`** ou **`:x`**: Salva e sai do `vi`.
    - **`:q!`**: Sai sem salvar.

#### Exemplos
1. Salvar o arquivo:
   ```bash
   :w
   ```

2. Sair do arquivo:
   ```bash
   :q
   ```

3. Salvar e sair:
   ```bash
   :wq
   ```

4. Fechar sem salvar mudanças:
   ```bash
   :q!
   ```

---

## **Recursos Úteis do Vi**

- **Copiar, Cortar e Colar**
    - **`yy`**: Copia uma linha.
    - **`nyy`**: Copia "n" linhas.
    - **`dd`**: Recorta (exclui) uma linha.
    - **`ndd`**: Recorta "n" linhas.
    - **`p`**: Cola abaixo do cursor.

- **Desfazer e Refazer**
    - **`u`**: Desfaz a última alteração.
    - **`Ctrl+r`**: Refaz uma alteração desfeita.

- **Recuperação de Arquivos Temporários**
  Em caso de paradas inesperadas, o `vi` tenta salvar um arquivo temporário. Para recuperar:
  ```bash
  vi -r <nome_do_arquivo>
  ```

- **Ir para um Número de Linha**
  Usado principalmente com grandes arquivos:
  ```bash
  :n
  ```
  Substitua `n` pelo número da linha.

- **Alterar Textos**
    - **`cw`**: Exclui a palavra atual e entra em modo de inserção para substituição.
    - **`cc`**: Exclui a linha atual e entra em modo de inserção para substituição.

---

## **Saída Rápida**

Lembre-se de que é possível voltar ao terminal rapidamente:
- **Salvar e sair**: Digite `:wq` no modo de comando.
- **Sair sem salvar**: Digite `:q!` no modo de comando.

---

## **Dicas e Truques**

- Fique atento ao **modo atual** em que está trabalhando (normal, inserção ou comando).
- Combine o `vi` com o comando `grep` para localizar e editar partes específicas de um arquivo:
  ```bash
  grep -n "termo" arquivo.txt | vi +n
  ```
  Isso abrirá o arquivo `arquivo.txt` diretamente na linha onde o termo foi encontrado.

- Use o comando de busca `vi +/<termo>` para abrir um arquivo já posicionado no termo desejado:
  ```bash
  vi +/erro arquivo.log
  ```

---

## Alternativas ao Vi

Se você achar o `vi` muito complexo no início, experimente `nano` ou `vim`:
- **`nano`**: Simples e fácil de usar.
- **`vim`**: Uma versão avançada e mais moderna do `vi`.

---

Este guia contém os comandos essenciais para começar a usar o **`vi`**. A prática constante irá torná-lo mais rápido e eficiente no uso deste editor poderoso. 😊
