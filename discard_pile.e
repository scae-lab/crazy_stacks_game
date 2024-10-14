note
	description: "Summary description for {DISCARD_PILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    DISCARD_PILE
    inherit ANY --redefine out end

create
    make

feature {NONE} -- Initialization

    list_of_cards: ARRAY[CARD]
    is_empty: BOOLEAN


    make
        do
        	create list_of_cards.make_empty
            is_empty:= True
        end

    add_card(a_card: CARD)
        do
            list_of_cards.extend(a_card)
        end
end
