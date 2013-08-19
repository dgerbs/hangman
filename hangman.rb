#!/usr/bin/env ruby

# ADD EXECUTABLE PERMISSION
# chmod +x hangman.rb

puts "\nWELCOME to HANGMAN!\n\n"

words = [ "apple", "xylophone", "zebra", "foobar", "message" ]
word = words.sample
chances = 8
display = '_' * word.length

loop do
	puts "Word: " + display
	puts "Chances remaining: #{chances}"

	print "Guess a single letter (a-z) or the entire word: "
	response = gets.chomp

	if response.length == 1 && word.include?(response)	
		# Update word displayed to user
		puts "\nFound #{word.scan(response).length} occurance(s) of the character #{response}.\n\n"
		word.length.times do |i|
			display[i] = response if word[i] == response
		end
		# If no letter is found
	elsif response.length == 1 && !word.include?(response) 
		chances -= 1
		puts "\nSorry, no " + response + "'s found.\n\n"
	end
		# Word is guessed, end game
	if response == word || display == word
		print "Congratulations, you've guessed the word!\n\n"
		break
	end
		# Player runs out of chances, end game
	if chances <= 0
		puts "You're out of chances, better luck next time..."
		break
	end
end
