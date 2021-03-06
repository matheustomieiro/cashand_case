#CHAMA A TELA DE UM LIGHTS_OUT PUZZLE 3X3

label LIGHTS_OUT_PUZZLE_3X3:

    #Variáveis que precisam ser determinadas antes de chamar a tela:
    python:
        #Teremos 9 peças
        lop_fim = False
        lop_pecas = [False] * 9
        #Define o tamanho das peças
        lop_tam_peca = 200
        #Define as imagens das peças
        lop_img_pecas = ["images/teste/puzzle/9.png", "images/teste/puzzle/8.png", "images/teste/puzzle/7.png",
                         "images/teste/puzzle/6.png", "images/teste/puzzle/5.png", "images/teste/puzzle/4.png",
                         "images/teste/puzzle/3.png", "images/teste/puzzle/2.png", "images/teste/puzzle/1.png"]
        lop_configuracoes = [
        [False, False, False, False, False, False, False, False, False]
        #,[False, True,  False, False, True,  False, False, False, True]
        ]

        lop_pecas = renpy.random.choice(lop_configuracoes)
        lop_game_over_label = "FIM_LOP_3x3"
        lop_sucesso_label = "SUCESSO_LOP_3X3"
        lop_timer_total = 180.0
        lop_timer_quase = 30.0

    play music "audio/musicas/Descobrimento.mp3" fadein 5.0

    #Chama a tela
    call screen lights_out_puzzle(3) with puzzle_transition8
    return

label FIM_LOP_3x3:
    #stop music fadeout 5.0
    hide screen lights_out_puzzle with puzzle_transition8
    "Droga, vou tentar novamente..."
    jump LIGHTS_OUT_PUZZLE_3X3

label SUCESSO_LOP_3X3:
    stop music fadeout 5.0
    hide screen lights_out_puzzle with puzzle_transition8
    return
