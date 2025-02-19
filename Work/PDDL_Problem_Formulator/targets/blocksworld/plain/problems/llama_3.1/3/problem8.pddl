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
    (clear yellow_block)
    (clear green_block)
    (on red_block purple_block)
    (on purple_block orange_block)
    (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on purple_block orange_block)
)) 
)