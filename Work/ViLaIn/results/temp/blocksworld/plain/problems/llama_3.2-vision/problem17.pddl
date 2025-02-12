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
    (ontable purple_block)
    (ontable orange_block)
    (clear red_block)
    (on red_block yellow_block)
    (on yellow_block green_block)
    (on green_block purple_block)
    (on orange_block red_block)
    (handempty robot)
) 
(:goal (and 
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)