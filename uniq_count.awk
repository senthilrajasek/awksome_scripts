#number of unique entries in the first field of a tab
# separated file
#usage awk -f uniq_count.awk test.tsv
BEGIN {
    FS = "[ \t]+"
    count = 0
}
{
    if ( ($1 != "") && !($1 in names) )
        names[$1] = 1 
}
END {
    for( name in names ) {
        count += 1
    }

    print count
}

