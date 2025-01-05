(define (problem cooking)
(:domain cooking)
(:objects
	cucumber tomato - vegetable
	counter counter2 bowl cutting_board - location
	knife - tool
	a_bot b_bot - robot
)
(:init
    (available cucumber)
    (is-whole cucumber)
    (is-workspace cutting_board)
    (free a_bot)
    (carry b_bot knife)
    (can-cut knife)
    (at cucumber counter)
)
(:goal
    (and
        (at cucumber bowl)
        (at tomato bowl)
        (is-sliced cucumber)
        (is-sliced tomato)
    )
)
)