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
    green_block - block
    yellow_block - block
    pink_block - block
    purple_block - block
    robot - robot
)

(:init
    (ontable green_block)
    (ontable yellow_block)
    (ontable pink_block)
    (ontable purple_block)
    (clear green_block)
    (clear yellow_block)
    (clear pink_block)
    (clear purple_block)
    (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)