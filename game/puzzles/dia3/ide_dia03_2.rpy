label INVENTARIO_DE_ESCOLHA_DIA03_2:
    #Variáveis necessárias:

    python:
        ide_seq_gabarito = [30]
        #Adiciona todos os itens que foram coletados anteriormente
        ide_itens_no_inventario = []
        for item in pac1_itens_no_inventario:
            ide_itens_no_inventario.append(item)
        ide_aux_count = 0
        ide_tempo = 1.0
        ide_item_outro = []
        ide_fim = False
        ide_aux_item = []
        ide_sensivel = False
        ide_label_repetir = "IDE_03_2_ESCOLHE_FRASE"
        ide_label_fim = "IDE_03_2_FIM"

        pac3_item_lenco[5] = "IDE_03_2_ESCOLHEU_LENCO"
        pac3_item_telefone[5] = "IDE_03_2_ESCOLHEU_TELEFONE"
        pac3_item_vitrola[5] = "IDE_03_2_ESCOLHEU_VITROLA"
        pac3_item_vela[5] = "IDE_03_2_ESCOLHEU_VELA"
        pac3_item_radio[5] = "IDE_03_2_ESCOLHEU_RADIO"

    play music "audio/musicas/Dilema.mp3" fadein 5.0

    #Chama a tela
    show screen inventario_de_escolha() with puzzle_transition8

    jump IDE_03_2_ESCOLHE_FRASE


label IDE_03_2_FIM:
    stop music fadeout 5.0
    hide screen inventario_de_escolha with puzzle_transition8
    return


label IDE_03_2_ESCOLHE_FRASE:
    if(ide_aux_count == 0):
        #Primeiro pedido de escolha...
        #...
        $ide_sensivel = True
        jump POINT_AND_CLICK
    elif(ide_aux_count == 1):
        #Última frase do puzzle...
        #Recomenda-se não ter muito texto aqui
        #Setar mais tempo se necessário
        #$ide_tempo = 3.0
        $ide_sensivel = True
        $ide_fim = True
        jump POINT_AND_CLICK


label IDE_03_2_ESCOLHEU_LENCO:
    #Define quem é o item
    $ide_aux_item = pac3_item_lenco

    #Se o item ainda não foi escolhido
    if(ide_nao_escolhido(ide_aux_item)):
        #Se o item é próximo na ordem de escolha
        if(ide_proximo_correto(ide_aux_item)):
            #Escolheu corretamente!
            #Inserir frases correspondentes:
            "..."
            hide screen mostra_item2 with dissolve
            $ide_escolheu_item(ide_aux_item)
        else:
            #Escolheu ERRADO!
            #Inserir frases correspondentes:
            "Não sei... acho que não é isso..."
            hide screen mostra_item2 with dissolve
    else:
        #Já escolheu
        #Inserir frases correspondentes:
        "Já usei essa pista antes... não é isso..."
        hide screen mostra_item2 with dissolve
    jump IDE_03_2_ESCOLHE_FRASE

label IDE_03_2_ESCOLHEU_TELEFONE:
    #Define quem é o item
    $ide_aux_item = pac3_item_telefone

    #Se o item ainda não foi escolhido
    if(ide_nao_escolhido(ide_aux_item)):
        #Se o item é próximo na ordem de escolha
        if(ide_proximo_correto(ide_aux_item)):
            #Escolheu corretamente!
            #Inserir frases correspondentes:
            "..."
            hide screen mostra_item2 with dissolve
            $ide_escolheu_item(ide_aux_item)
        else:
            #Escolheu ERRADO!
            #Inserir frases correspondentes:
            "Não sei... acho que não é isso..."
            hide screen mostra_item2 with dissolve
    else:
        #Já escolheu
        #Inserir frases correspondentes:
        "Já usei essa pista antes... não é isso..."
        hide screen mostra_item2 with dissolve
    jump IDE_03_2_ESCOLHE_FRASE

label IDE_03_2_ESCOLHEU_VITROLA:
    #Define quem é o item
    $ide_aux_item = pac3_item_vitrola

    #Se o item ainda não foi escolhido
    if(ide_nao_escolhido(ide_aux_item)):
        #Se o item é próximo na ordem de escolha
        if(ide_proximo_correto(ide_aux_item)):
            #Escolheu corretamente!
            #Inserir frases correspondentes:
            "..."
            hide screen mostra_item2 with dissolve
            $ide_escolheu_item(ide_aux_item)
        else:
            #Escolheu ERRADO!
            #Inserir frases correspondentes:
            "Não sei... acho que não é isso..."
            hide screen mostra_item2 with dissolve
    else:
        #Já escolheu
        #Inserir frases correspondentes:
        "Já usei essa pista antes... não é isso..."
        hide screen mostra_item2 with dissolve
    jump IDE_03_2_ESCOLHE_FRASE

label IDE_03_2_ESCOLHEU_VELA:
    #Define quem é o item
    $ide_aux_item = pac3_item_vela

    #Se o item ainda não foi escolhido
    if(ide_nao_escolhido(ide_aux_item)):
        #Se o item é próximo na ordem de escolha
        if(ide_proximo_correto(ide_aux_item)):
            #Escolheu corretamente!
            #Inserir frases correspondentes:
            "..."
            hide screen mostra_item2 with dissolve
            $ide_escolheu_item(ide_aux_item)
        else:
            #Escolheu ERRADO!
            #Inserir frases correspondentes:
            "Não sei... acho que não é isso..."
            hide screen mostra_item2 with dissolve
    else:
        #Já escolheu
        #Inserir frases correspondentes:
        "Já usei essa pista antes... não é isso..."
        hide screen mostra_item2 with dissolve
    jump IDE_03_2_ESCOLHE_FRASE

label IDE_03_2_ESCOLHEU_RADIO:
    #Define quem é o item
    $ide_aux_item = pac3_item_radio

    #Se o item ainda não foi escolhido
    if(ide_nao_escolhido(ide_aux_item)):
        #Se o item é próximo na ordem de escolha
        if(ide_proximo_correto(ide_aux_item)):
            #Escolheu corretamente!
            #Inserir frases correspondentes:
            "..."
            hide screen mostra_item2 with dissolve
            $ide_escolheu_item(ide_aux_item)
        else:
            #Escolheu ERRADO!
            #Inserir frases correspondentes:
            "Não sei... acho que não é isso..."
            hide screen mostra_item2 with dissolve
    else:
        #Já escolheu
        #Inserir frases correspondentes:
        "Já usei essa pista antes... não é isso..."
        hide screen mostra_item2 with dissolve
    jump IDE_03_2_ESCOLHE_FRASE
