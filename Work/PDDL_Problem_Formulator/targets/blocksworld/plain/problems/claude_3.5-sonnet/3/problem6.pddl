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
    (ontable green_block)
    (ontable red_block)
    (clear purple_block)
    (clear orange_block)
    (clear red_block)
    (clear yellow_block)
    (on red_block yellow_block)
    (handempty robot)
) 
Request error occurred:  
)