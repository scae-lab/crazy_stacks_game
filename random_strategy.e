class RANDOM_STRATEGY
    inherit STRATEGY 
create
    make
feature

    random_generator: RANDOM_GENERATOR_WRAPPER
    make
        do
            create random_generator.make
        end

    can_play_card(current_player:PLAYER;curr_card:CARD):BOOLEAN
    do
        Result := False
    end

    take_turn(game_deck: DECK; game_discard_pile: DISCARD_PILE; current_player: PLAYER)
        local
            action: INTEGER
            curr_card: CARD
        do
            create random_generator.make
            random_generator.generate_bounded_integer(1,2)
            action := random_generator.last_generated_integer

            
            if action = 1 and current_player.cards_in_hand.count <5 then
                --play card
                current_player.play_card(1)

            else
                --discard
                current_player.discard(1)
            end
            -- first play a card on a player stack or  discard the card in discard pile
            -- second action draw a card either from the deck or the discard pile
            random_generator.generate_bounded_integer(1,2)
            action := random_generator.last_generated_integer
            
            if action = 1 or game_discard_pile.remaining_nr_of_cards = 0 then
                --deck
                curr_card := game_deck.take_card
            else
                --discard
                curr_card := game_discard_pile.take_card
            end


            current_player.take_card(curr_card)

        end
    
    play_card(action:INTEGER)
        do
            
        end

end