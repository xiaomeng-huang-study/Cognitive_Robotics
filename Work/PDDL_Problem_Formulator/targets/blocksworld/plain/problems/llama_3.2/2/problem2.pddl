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

(ontable purple_block)
(on table orange_block)
(on table red_block)
(on table yellow_block)
(on table green_block)
(handempty robot) 
(:goal (and
    (on green_block yellow_block)
    (on purple_block orange_block)
    (on purple_block red_block)
)) 
)