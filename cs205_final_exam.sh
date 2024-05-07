# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

# Pass first positional parameter, the file name, into filename
filename="$1"

# I'm assuming that pokemon variants, such as mega evolution forms, are 
# counted as different pokemon, so we can count by line to differentiate 
# this from the count presented EOF. NR > 1 skips the header, then 
# iterates through lines and passes final count as the total amount
total_pokemon=$(awk 'NR > 1 { count++ } END { print count }' "$1")

# Iterate through every line but the header and take the sixth 
# positional parameter, which should be HP assuming correct formatting, 
# and then calculate average at the end.
average_hp=$(awk 'NR > 1 { sum+=$6 } END { print sum/NR }' "$1")

# Similarly to average_hp, iterate through every line but the header, 
# then take the seventh positional parameter, which should be attack, 
# then calculate average at the end.
average_attack=$(awk 'NR > 1 { sum+=$7 } END { print sum/NR }' "$1")


# Print our summary of the data file provided
# Print summary
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $average_hp"
echo "   Avg. Attack: $average_attack"
echo "===== END SUMMARY ====="
