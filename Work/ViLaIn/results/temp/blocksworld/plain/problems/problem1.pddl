(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	green_block - block
	yellow_block - block
	pink_block - block
	robot - robot
) 
(:init (ontable yellow_block) (clear green_block) (clear red_block) (on green_block pink_block) (on pink_block yellow_block) (handempty robot)) 
(:goal (and (on red_block yellow_block) (on yellow_block green_block) (on pink_block yellow_block))) 
)