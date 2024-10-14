note
	description: "Summary description for {CARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
    CARD
	inherit ANY redefine out end
create
    make

feature  -- Initialization
    color: STRING
    number: INTEGER
    --is_wild_card: BOOLEAN
    --count_wild_card: INTEGER
    -- face: BOOLEAN
    is_face_up: BOOLEAN

    make (a_color: STRING; a_number: INTEGER )

        require
        -- ~ for comparing string content; = compare just the reference
        -- precondition:
        valid_color: a_color ~ "red" or a_color ~ "green" or a_color ~ "blue" or a_color ~ "orange"
        --valid_type: NOT a_is_wild_card implies (a_number >= 1 and a_number <= 6)
		valid_number: a_number >= 0 and a_number <= 6
            -- Creation of the card
        do
            -- Add your code here
            -- Check in the deck creation so that each card for every combination only
            --is_wild_card := a_is_wild_card
            color := a_color
            number := a_number
            --is_face_up := face_up_decide

        end

    get_color: INTEGER
        -- To be revisited later;
        local
            color_code: INTEGER

        do
            color_code:=0
            --print(color)
            if color ~ "red" then
                color_code:= 1
            end

            if color ~ "green" then
                color_code:=2
            end

            if color ~ "blue" then
                color_code:= 3
            end

            if color ~ "orange" then
                color_code:= 4
            end

            Result:= color_code

        end


    set_face(val_bool: BOOLEAN)
        do
            is_face_up:= val_bool
        end
	out :STRING
     do
        Result := "["+ color +";" +  number.out + "]"
     end
    end


