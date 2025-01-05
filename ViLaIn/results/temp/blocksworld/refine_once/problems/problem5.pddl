(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red_block - block
        blue_block - block
        green_block - block
        yellow_block - block
        orange_block - block
        pink_block - block
        robot - robot
    )
    (:init
        (ontable pink_block)
        (clear red_block)
        (clear blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear orange_block)
        (handempty robot)
    )
    (:goal (and 
        (on red_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block green_block)
    ))
)