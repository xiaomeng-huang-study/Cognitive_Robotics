(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	blue_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	orange_block - block
	robot - robot
) 
(:init
    (ontable yellow_block)
    (ontable green_block)
    (ontable blue_block)
    (clear red_block)
    (on purple_block orange_block)
    (handempty robot)
) 
(:goal (and 
    (on purple_block blue_block)
    (on blue_block green_block)
    (on green_block yellow_block)
    (on yellow_block red_block)
    (on red_block orange_block)
)) 
)