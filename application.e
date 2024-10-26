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

	game_crazy_stacks: GAME
	make
			-- Run application.
		do
			create game_crazy_stacks.make

		end

end
