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
  (ontable yellow_block)
  (clear green_block)
  (on green_block orange_block)
  (on orange_block blue_block)
  (on blue_block red_block)
  (on red_block yellow_block)
  (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block orange_block)
    (on orange_block red_block)
)) 
)