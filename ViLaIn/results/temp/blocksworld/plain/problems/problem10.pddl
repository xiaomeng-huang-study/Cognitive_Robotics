(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	pink_block - block
	blue_block - block
	red_block - block
	yellow_block - block
	orange_block - block
	green_block - block
	robot - robot
) 
(:init (ontable green_block) (clear red_block) (on red_block orange_block) (on orange_block purple_block) (on purple_block pink_block) (on pink_block yellow_block) (on yellow_block blue_block) (handempty robot)) 
(:goal (and 
    (on pink_block red_block)
    (on yellow_block orange_block)
    (on green_block blue_block)
)) 
)