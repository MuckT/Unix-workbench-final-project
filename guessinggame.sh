#!/usr/bin/env bash
# Filename: guessinggame.sh

echo "Guess the numbers of files in the current directory!"
read  response
local_solved=1

function get_file_count {
  echo $(ls -q | wc -l)
}

function is_a_number {
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    echo "Whole Number"
  else
    echo "Not Whole Number"
  fi
}

## Test cases for the functions
#echo "File count is:" $(get_file_count)
#echo "Should return 'Whole Number':" $(is_a_number "2")
#echo "Should return 'Not Whole Number':" $(is_a_number "-2")

while [[ $local_solved -eq 1 ]]
do
  if [[ $(is_a_number "$response") == "Not Whole Number" ]]
  then
    echo "Enter a whole number. Guess again!"
    read response 
  elif [[ $(get_file_count) -eq $response ]]
  then
    echo "You guessed correctly!"
    let local_solved=0
  elif [[ $(get_file_count) -gt $response ]]
  then
    echo "You guessed too low. Guess Again!"
    read response
  elif [[ $(get_file_count) -lt $response ]]
  then
    echo "You guessed too high. Guess Again!"
    read response
  else
    echo "Something unexpected happened."
    exit
  fi
done
