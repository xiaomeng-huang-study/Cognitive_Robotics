(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	purple_block - block
	orange_block - block
	red_block - block
	yellow_block - block
	green_block - block
	robot - robot
) 
(:objects 
    blue_block - block
    red_block - block
    purple_block - block
    pink_block - block
    robot - robot
)

(ontable blue_block)
(on blue_block red_block)
(on red_block purple_block)
(on purple_block pink_block)
(handempty robot) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)