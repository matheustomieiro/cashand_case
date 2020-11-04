#TELA DE INVENTARIO DE COLETA: reserva todos os itens coletados por um point-and-click
#LEMBRAR DE RESETAR O VETOR

default idc_item_mostrado = ""
default idc_descricao = ""

transform idc_bot_tr:
    maxsize (140, 140)
    xalign 0.5
    yalign 0.5

transform idc_botao_abrir:
    size (50, 250)
    xalign -0.005
    yalign 0.1

transform idc_botao_fechar:
    idc_botao_abrir
    xzoom -1.0

#itens_no_inventario precisa ter itens na seguinte configuração:
# [string_de_imagem, string_de_descrição, ...]
screen inventario_de_coleta(itens_no_inventario=[]):
    modal True

    hbox:
        frame:
            xalign 0.0
            yalign 0.0
            xsize 200
            ysize 720
            background "#000"
            vbox:
                xsize 1.0
                ysize 1.0
                for item in itens_no_inventario:
                    frame:
                        background "#fff"
                        xsize 180
                        ysize 180
                        margin (10, 20)
                        imagebutton:
                            idle item[0]
                            action [SetVariable("idc_item_mostrado", item[0]),
                                    SetVariable("idc_descricao", item[1]),
                                    Jump("MOSTRA_ITEM_INVENTARIO_COLETA")]
                            at idc_bot_tr
        imagebutton:
            idle pact_img_inv_but
            at idc_botao_fechar
            #idle "images/teste/exit_but.png"
            action Jump("FECHAR_TELA_INVENTARIO")


label FECHAR_TELA_INVENTARIO:
    hide screen inventario_de_coleta
    jump POINT_AND_CLICK

label MOSTRA_ITEM_INVENTARIO_COLETA:
    show screen mostra_item(idc_item_mostrado) with dissolve
    pause 1.0
    "[idc_descricao]"
    hide screen mostra_item with dissolve
    jump POINT_AND_CLICK