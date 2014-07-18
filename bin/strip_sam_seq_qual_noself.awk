awk -F\\t '{ # use TAB as input field separator
    OFS="\t" # use TAB as output field separator
    if ($1=="@SQ" || $1=="@HD" || $1=="@RG" || $1=="@PG" || $1=="@CO") {
        print
    }
    else if ($1 != $3) {
        # keep the alignment if QNAME != RNAME
        $10="*" # remove SEQ
        $11="*" # remove QUAL
        print
    }
}'
