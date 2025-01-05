(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red_block - block
        yellow_block - block
        purple_block - block
        orange_block - block
        pink_block - block
        robot - robot
    )
    (:init
        (ontable yellow_block)
        (clear red_block)
        (on red_block purple_block)
        (on purple_block orange_block)
        (on orange_block pink_block)
        (handempty robot)
    )
    (:goal (and 
        (on yellow_block orange_block)
        (clear yellow_block)
        (on purple_block pink_block)
        ))
)