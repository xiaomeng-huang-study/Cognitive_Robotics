(define (problem blocksworld)
(:domain blocksworld)
(:objects
    green_block - block
    blue_block - block
    yellow_block - block
    red_block - block
    orange_block - block
    pink_block - block
    robot - robot
)
(:init
    (ontable blue_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable orange_block)
    (ontable pink_block)
    (clear blue_block)
    (clear red_block)
    (clear yellow_block)
    (clear green_block)
    (clear orange_block)
    (clear pink_block)
    (handempty robot)
)
(:goal (and (on blue_block pink_block) (on pink_block red_block) (on yellow_block orange_block) (on orange_block green_block) (clear blue_block) (clear yellow_block)))
)