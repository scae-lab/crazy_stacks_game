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
			currrent_player: PLAYER
	
		do
			create player1.make("Adel")
			create player2.make("Catalin")
			-- card distribution
			
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

			currrent_player := player1
			from
			until
				game_deck.remaining_nr_of_cards = 0
			loop
				
				currrent_player.take_card(game_deck.take_card)
				--change the player
				if currrent_player=player1 then
					currrent_player := player2
				else
					currrent_player := player1
				end
			end
		end


end
