#
# sums a column of currencies in the pros.txt file
# the positive numbers in CURRENCY_COLUMN are deposits
# the negative numbers in CURRENCY_COLUMN are withdrawls
#

#Jun-10-2009	Apr-15-2009	4733480	ABC123 Farmers Credit Trust xxxx0063	One-time	$567.39	Completed
#Dec-17-2008	Oct-23-2008	4224429	ABC123 Farmers Credit Trust xxxx0063	One-time	$732.47	Completed
#May-27-2008	Sep-27-2008	4156123	ABC123 Farmers Credit Trust xxxx0063	One-time	-$2,000.00	Completed
#Oct-12-2007	Sep-18-2007	1787513	ABC123 Farmers Credit Trust xxxx0063	One-time	-$250.00	Completed
#
#
BEGIN { CURRENCY_COLUMN = 10; }
{ 
	if($CURRENCY_COLUMN ~ /^-/) 
	{ 
		gsub(/,/, "", $CURRENCY_COLUMN) ; 
		sum += substr($CURRENCY_COLUMN, 3); 
	}  
	else 
	{ 
		gsub(/,/, "", $CURRENCY_COLUMN); sum -= substr($CURRENCY_COLUMN,2); 
	} 
		
} 
END { print sum; }
