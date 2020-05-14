all: README.md

README.md:
	touch README.md
	echo "# Guessing Game" > README.md
	echo "### Most recent 'make' run on $$(date)" >> README.md
	echo "### Number of lines in guessinggame.sh: $$( wc -l guessinggame.sh | egrep -o '[0-9]+')" >> README.md

clean:
	rm README.md
