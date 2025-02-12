(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	orange_block - block
	red_block - block
	purple_block - block
	pink_block - block
	yellow_block - block
	green_block - block
	robot - robot
) 
(:init (ontable red_block) (clear orange_block) (on purple_block pink_block) (on pink_block yellow_block) (on yellow_block green_block) (on green_block red_block) (handempty robot)) 
(:goal (and
    (on purple_block pink_block)
    (on pink_block yellow_block)
    (on yellow_block green_block)
    (clear orange_block)
    (on orange_block red_block)
)) 
)