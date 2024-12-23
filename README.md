# Comandos Linux - Guia Rápido

Este repositório contém informações e exemplos básicos sobre comandos Linux. É destinado a desenvolvedores e administradores de sistemas que desejam relembrar ou aprender os comandos mais usados.

---

## Comandos

### **Comando: uname**

O comando `uname` é usado para exibir detalhes sobre o sistema operacional e o kernel.

#### **Sintaxe**
```bash
uname [opções]
```

#### **Opções**

- **`-a`**: Exibe todas as informações disponíveis (kernel, sistema operacional, nome da máquina, versão, hardware, etc.).
- **`-s`**: Exibe apenas o nome do kernel.
- **`-n`**: Exibe o nome do host da máquina.
- **`-r`**: Exibe a versão do kernel.
- **`-v`**: Exibe a versão detalhada do kernel.
- **`-m`**: Exibe a arquitetura da máquina (ex.: x86_64).
- **`-p`**: Exibe o tipo de processador (nem sempre fornece uma saída prevista).
- **`-i`**: Exibe a plataforma de hardware (nem sempre fornece uma saída prevista).
- **`-o`**: Exibe o sistema operacional.

> **Nota**: Nem todas as opções estão disponíveis em todas as versões ou distribuições Linux.

#### **Exemplo de Uso**

- **Exibir todas as informações do sistema**:
  ```bash
  uname -a
  ```
  **Saída esperada**:
  ```
  Linux my-computer 5.15.0-56-generic #62~20.04.1-Ubuntu SMP Thu Nov 10 14:58:15 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
  ```

- **Exibir apenas o nome do kernel**:
  ```bash
  uname -s
  ```
  **Saída esperada**:
  ```
  Linux
  ```

- **Exibir a versão do kernel**:
  ```bash
  uname -r
  ```
  **Saída esperada**:
  ```
  5.15.0-56-generic
  ```

- **Exibir sistema operacional**:
  ```bash
  uname -o
  ```
  **Saída esperada**:
  ```
  GNU/Linux
  ```

---
### **Comando: sudo su**

O comando `sudo su` é usado para alternar para um shell de superusuário (root) com permissões de administrador. Isso permite realizar qualquer tarefa no sistema sem restrições, como instalar pacotes, acessar arquivos protegidos e configurar o sistema.

#### **Sintaxe**
```bash
sudo su
```

#### **Comportamento**

- O `sudo` é usado para executar comandos com permissões de administrador.
- O `su` permite trocar para outro usuário, especificamente o superusuário (root) por padrão.
- Quando combinados (`sudo su`), o terminal é iniciado diretamente como o superusuário, solicitando a senha do usuário atual que possui permissão de `sudo`.

#### **Exemplo de Uso**

- **Acessar o shell do superusuário**:
  ```bash
  sudo su
  ```
  **Saída esperada** (o prompt muda para indicar o superusuário):
  ```
  root@my-computer:/home/user#
  ```

- **Alternativa direta para trocar para root (se permitido)**:
  ```bash
  su
  ```
  **Nota:** Para usar apenas `su`, você precisará da senha do superusuário (root). Pelo `sudo su`, apenas a senha do usuário com permissão `sudo` é necessária.

#### **Saindo do modo superusuário**

Após concluir as tarefas como superusuário, você pode voltar ao seu usuário normal digitando:
```bash
exit
```

#### **Atenção**

- **Uso consciente**: O superusuário tem permissões completas no sistema; erros podem causar sérios problemas, incluindo a remoção de arquivos críticos ou configurações incorretas.
- **Evite usar `sudo su` sem necessidade.** Sempre prefira executar comandos específicos com o `sudo` para evitar erros acidentais.

---
### **Comando: free**

O comando `free` é usado para exibir informações sobre a quantidade de memória disponível, usada e livre no sistema. Ele inclui tanto a memória física (RAM) quanto a memória swap.

#### **Sintaxe**
```bash
free [opções]
```

#### **Opções**

