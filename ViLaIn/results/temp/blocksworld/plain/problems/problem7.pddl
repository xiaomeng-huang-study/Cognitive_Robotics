(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	green_block - block
	yellow_block - block
	purple_block - block
	orange_block - block
	pink_block - block
	robot - robot
) 
(:init
    (ontable green_block)
    (clear red_block)
    (on red_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block orange_block)
    (on orange_block pink_block)
    (handempty robot)
) 
(:goal (and 
    (on yellow_block pink_block)
    (on pink_block green_block)
    (on green_block red_block)
    (on red_block purple_block)
    (on purple_block blue_block)
)) 
)