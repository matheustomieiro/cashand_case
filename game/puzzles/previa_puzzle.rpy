screen previa_puzzle(img_bg = "images/teste/bg_test.png", img_puzzle = "images/teste/puzzle_idle.png", x=0.5, y=0.5):

    frame:
        background img_bg
        xsize 1280
        ysize 720
        add img_puzzle maxsize (1100, 680) xalign x yalign y
