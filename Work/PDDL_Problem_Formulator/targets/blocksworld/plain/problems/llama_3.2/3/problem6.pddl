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
    (on purple_block green_block)
    (on orange_block yellow_block)
    (on yellow_block red_block)
    (clear red_block)
    (clear green_block)
    (handempty robot) 
(:goal (and 
    (on green_block yellow_block)
    (on purple_block orange_block)
)) 
)