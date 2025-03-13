(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	yellow_block - block
	pink_block - block
	purple_block - block
	orange_block - block
	red_block - block
	robot - robot
) 
(:init
    (ontable pink_block)
    (clear purple_block)
    (on purple_block orange_block)
    (on orange_block yellow_block)
    (on yellow_block red_block)
    (handempty robot)
) 
(:goal (and 
    (on pink_block purple_block)
    (clear orange_block)
    (on yellow_block orange_block)
)) 
)