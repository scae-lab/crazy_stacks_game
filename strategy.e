-- STRATEGY

deferred class
    STRATEGY

feature
    current_player: PLAYER
    make(a_current: PLAYER)
        do
            current_player := a_current
        end
    take_turn(game_deck: DECK;game_discard_pile: DISCARD_PILE) deferred end

end -- STRATEGY
