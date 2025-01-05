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
    (ontable yellow_block)
    (clear green_block)
    (on green_block orange_block)
    (on orange_block blue_block)
    (on blue_block red_block)
    (on red_block purple_block)
    (handempty robot)
) 
(:goal (and 
    (on yellow_block orange_block)
    (on orange_block green_block)
    (on blue_block pink_block)
    (on pink_block red_block)
)) 
)