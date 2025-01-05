(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	blue_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	pink_block - block
	robot - robot
) 
(:init
    (ontable blue_block)
    (clear green_block)
    (on green_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block pink_block)
    (handempty robot)
) 
(:goal (and 
(on pink_block red_block)
(on red_block yellow_block)
(on yellow_block green_block)
)) 
)