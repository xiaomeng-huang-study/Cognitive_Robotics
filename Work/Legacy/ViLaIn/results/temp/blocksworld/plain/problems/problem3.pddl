(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	pink_block - block
	purple_block - block
	red_block - block
	yellow_block - block
	green_block - block
	robot - robot
) 
(:init
    (ontable green_block)
    (clear purple_block)
    (on yellow_block pink_block)
    (on pink_block green_block)
    (handempty robot) 
(:goal (and
    (on yellow_block green_block)
    (on pink_block green_block)
    (on red_block purple_block))) 
)