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
    (clear red_block)
    (on red_block orange_block)
    (on orange_block purple_block)
    (on purple_block yellow_block)
    (on yellow_block green_block)
    (handempty robot)
) 
(:goal (and 
  (on green_block yellow_block)
  (on yellow_block purple_block)
)) 
)