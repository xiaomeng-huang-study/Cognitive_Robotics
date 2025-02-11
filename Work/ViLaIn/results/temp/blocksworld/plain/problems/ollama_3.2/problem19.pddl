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
(:init 
    (ontable green_block)
    (ontable yellow_block)
    (clear blue_block)
    (on blue_block red_block)
    (clear purple_block)
    (clear orange_block)
    (clear pink_block)
    (handempty robot) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block orange_block)
    (on orange_block red_block)
)) 
)