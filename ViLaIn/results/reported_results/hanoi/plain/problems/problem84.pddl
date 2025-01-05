(define (problem hanoi)
(:domain hanoi)
(:objects
	peg1
	peg2
	peg3
	peg4
	peg5
	blue_disk1
	green_disk1
	blue_disk2
	orange_disk1
)
(:init
        (clear peg2)
        (clear peg3)
        (clear green_disk2)
        (on peg1 blue_disk1)
        (on blue_disk1 green_disk1)
        (on green_disk1 orange_disk1)
        (smaller peg2 peg1)
        (smaller peg2 blue_disk1)
        (smaller peg2 green_disk1)
        (smaller peg2 orange_disk1)
        (smaller peg3 peg1)
        (smaller peg3 blue_disk1)
        (smaller peg3 green_disk1)
        (smaller peg3 orange_disk1)
        (smaller green_disk2 peg1)
        (smaller green_disk2 blue_disk1)
        (smaller green_disk2 green_disk1)
        (smaller green_disk2 orange_disk1)
    )
(:goal (and (on pink_disk1 peg3) (on orange_disk1 pink_disk1) (on blue_disk1 orange_disk1) (on green_disk2 blue_disk1) (on green_disk1 green_disk2)))
)