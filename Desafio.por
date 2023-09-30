programa {
  inclua biblioteca Tipos --> tp
  inclua biblioteca Util --> u

  cadeia produtos[100][3] 
  inteiro totalProdutos = 100

  funcao inicio() {
    
    inteiro opcao

    faca {  
      escreva("\n\n==================Menu==================\n\n")
      escreva("1 - Adicionar Produto\n")
      escreva("2 - Atualizar Produto\n")
      
      escreva("3 - Remover Produto\n")
      
      escreva("4 - Pesquisar Produto\n")
      escreva("5 - Exibir Produtos em Estoque\n") 
      escreva("6 - Calcular Valor Total do Estoque\n") 
     
      escreva("7 - Sair\n")
      escreva("\nEscolha uma opção: ")
      leia(opcao)
      

       escolha (opcao) {
        caso 1:
            limpa()
            adicionarProduto()
            pare
         caso 2:
           atualizarProduto()
           pare
         caso 3:
              removerProduto()
              pare
        caso 4:
              pesquisarProduto()
              pare
         caso 5:
             exibirProdutosEstoque()
             pare
        caso 6:
             calcularValorTotalEstoque()
             pare
        caso 7:
        limpa()
          pare
        caso contrario:
         limpa()
           escreva("Opção inválida. Tente novamente")
           u.aguarde(1000)          
       }

    } enquanto (opcao != 7)
  }

  funcao adicionarProduto(){
    cadeia nomeProduto, qtdProduto, precoProduto
    logico produtoJaExiste = falso
      

    escreva("==============Adicionar Produto=============\n\n")
    escreva("Digite o nome do produto: ")
    leia(nomeProduto)

    para (inteiro i = 0; i < 100; i++) {
          se (produtos[i][0] == nomeProduto){ 
            produtoJaExiste = verdadeiro
            escreva("================Aviso================\n\n")      
            escreva("Este produto já existe no estoque.")
            pare                  
          }
          se (u.numero_linhas(produtos) > 100) {
              escreva("O estoque está cheio. Não é possível adicionar mais produtos.")
              pare
      }       
  
      se (nao produtos[i][0]) {
            produtos[i][0] = nomeProduto 
      
            escreva("Digite a quantidade: ")
            leia(qtdProduto)
            produtos[i][1] = qtdProduto

            escreva("Digite o preço unitário: ")
            leia(precoProduto)
            produtos[i][2] = precoProduto 
            escreva("\nProduto adicionado ao estoque.")
           u.aguarde(1000)
            pare
          }   
      }              
  }

  funcao atualizarProduto() {    
      cadeia produtoNome, produtoQtd, produtoPreco
      inteiro indice = -1
        
        escreva("==============Atualizar Produto=============\n\n")
        escreva("Digite o nome do produto a ser atualizado: ")
        leia(produtoNome)

        para (inteiro i = 0; i < totalProdutos; i++) {
          se (produtos[i][0] == produtoNome) { 
            indice = i
            pare
          }
        }

        se(indice == -1) {
          limpa()
          escreva("================Aviso================\n\n")
          escreva ("Produto não encontrado no estoque.")
          u.aguarde(3500)
          
          
        } senao{

        escreva ("Digite a nova quantidade: ")
        leia(produtos[indice][1]) 
        escreva("Digite o novo preço unitário: ")
        leia(produtos[indice][2])
        escreva("\nProduto atualizado com sucesso.")
        u.aguarde(3500)
        
        }
  }

  funcao exibirProdutosEstoque()  {
      escreva("=================Estoque=================\n\n")
      para (inteiro i = 0; i < totalProdutos; i++ ){
        se(nao produtos[i][0]){
          se(i == 0){escreva("Estoque vazio!\n")}
          escreva("Aperte ENTER para voltar ao menu.... ")
          leia("")          
          pare
        }senao{
          escreva("Nome: ", produtos[i][0], "\n") 
          escreva("Quantidade: ", produtos[i][1], "\n") 
          escreva("Preço Unitário:", produtos[i][2], "\n")
          escreva("Custo Total do Produto: R$", tp.cadeia_para_real(produtos[i][1])*tp.cadeia_para_real(produtos[i][2]))
          escreva("\n-------------------------\n\n")
          }
        }
}

funcao calcularValorTotalEstoque(){
  real valorTotal = 0

  para(inteiro i = 0; i <totalProdutos; i++) {
    se(nao produtos[i][0]){
      pare
    }
    valorTotal  += tp.cadeia_para_real(produtos[i][1]) * tp.cadeia_para_real(produtos[i][2])

  }

  escreva("===========Calculo Total do Estoque===========\n\n")
  escreva("O valor total do estoque é: R$", valorTotal)

  
  escreva("\n\nAperte ENTER para voltar ao menu... ")
  leia("")
  
  
}

funcao pesquisarProduto() {
    cadeia nomeProduto
    inteiro indice = -1

    escreva("=============Pesquisar Produto=============\n\n")
    escreva("Digite o nome do produto a ser pesquisado: ")
    leia(nomeProduto)

    para (inteiro i = 0; i < totalProdutos; i++) {
      se (produtos[i][0] == nomeProduto) { 
        indice = i
        pare
      }
    }

    se (indice == -1) {
        limpa()
        escreva("================Aviso================\n\n")
        escreva("Produto não encontrado no estoque.")
        u.aguarde(3500)      
    }senao{

    cadeia nome = produtos[indice][0]
    cadeia quantidade = produtos[indice][1]
    cadeia precoUnitario = produtos[indice][2]
    real custoTotal = (tp.cadeia_para_real(quantidade) * tp.cadeia_para_real(precoUnitario))

    limpa()
    escreva("=============Produto Encontrado=============\n\n")
    escreva("Nome: ", nome, "\n")
    escreva("Quantidade: ", quantidade, "\n") 
    escreva("Preço Unitario: ", precoUnitario, "\n")
    escreva("Custo Total do Produto: R$", custoTotal, "\n")
    }
    

    escreva("\nAperte ENTER para voltar ao menu... ")
    leia("")
    
  
}

funcao removerProduto() {
    cadeia nomeProduto, copiaProdutos[100][3]
    inteiro indice = -1

    escreva("==============Remover Produto=============\n\n")
    escreva("Digite o nome do produto a ser removido: ")
    leia(nomeProduto)

    para (inteiro i = 0; i < totalProdutos; i++) {
      se (produtos[i][0] == nomeProduto) { 
       indice = i
        pare
      }
    }

    se (indice == -1) {
      limpa()
      escreva("================Aviso================\n\n")
      escreva("Produto não encontrado no estoque.")
      u.aguarde(3500)
    } senao {

      para(inteiro i = 0; i < totalProdutos; i++){
        se(produtos[i][0] == produtos[indice][0]){
          se(nao produtos[i+1][0]){
          produtos[i][0] = ""
          produtos[i][1] = ""
          produtos[i][2] = "" 
            pare
          }
          indice = i+1
          produtos[i][0] = produtos[i+1][0]
          produtos[i][1] = produtos[i+1][1]
          produtos[i][2] = produtos[i+1][2]
          
        } senao {
          produtos[i][0] = produtos[i][0]
          produtos[i][1] = produtos[i][1]
          produtos[i][2] = produtos[i][2]
        }
      }   
      
      escreva("Produto removido com sucesso.")
      u.aguarde(3500)
    
    }
    
  }

}