(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	pink_block - block
	robot - robot
) 
(:init
    (ontable green_block)
    (ontable yellow_block)
    (clear purple_block)
    (clear pink_block)
    (on purple_block red_block)
    (on red_block green_block)
    (on pink_block yellow_block)
    (handempty robot)
) 
(:goal (and 
    (on yellow_block green_block)
    (on pink_block yellow_block)
    (on purple_block red_block)
)) 
)