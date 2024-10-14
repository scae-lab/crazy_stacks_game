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
	make
			-- Run application.
		do
			create our_deck.make
			print(our_deck.out)

		end

end
