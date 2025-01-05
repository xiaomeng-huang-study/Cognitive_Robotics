(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        orange_block - block
        red_block - block
        pink_block - block
        robot - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (clear purple_block)
        (on purple_block blue_block)
        (ontable pink_block)
        (clear red_block)
        (handempty robot)
    )
    (:goal (and 
        (on orange_block yellow_block) 
        (on yellow_block purple_block) 
        (on purple_block red_block)))
)