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
(:init
    (ontable green_block)
    (ontable purple_block)
    (clear orange_block)
    (clear red_block)
    (clear yellow_block)
    (on orange_block green_block)
    (on green_block purple_block)
    (handempty robot)
) 
(:goal (and
    (on purple_block yellow_block)
    (on yellow_block red_block)
    (on red_block orange_block)
)) 
)