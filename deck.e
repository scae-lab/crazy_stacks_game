note
	description: "Summary description for {DECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"


class
    DECK
    inherit ANY redefine out end

create
    make

feature  -- Initialization
    remaining_nr_of_cards: INTEGER
    --number_of_wild_cards: INTEGER
    list_of_cards: ARRAY[CARD]
    card_removed: detachable CARD
    -- face: BOOLEAN

     make

        require
        -- ~ for comparing string content; = compare just the reference
        local
            number: INTEGER
            rand_nr1: INTEGER
            rand_nr2: INTEGER
            aux: CARD
            current_card: CARD
            rand_gen_wrap: RANDOM_GENERATOR_WRAPPER
			i: INTEGER

        do
            -- Add your code here

		    create rand_gen_wrap.make
			create list_of_cards.make_empty

            i:=1
            from
            number := 0
            until number = 7
            loop
                create current_card.make("red",number)
                list_of_cards.force(current_card,i)
                i:=i+1
                create current_card.make("blue",number)
                list_of_cards.force(current_card,i)
                i:=i+1
                create current_card.make("green",number)
                list_of_cards.force(current_card,i)
                i:=i+1
                create current_card.make("orange",number)
                list_of_cards.force(current_card,i)
                i:=i+1
                number := number +1

            end

            remaining_nr_of_cards:= list_of_cards.capacity


            -- Now shuffle the deck
            from number := 1
            until number = 27
            loop
                rand_gen_wrap.generate_bounded_integer (1, 28)
                rand_nr1 := rand_gen_wrap.last_generated_integer
               	rand_gen_wrap.generate_bounded_integer (1, 28)
                rand_nr2 := rand_gen_wrap.last_generated_integer

                aux := list_of_cards[rand_nr2]
                list_of_cards[rand_nr2] := list_of_cards[rand_nr1]
                list_of_cards[rand_nr1] := aux
                number := number + 1
            end

            ensure
            	correct_nr_of_cards: remaining_nr_of_cards = 28
        end

    take_card: CARD
		local
			aux_card: CARD
    	--require
    		--remaining_nr_of_cards >=1
        do
            aux_card := list_of_cards[list_of_cards.upper]
           	Result := aux_card
            list_of_cards.remove_tail(1)
            remaining_nr_of_cards := remaining_nr_of_cards - 1

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
     	deck_range_nr_cards: list_of_cards.capacity >= 0 and list_of_cards.capacity <= 28
end
