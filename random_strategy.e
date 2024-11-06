class RANDOM_STRATEGY
    inherit STRATEGY redefine make end
create
    make
feature

    random_generator: RANDOM_GENERATOR_WRAPPER
    make(a_current_player: PLAYER)
        do
            precursor(a_current_player)
            create random_generator.make
        end

    take_turn(game_deck: DECK; game_discard_pile: DISCARD_PILE)
        local
            action: INTEGER
            curr_card: CARD
        do
            create random_generator.make
            random_generator.generate_bounded_integer(1,2)
            action := random_generator.last_generated_integer
            
            if action = 1 then
                --play card
                curr_card := game_deck.take_card
                current_player.take_card(curr_card)
            else
                --discard
                -- find the card to discard and then discard
                random_generator.generate_bounded_integer(1,5)
                action := random_generator.last_generated_integer
                current_player.discard(action)
                --current_player.discard(curr_card)
            end
            -- first play a card on a player stack or  discard the card in discard pile
            -- second action draw a card either from the deck or the discard pile

        end
    
    play_card(action:INTEGER)
        do
            
        end

end