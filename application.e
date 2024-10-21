note
	description: "crazy_stacks application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	our_deck: DECK
	player1: PLAYER
	make
			-- Run application.
		do
			create our_deck.make
			print(our_deck.out)
			create player1.make("P1")

		end

end
