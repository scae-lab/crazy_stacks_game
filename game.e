note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make
feature
	player1: PLAYER
	player2: PLAYER
	game_deck: DECK

	make
		local
			i: INTEGER
		do
			create player1.make("Adel")
			create player2.make("Catalin")
			create game_deck.make
			from
				i := 1
			until
				i >= 5
			loop
				player1.take_card (game_deck.take_card)
				player2.take_card (game_deck.take_card)
			end
			--print(player1.out)
		end


end
