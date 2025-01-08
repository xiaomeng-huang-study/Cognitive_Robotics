(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	blue_block - block
	orange_block - block
	green_block - block
	yellow_block - block
	robot - robot
) 
(:init (ontable yellow_block) (clear red_block) (on red_block blue_block) (on blue_block green_block) (handempty robot)) 
(:goal (and (on yellow_block red_block) (on red_block blue_block) (on blue_block orange_block) (on orange_block green_block))) 
)