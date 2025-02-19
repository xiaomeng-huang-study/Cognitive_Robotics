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
  (ontable green_block)
  (ontable yellow_block)
  (clear purple_block)
  (clear orange_block)
  (on green_block yellow_block)
  (on yellow_block red_block)
  (on red_block purple_block)
  (handempty robot) 
(:goal (and 
    (on green_block yellow_block)
    (on yellow_block orange_block)
    (on orange_block purple_block)
)) 
)