- **`-h`**: Exibe os valores em um formato legível para humanos (ex.: MB, GB em vez de valores em bytes).
- **`-b`**: Mostra os valores em bytes.
- **`-k`**: Mostra os valores em kilobytes (padrão).
- **`-m`**: Mostra os valores em megabytes.
- **`-g`**: Mostra os valores em gigabytes.
- **`--tera`**: Mostra os valores em terabytes.
- **`--si`**: Usa divisões de 1000 em vez de 1024 para cálculos.
- **`-c N`**: Atualiza continuamente o status da memória, onde `N` é o intervalo de atualização em segundos.
- **`-t`**: Exibe também o total geral de memória (soma de RAM + swap).

> **Nota:** Sem nenhuma opção, o comando exibe os valores no formato padrão (em kilobytes).

#### **Exemplo de Uso**

- **Exibir informações da memória no formato legível**:
  ```bash
  free -h
  ```
  **Saída esperada**:
  ```
                total        used        free      shared  buff/cache   available
  Mem:           15Gi        4Gi        6Gi        0.5Gi        5Gi        10Gi
  Swap:           2Gi        1Gi        1Gi
  ```

- **Monitorar a memória continuamente a cada 2 segundos**:
  ```bash
  free -c 2
  ```

- **Exibir em gigabytes**:
  ```bash
  free -g
  ```

#### **Descrição dos Resultados**
- **Mem**: Informações sobre a memória RAM.
    - **total**: Quantidade total de memória instalada no sistema.
    - **used**: Memória atualmente em uso (inclui cache e buffers).
    - **free**: Memória completamente livre, ainda não utilizada.
    - **shared**: Memória compartilhada entre processos.
    - **buff/cache**: Memória usada para buffers e cache.
    - **available**: Memória disponível para novos processos, considerando liberação de buffers e cache.

- **Swap**: Memória virtual usada como extensão da RAM quando ela é insuficiente.

#### **Dicas**
- Use `free -h` para obter uma visão mais amigável do consumo de memória.
- Combine com comandos como `watch` para monitorar o uso contínuo:
  ```bash
  watch -n 1 free -h
  ```
  Isso exibirá a saída do `free` atualizada a cada segundo.

---
### **Comando: shutdown**

O comando `shutdown` é usado para desligar ou reiniciar o sistema de forma segura. Ele avisa os usuários ativos no sistema e sinaliza os processos em execução para que possam ser encerrados corretamente antes do desligamento.

#### **Sintaxe**
```bash
shutdown [opções] [horário] [mensagem]
```

#### **Parâmetros**

- **`[horário]`**: Define quando o sistema será desligado/reiniciado. Pode ser especificado de diferentes formas:
    - `now`: Desliga imediatamente o sistema.
    - `+m`: Desliga após `m` minutos (ex.: `+5` para 5 minutos).
    - `hh:mm`: Especifica o horário exato para o desligamento, no formato 24 horas (ex.: `23:00`).
- **`[mensagem]`**: Uma mensagem opcional que será exibida para os usuários que estiverem conectados ao sistema antes do desligamento.

#### **Opções**

- **`-h`**: Desliga o sistema completamente após encerrar os processos.
- **`-r`**: Reinicia o sistema após o desligamento.
- **`-c`**: Cancela um desligamento/reinício agendado.
    - Deve ser usado em conjunto com `shutdown` (`shutdown -c`).
- **`-P`**: Desliga o sistema físico (poderá variar dependendo de hardware/configuração).
- **`--help`**: Exibe a ajuda com todos os parâmetros disponíveis.

#### **Exemplo de Uso**

1. **Desligar imediatamente**:
   ```bash
   shutdown now
   ```

2. **Desligar após 10 minutos com uma mensagem de aviso**:
   ```bash
   shutdown +10 "O sistema será desligado em 10 minutos para manutenção."
   ```

3. **Reiniciar imediatamente**:
   ```bash
   shutdown -r now
   ```

4. **Agendar um desligamento às 20:30**:
   ```bash
   shutdown 20:30
   ```

5. **Cancelar um desligamento agendado**:
   ```bash
   shutdown -c
   ```

6. **Desligar o sistema físico**:
   ```bash
   shutdown -P now
   ```

#### **Funcionamento**

