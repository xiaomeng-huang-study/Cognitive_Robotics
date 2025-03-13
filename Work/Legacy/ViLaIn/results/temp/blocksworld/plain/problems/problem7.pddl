(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	purple_block - block
	yellow_block - block
	pink_block - block
	green_block - block
	orange_block - block
	robot - robot
) 
(:init
    (ontable red_block)
    (clear purple_block)
    (on purple_block pink_block)
    (on pink_block green_block)
    (on green_block yellow_block)
    (on yellow_block orange_block)
    (handempty robot)
) 
(:goal (and 
    (on yellow_block pink_block)
    (on pink_block green_block)
    (on green_block red_block)
    (on red_block purple_block)
)) 
)