(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	blue_block - block
	orange_block - block
	yellow_block - block
	purple_block - block
	robot - robot
) 
(:init 
    (ontable yellow_block)
    (clear red_block)
    (clear purple_block)
    (on purple_block blue_block)
    (on blue_block green_block)
    (handempty robot)) 
(:goal (and 
    (on yellow_block orange_block)
    (clear purple_block)
    (on purple_block blue_block)
)) 
)