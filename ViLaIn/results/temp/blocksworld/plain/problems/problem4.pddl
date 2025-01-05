(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	blue_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	orange_block - block
	pink_block - block
	robot - robot
) 
(:init
    (ontable blue_block)
    (ontable green_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable pink_block)
    (clear red_block)
    (clear purple_block)
    (handempty robot)
) 
(:goal (and 
    (on blue_block green_block)
    (on yellow_block orange_block)
    (on purple_block red_block)
)) 
)