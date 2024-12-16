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
			current_player: PLAYER
	
		do
			create player1.make("Adel", create {RANDOM_STRATEGY}.make)
			create player2.make("Catalin", create {RANDOM_STRATEGY}.make)
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

			current_player := player1
			from
			until
				game_deck.remaining_nr_of_cards = 0
			loop
				
				current_player.take_turn(game_deck,game_discard_pile) -- game_deck or game_discard_pile
				--change the player
				print("%N"+game_discard_pile.out+"%N")
				if current_player=player1 then
					current_player := player2
				else
					current_player := player1
				end
			end
		end


end
