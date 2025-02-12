(define (problem hanoi)
(:domain hanoi)
(:objects
	peg1
	peg2
	peg3
	green_disk1
	orange_disk1
	orange_disk2
)
(:init
        (clear peg2)
        (clear peg3)
        (clear orange_disk1)
        (on green_disk1 peg1)
        (smaller peg1 green_disk1)
        (smaller peg2 green_disk1)
        (smaller peg3 green_disk1)
        (smaller orange_disk1 green_disk1)
    )
(:goal (and (on pink_disk1 peg3) (on orange_disk1 pink_disk1) (on blue_disk1 orange_disk1) (on green_disk2 blue_disk1) (on green_disk1 green_disk2)))
)