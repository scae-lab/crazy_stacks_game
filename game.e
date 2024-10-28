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
	game_discard_pile: DISCARD_PILE
	make
		local
			i: INTEGER
		do
			create player1.make("Adel")
			create player2.make("Catalin")
			create game_deck.make
			create game_discard_pile.make
			from
				i := 1
			until
				i > 5
			loop
				player1.take_card (game_deck.take_card)
				player2.take_card (game_deck.take_card)
				i := i+1
			end
			print("%N" + player1.out + "%N")
			print("%N" + player2.out + "%N")
		end


end
