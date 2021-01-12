*** Settings ***
Documentation      FASTSHOP - CUPONS
...                Como um usuário do site Fast Shop
...                Quero remover um cupom aplicado, para usar outro mais interessante.
...                Ao adicionar novos cupons se for informado como primeiro da lista, ele será aplicado, caso contrario não será aplicado.


Resource         ../../../resources/base.robot
Suite Setup      Start Session
Suite Teardown   End Session
Test Teardown    End Test

  
*** Test Cases ***        
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: 3T2003894VRM2.
    [Template]               Cliente tenta usar três cupons em uma compra
    [Tags]                   CUPOM1                      COMESTOQUE 
    #CPF                     #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    93170258621              12345678                    3T2003894VRM2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    93170258621              12345678                    3T2003894VRM2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    93170258621              12345678                    3T2003894VRM2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
    
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: 3TS20VERSAVRM1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    84206753938              12345678                    3TS20VERSAVRM1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    84206753938              12345678                    3TS20VERSAVRM1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    84206753938              12345678                    3TS20VERSAVRM1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
     
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: 3TS20VERSAVRM2.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    74302596180              12345678                    3TS20VERSAVRM2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    74302596180              12345678                    3TS20VERSAVRM2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    74302596180              12345678                    3TS20VERSAVRM2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: 8S311310222PTO.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    94057621334              12345678                    8S311310222PTO       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    94057621334              12345678                    8S311310222PTO       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    94057621334              12345678                    8S311310222PTO       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: AEMN8X2BRAPTOB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    53026974161              12345678                    AEMN8X2BRAPTOB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    53026974161              12345678                    AEMN8X2BRAPTOB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    53026974161              12345678                    AEMN8X2BRAPTOB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: AEMQ6G2BRACNZB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    98163742003              12345678                    AEMQ6G2BRACNZB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    98163742003              12345678                    AEMQ6G2BRACNZB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    98163742003              12345678                    AEMQ6G2BRACNZB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 

APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: AEMT572BZAPTAB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    04562873108              12345678                    AEMT572BZAPTAB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    04562873108              12345678                    AEMT572BZAPTAB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    04562873108              12345678                    AEMT572BZAPTAB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: AEMWHJ2BZACNZB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    53620784108              12345678                    AEMWHJ2BZACNZB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    53620784108              12345678                    AEMWHJ2BZACNZB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    53620784108              12345678                    AEMWHJ2BZACNZB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: ARLN72_110.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    46537281008              12345678                    ARLN72_110       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    46537281008              12345678                    ARLN72_110       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    46537281008              12345678                    ARLN72_110       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
    
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: ARLN72_220.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    31502864762              12345678                    ARLN72_220       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    31502864762              12345678                    ARLN72_220       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    31502864762              12345678                    ARLN72_220       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
     
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: BDFRYERBPTO1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    49652738182              12345678                    BDFRYERBPTO1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    49652738182              12345678                    BDFRYERBPTO1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    49652738182              12345678                    BDFRYERBPTO1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: BDFRYERBPTO2.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    64120758958              12345678                    BDFRYERBPTO2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    64120758958              12345678                    BDFRYERBPTO2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    64120758958              12345678                    BDFRYERBPTO2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: BRBLF14AE1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    43561827071              12345678                    BRBLF14AE1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    43561827071              12345678                    BRBLF14AE1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    43561827071              12345678                    BRBLF14AE1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: C8ASTPZF5SELF.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    52168074380              12345678                    C8ASTPZF5SELF       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    52168074380              12345678                    C8ASTPZF5SELF       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    52168074380              12345678                    C8ASTPZF5SELF       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 

APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: COCRA30FBANA.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    83467519237              12345678                    COCRA30FBANA       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    83467519237              12345678                    COCRA30FBANA       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    83467519237              12345678                    COCRA30FBANA       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: EXDB84X1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    03829475179              12345678                    EXDB84X1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    03829475179              12345678                    EXDB84X1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    03829475179              12345678                    EXDB84X1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: EXDB84X2.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    41270356925              12345678                    EXDB84X2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    41270356925              12345678                    EXDB84X2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    41270356925              12345678                    EXDB84X2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: EXGC75PBIV89NB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    73451628007              12345678                    EXGC75PBIV89NB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    73451628007              12345678                    EXGC75PBIV89NB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    73451628007              12345678                    EXGC75PBIV89NB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 

APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: ISFR2014674PCN.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    73619452873              12345678                    ISFR2014674PCN       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    73619452873              12345678                    ISFR2014674PCN       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    73619452873              12345678                    ISFR2014674PCN       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
    
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: JBLFLIP5PTOB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    25306791425              12345678                    JBLFLIP5PTOB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    25306791425              12345678                    JBLFLIP5PTOB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    25306791425              12345678                    JBLFLIP5PTOB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
     
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: JBLGO2PTOB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    32409578179              12345678                    JBLGO2PTOB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    32409578179              12345678                    JBLGO2PTOB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    32409578179              12345678                    JBLGO2PTOB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: LG50UM7510PSBB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    91506428398              12345678                    LG50UM7510PSBB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    91506428398              12345678                    LG50UM7510PSBB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    91506428398              12345678                    LG50UM7510PSBB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: LGCJOLED55C902.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    75692481391              12345678                    LGCJOLED55C902       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    75692481391              12345678                    LGCJOLED55C902       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    75692481391              12345678                    LGCJOLED55C902       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: LGCJOLED55C902.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    86417029387              12345678                    LGCJOLED55C902       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    86417029387              12345678                    LGCJOLED55C902       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    86417029387              12345678                    LGCJOLED55C902       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 

APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: LGCV7011WS41.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    81429605758              12345678                    LGCV7011WS41       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    81429605758              12345678                    LGCV7011WS41       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    81429605758              12345678                    LGCV7011WS41       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: LGCV7011WS42.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    32587916003              12345678                    LGCV7011WS42       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    32587916003              12345678                    LGCV7011WS42       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    32587916003              12345678                    LGCV7011WS42       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: PANAF160B5W1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    41268530735              12345678                    PANAF160B5W1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    41268530735              12345678                    PANAF160B5W1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    41268530735              12345678                    PANAF160B5W1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
    
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGQN55Q80RAB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    57302196877              12345678                    SGQN55Q80RAB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    57302196877              12345678                    SGQN55Q80RAB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    57302196877              12345678                    SGQN55Q80RAB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
     
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGSMA515FZBCOB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    13269085702              12345678                    SGSMA515FZBCOB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    13269085702              12345678                    SGSMA515FZBCOB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    13269085702              12345678                    SGSMA515FZBCOB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGSMA515FZPTOB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    30642179506              12345678                    SGSMA515FZPTOB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    30642179506              12345678                    SGSMA515FZPTOB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    30642179506              12345678                    SGSMA515FZPTOB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGUN50RU7450B.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    60275918386              12345678                    SGUN50RU7450B       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    60275918386              12345678                    SGUN50RU7450B       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    60275918386              12345678                    SGUN50RU7450B       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGUN55NU74PTAB.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    81206347562              12345678                    SGUN55NU74PTAB       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    81206347562              12345678                    SGUN55NU74PTAB       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    81206347562              12345678                    SGUN55NU74PTAB       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 

APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGWD11M44530S2.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    28369704565              12345678                    SGWD11M44530S2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    28369704565              12345678                    SGWD11M44530S2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    28369704565              12345678                    SGWD11M44530S2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGWD11M44530W1.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    21704568307              12345678                    SGWD11M44530W1       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    21704568307              12345678                    SGWD11M44530W1       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    21704568307              12345678                    SGWD11M44530W1       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: SGWD11M44530W2.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    18359027404              12345678                    SGWD11M44530W2       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    18359027404              12345678                    SGWD11M44530W2       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    18359027404              12345678                    SGWD11M44530W2       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: UXX512FABR568B.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    75986024338              12345678                    UXX512FABR568B       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    75986024338              12345678                    UXX512FABR568B       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    75986024338              12345678                    UXX512FABR568B       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 


APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: UXX512FABR569B.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    02871956430              12345678                    UXX512FABR569B       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    02871956430              12345678                    UXX512FABR569B       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    02871956430              12345678                    UXX512FABR569B       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: UXX512FJEJ225B.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    48265713053              12345678                    UXX512FJEJ225B       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    48265713053              12345678                    UXX512FJEJ225B       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    48265713053              12345678                    UXX512FJEJ225B       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 
APLICAR UM CUPOM EM UMA COMPRA E TENTAR USAR OUTROS DOIS SEM SUCESSO SKU: UXX512FJEJ228B.
    [Template]                  Cliente tenta usar três cupons em uma compra

    #CPF                        #Senha                      #Produto            #Cupom    #Cupom2    #Cupom3    #Mensagem recebida                                                                                    #Mensagem recebida dois                                                                              
    37186095259              12345678                    UXX512FJEJ228B       10%OFF    20%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    37186095259              12345678                    UXX512FJEJ228B       20%OFF    10%OFF     30%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.
    37186095259              12345678                    UXX512FJEJ228B       30%OFF    20%OFF     10%OFF     Esse cupom não é cumulativo com outros cupons/promoções já aplicados.     Esse cupom não é cumulativo com outros cupons/promoções já aplicados. 
 




*** Keywords ***
Cliente tenta usar três cupons em uma compra
    [Arguments]        ${cpf}       ${senha}     ${busca_produto}    ${cupom}    ${cupom_dois}    ${cupom_tres}     ${mensagem_recebida}    ${mensagem_recebida_dois}                  
    
    Deletar um produto do carrinho FastShop             ${cpf}        ${senha}        ${busca_produto}
    Dado que acesso e verifico que estou no site da FASTSHOP
    Quando é preenchido o campo de busca ${busca_produto}, verifico se o mesmo é retornado na lista
    E e logo no site com o CPF ${cpf} e a senha ${senha}
    Então o produto ${busca_produto} é adicionado e verificado que está no carrinho 
    E adiciono um cupom ${cupom}, para ter desconto no item ${busca_produto}.
    Então tento adicionar um novo cupom ${cupom_dois} e o site não permite me informando a seguinte mensagem ${mensagem_recebida}
    Então novamente uso um novo cupom ${cupom_tres} e o site não permite me informando a seguinte mensagem ${mensagem_recebida_dois}
 

