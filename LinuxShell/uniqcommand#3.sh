#compare consecutive lines in a case insensitive manner. So, if a line X is followed by case variants, the output should count all of them as the same (but display only the form X in the second column).

uniq -i -c | cut -c7-