- Quando o comando `shutdown` é executado, todos os usuários conectados ao sistema recebem uma mensagem de aviso informando o desligamento iminente.
- O comando também notifica os serviços em execução para que encerrem suas atividades corretamente.
- Se um cronograma de desligamento for definido e você deseja cancelá-lo, use o comando `shutdown -c`.

#### **Permissões Necessárias**

- O comando `shutdown` geralmente requer permissões de superusuário (root). Use `sudo` se você estiver logado como um usuário padrão:
  ```bash
  sudo shutdown now
  ```

---
### **Comando: man**

O comando `man` é usado para acessar a documentação e manuais de referência do Linux. Ele fornece explicações e opções detalhadas de uso para quase todos os comandos e utilitários do sistema.

#### **Sintaxe**
```bash
man [opção] <comando>
```

#### **Opções Comuns**
- **`-k [palavra-chave]`**: Lista todas as páginas de manual que contêm uma palavra-chave no título ou descrição.
    - Exemplo: `man -k copy` retorna todas as páginas relacionadas a "copy".
- **`-a`**: Examina todas as páginas de manual disponíveis, em sequência.
- **`-f [comando]`**: Exibe apenas uma descrição breve de um comando. É equivalente ao comando `whatis`.
    - Exemplo: `man -f ls` retorna algo como: `ls (1) - list directory contents`.

#### **Seções do Manual**
As páginas de manual são organizadas em seções numeradas:
1. Comandos do usuário (padrão).
2. Chamadas do sistema.
3. Funções da biblioteca.
4. Arquivos de dispositivo e drivers.
5. Formatos de arquivo.
6. Jogos.
7. Miscelânea.
8. Comandos para administradores.
9. Documentação do kernel (pouco usada).

Você pode especificar a seção ao buscar por uma página de manual. Por exemplo:
```bash
man 3 printf
```
Isso abrirá a página de manual da função C `printf` na biblioteca padrão em vez do comando `printf`.

#### **Exemplo de Uso**

1. **Exibir o manual de um comando básico:**
   ```bash
   man ls
   ```
   Mostra detalhes e opções do comando `ls`.

2. **Buscar comandos relacionados a "cópia":**
   ```bash
   man -k copy
   ```
   Mostra uma lista de comandos relacionados, como `cp`.

3. **Exibir uma descrição breve de um comando (`whatis`):**
   ```bash
   man -f tar
   ```
   Mostra algo como: `tar (1) - an archiving utility`.

4. **Abrir páginas de manual específicas:**
   ```bash
   man 5 crontab
   ```
   Lê a descrição da estrutura do arquivo de configuração do CRON (seção 5).

#### **Dicas**
- Use a **barra `/`** no manual para buscar palavras dentro da página exibida.
- As páginas do manual são específicas para comandos e ferramentas instalados no sistema. Um comando pode não ter documentação disponível se o software correspondente não estiver instalado.
- Se você não tem certeza do nome completo do comando, use `man -k` para pesquisar (combinado com palavras-chave).

#### **Permissões**
O comando `man` pode ser executado por usuários padrão sem necessidade de privilégios administrativos.

#### **Nota**
Em imagens minimalistas (como `debian:bullseye-slim`), o comando `man` e as páginas de manual podem não estar disponíveis por padrão. Certifique-se de instalá-los com:
```bash
sudo apt-get update && sudo apt-get install -y man-db manpages
```

#### **Atalho Útil**
Se preferir uma visão simplificada da descrição de comandos, use o comando `whatis`:
```bash
whatis ls
# Saída esperada: ls (1) - list directory contents
```
---
## Como Executar os Comandos Linux

Para executar os comandos descritos aqui:

1. Abra um terminal no seu sistema Linux ou use um terminal remoto via SSH.
2. Digite o comando conforme mostrado nos exemplos e pressione **Enter**.
3. Leia o resultado no terminal.

Se precisar de privilégios de administrador, utilize `sudo` antes do comando.

**Exemplo**:
```bash
sudo uname -a
```

---

Este guia está em constante atualização. Sugestões e contribuições são bem-vindas!