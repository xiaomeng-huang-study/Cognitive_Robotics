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
(:objects
  purple_block - block
  orange_block - block
  red_block - block
  yellow_block - block
  green_block - block
  robot - robot
)

(:init
  (ontable purple_block)
  (clear orange_block)
  (on orange_block red_block)
  (clear purple_block)
  (on red_block yellow_block)
  (clear red_block)
  (clear yellow_block)
  (handempty robot)
) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block orange_block)
    (on orange_block red_block))) 
)