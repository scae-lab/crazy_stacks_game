note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"



class
    PLAYER

create
    make

feature {NONE} -- Initialization
    name: STRING
    --number: INTEGER
    cards_in_hand: ARRAY[CARD]
    stack_red: ARRAY[CARD]
    stack_green: ARRAY[CARD]
    stack_blue: ARRAY[CARD]
    stack_orange: ARRAY[CARD]
    want_card_from_deck: BOOLEAN
    want_card_from_discard_pile: BOOLEAN
    card_to_be_discarded: detachable CARD
    --a_card: CARD

    make (a_name: STRING) --; a_number: INTEGER )

            -- Creation of the player
        do
            name := a_name
            --number := a_number
			create cards_in_hand.make_empty
			create stack_red.make_empty
			create stack_green.make_empty
			create stack_orange.make_empty
			create stack_blue.make_empty


        end


    set_want_card_deck(val_bool: BOOLEAN)
        do
            want_card_from_deck:= val_bool
        end

	set_want_card_discard_pile(val_bool: BOOLEAN)
        do
            want_card_from_discard_pile:= val_bool
        end

    take_card(a_card: CARD)
        do
            cards_in_hand.force(a_card, cards_in_hand.capacity + 1)
            want_card:= False
        end

    play_card(index: INTEGER)
        require
            index <= cards_in_hand.capacity
        local
            a_card: CARD
        do
            a_card:= cards_in_hand[index]
            a_card.set_face(True)
            cards_in_hand.prune(cards_in_hand[index])

            if a_card.get_color = 1 then
            	if a_card.number = 0 then
            		if stack_red.capacity = 0 then
            			stack_red.extend (a_card)
            		else
            			print("You can only play wildcards at the beginning of the stack")
            		end
            	else
            		stack_red.extend(a_card)
            	end
            end

			if a_card.get_color = 2 then
            	if a_card.number = 0 then
            		if stack_green.capacity = 0 then
            			stack_green.extend (a_card)
            		else
            			print("You can only play wildcards at the beginning of the stack")
            		end
            	else
            		stack_green.extend(a_card)
            	end
            end


            if a_card.get_color = 3 then
                stack_blue.extend(a_card)
            end

            if a_card.get_color = 4 then
                stack_orange.extend(a_card)
            end
        end

    discard(index: INTEGER)
        require
            index <= cards_in_hand.capacity

        do
            card_to_be_discarded := cards_in_hand[index]
            card_to_be_discarded.set_face(False)
            cards_in_hand.prune(cards_in_hand[index])
        end



    get_sum_points: INTEGER
        require
        	stack_red.capacity > 1

        local
            partial_sum: INTEGER
            total_sum: INTEGER
            multiplier: INTEGER

            aux: INTEGER
        do
            partial_sum := 0
            total_sum := 0
            multiplier := 1

            if stack_red[1].number = 0 then
                multiplier := 2
            end

            across 1 |..| stack_red.capacity as i loop
                partial_sum:= partial_sum + stack_red[i.item].number
            end
            partial_sum:=  multiplier*partial_sum
            total_sum:= total_sum + partial_sum
            partial_sum:=0
            multiplier:= 1


            if stack_green[1].number = 0 then
                multiplier := 2
            end

            across 1 |..| stack_green.capacity as i loop
                partial_sum:= partial_sum + stack_green[i.item].number
            end
            partial_sum:= multiplier*partial_sum
            total_sum:= total_sum + partial_sum
            partial_sum:=0
            multiplier:= 1


            if stack_blue[1].number = 0 then
                multiplier := 2
            end

            across 1|..| stack_blue.capacity as i loop
                partial_sum:= partial_sum + stack_blue[i.item].number
            end
            partial_sum:=  multiplier*partial_sum
            total_sum:= total_sum + partial_sum
            partial_sum:= 0
            multiplier:= 1


            if stack_orange[1].number = 0 then
                multiplier := 2
            end

            across 1|..| stack_orange.capacity as i loop
                partial_sum:= partial_sum + stack_orange[i.item].number
            end
            partial_sum:= multiplier*partial_sum
            total_sum:= total_sum + partial_sum
            partial_sum:= 0
            multiplier:= 1

            Result:= total_sum
        end

     --out :STRING


end
