note
	description: "Summary description for {RANDOM_GENERATOR_WRAPPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RANDOM_GENERATOR_WRAPPER
create
	make
feature -- Initialization
	make
			-- Initialize random generator.
		do
			last_generated_integer := randomizer.item
		end
feature -- Status
	last_generated_integer: INTEGER -- last generated pseudorandom number.
feature -- Basic operations
	generate_bounded_integer (bound1, bound2: INTEGER)
			-- Generate a pseudo-random integer between `bound1` and
			-- bound1 + bound2 -1`.
		require
			bound2_positive: bound2 > 0
		do
				-- Access the first random number. \\: remainder operator.
			last_generated_integer := bound1 + randomizer.item \\ bound2
				-- Advance the generator to the next number in the sequence
			randomizer.forth
		ensure
			bound1 <= last_generated_integer AND last_generated_integer < bound1 + bound2
		end
feature {NONE} -- Implementation
	randomizer: RANDOM
			-- Pseudo-random generator initialized only once.
		once
				-- Create the random number generator using the number of
				-- t’s milliseconds as seed
			create Result.set_seed ((create {TIME}.make_now).milli_second)
				-- Class RANDOM is a sequence (an infinite list):  ‘start’ sets it
				-- to the first valid position
			Result.start
		end

end
