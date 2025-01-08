(define (problem blocksworld) 
(:domain blocksworld) 
(:objects
	red_block - block
	blue_block - block
	purple_block - block
	pink_block - block
	robot - robot
) 
(:init (ontable red_block) (ontable blue_block) (clear purple_block) (on purple_block pink_block)) 
(:goal (and 
    (on red_block blue_block)
    (on blue_block purple_block)
    (on purple_block pink_block)
)) 
)