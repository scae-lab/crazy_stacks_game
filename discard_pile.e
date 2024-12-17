note
	description: "Summary description for {DISCARD_PILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    DISCARD_PILE
    inherit ANY redefine out end

create
    make

feature  -- Initialization

    list_of_cards: ARRAY[CARD]
    is_empty: BOOLEAN
	card_removed: detachable CARD
	remaining_nr_of_cards: INTEGER
    make
        do
        	create list_of_cards.make_empty
            is_empty:= True
			remaining_nr_of_cards := 0
        end

    add_card(a_card: CARD)

        do
            list_of_cards.force(a_card, list_of_cards.capacity +1)
            remaining_nr_of_cards := remaining_nr_of_cards + 1
        ensure
        	card_added: remaining_nr_of_cards = old remaining_nr_of_cards + 1
        end

    take_card: CARD
    	require
    		remaining_nr_of_cards >=1
        do
            Result:= list_of_cards[list_of_cards.upper]
            list_of_cards.remove_tail(1)
            remaining_nr_of_cards:= remaining_nr_of_cards - 1
        ensure
        	remaining_nr_of_cards = old remaining_nr_of_cards - 1
        end

    out :STRING
     local
     	i: INTEGER
     do
         Result:= "{"
         from
         	i:= list_of_cards.lower
         until
         	i> list_of_cards.upper
         loop
         	Result:= Result + list_of_cards[i].out
         	i := i+1
         end

        Result := Result + "}" + "{" + remaining_nr_of_cards.out + "}"
     end
    invariant
     	discard_pile_range_nr_cards: list_of_cards.capacity >= 0 and list_of_cards.capacity <= 28
end
