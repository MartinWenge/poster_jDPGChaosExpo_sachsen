TEMPNAME=$(tempfile -d . -s ".${1##*.}")
convert $1 -gravity South -background white -splice 0x1  -background black \
        -splice 0x1  -trim  +repage -chop 0x1 \
         $TEMPNAME
convert $TEMPNAME -background white -splice 0x1  -background black \
         -splice 0x1  -trim  +repage -chop 0x1 \
         $1
rm $TEMPNAME
