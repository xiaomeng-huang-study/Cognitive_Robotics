(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue_block - block
        purple_block - block
        orange_block - block
        pink_block - block
        robot - robot
        red_block - block
    )
    (:init
        (ontable blue_block)
        (clear purple_block)
        (clear orange_block)
        (clear pink_block)
        (handempty robot)
    )
    (:goal (and 
        (on purple_block pink_block)
        (on pink_block blue_block)
        (on blue_block red_block)
    ))
)