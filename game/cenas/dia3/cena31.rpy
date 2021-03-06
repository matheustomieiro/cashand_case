label CENA31:
    scene cemiterio
    with Fade(6, 3, 0.5)
    "Mais um enterro foi feito. Tenho certeza que o último. Não deixarei o culpado sair impune."
    "Voltarei antes para a mansão e aguardarei todos lá."

    play sound "audio/sonoplastia/Passos.mp3"
    scene cidade
    with Fade(2,1,0.5)

    play sound "audio/sonoplastia/Passos.mp3"
    scene jardim
    with Fade(2,1,0.5)

    play sound "audio/sonoplastia/Passos.mp3"
    scene fundo preto
    with Fade(2,1,0.5)

    play sound "audio/sonoplastia/AbrindoPorta.mp3"
    $renpy.pause(2, hard=hardPause)

    play sound "audio/sonoplastia/Passos.mp3"
    scene hall
    with Fade(2, 1, 0.5)

    play sound "audio/sonoplastia/FechandoPorta.mp3"
    $renpy.pause(2, hard=hardPause)

    "Todos os três devem estar próximos. Ficarei atento a cada reação, cada detalhe..."
    "Catherine está entrando..."

    play sound "audio/sonoplastia/AbrindoPorta.mp3"
    $renpy.pause(2, hard=hardPause)
    play sound "audio/sonoplastia/FechandoPorta.mp3"
    $renpy.pause(2, hard=hardPause)

    play music "audio/musicas/Pistas.mp3" fadein 4.0

    drc "Meus pêsames, Catherine. Sinto-me impotente diante desses acontecimentos."
    "Preciso ter calma. Observamos as reações pelas palavras. Pelas frases."

    show catherine neutra with dissolve

    cth "É horrível, senhor. Minha sobrinha sempre foi sensível para mortes."
    cth "Tirar sua própria vida desse jeito..."
    cth "É algo horrivél."
    cth "Também penso se poderia ter feito alguma coisa."
    "Não. Ela não tirou a própria vida..."
    drc "Por que ela faria algo assim? Se soubéssemos, poderia ser diferente."
    "Não. Não, ela não teve escolha..."
    cth "Eu entendo. Concordo. É algo horrível."
    cth "Por favor, senhor. Encontre o responsável pela morte de meu tio, sobrinho e pelo Sheppard."
    cth "Kamira estava desperada. Quase posso sentir o desespero dela."
    "Sinto muito, senhorita. Não posso confiar em ninguém. Suas palavras estão vazias nesse momento. Me desculpe."
    drc "Dou minha palavra."
    "Só tenho mais nove horas."
    drc "Encontrarei o culpado entre hoje à noite e amanhã ao amanhecer."
    "Não tenho esse tempo."
    cth "Por favor, apresse-se, detetive. Talvez não tenhamos todo esse tempo."
    "Sim. Não temos. E que observação suspeita."
    drc "Sim, senhorita."

    hide catherine with dissolve

    "Joe permanece conversando com Hugo ali fora."
    "Aguardarei."
    "Mas investigarei o quarto de Joe antes. Ele estará ocupado com a conversa. Da janela de seu quarto posso ver aqui embaixo. Será seguro."

    play sound "audio/sonoplastia/Passos.mp3"
    scene corredor quartos
    with Fade(1, 2, 0.5)

    jump CENA32
