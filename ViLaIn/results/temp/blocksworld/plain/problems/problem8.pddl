(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	orange_block - block
	pink_block - block
	robot - robot
) 
(:init
    (ontable green_block)
    (ontable yellow_block)
    (ontable purple_block)
    (clear red_block)
    (on red_block orange_block)
    (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block pink_block)
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)