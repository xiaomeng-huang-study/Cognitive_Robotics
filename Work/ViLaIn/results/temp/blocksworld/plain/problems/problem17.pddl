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
    yellow_block - block
    pink_block - block
    green_block - block
    red_block - block
    purple_block - block
    blue_block - block
    robot - robot
)
(:init 
    (ontable yellow_block)
    (clear pink_block)
    (on green_block red_block)
    (on red_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block blue_block)
    (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)