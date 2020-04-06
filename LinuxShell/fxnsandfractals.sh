#!/bin/bash
declare -A SCREEN
SCREENR=63
SCREENW=100
DEPTH=0
MAX=16

function create_y {
    local originR=$1
    local originC=$2
    local iteration=$3
    local size=$4
    local originVR=0
    local originVC=0
    local originNYLR=0
    local originNYLC=0
    local originNYRR=0
    local originNYRC=0

    if [[ iteration -gt 0 ]]; then
        for ((i=0;i<$size;i++))
        do
            SCREEN[$(($originR-$i)),$originC]=1
            let originVR="$(($originR-$i))"
        done

        for ((i=1;i<=$size;i++))
        do
             SCREEN[$(($originVR-$i)),$(($originC - $i))]=1
             let originNYLR="$(($originVR-$i))"
             let originNYLC="$(($originC - $i))"
             SCREEN[$(($originVR-$i)),$(($originC + $i))]=1
             let originNYRR="$(($originVR-$i))"
             let originNYRC="$(($originC + $i))"
        done

        create_y $(($originNYLR-1)) $originNYLC $(($iteration-1)) $(echo "$size/2" | bc)
        create_y $(($originNYRR-1)) $originNYRC $(($iteration-1)) $(echo "$size/2" | bc)
    fi  
}

for ((i=1;i<=$SCREENR;i++)) 
do
    for ((j=1;j<=$SCREENW;j++)) 
    do
        SCREEN[$i,$j]='_'
    done
done

read DEPTH

create_y $SCREENR $(echo "$SCREENW/2" | bc) $DEPTH $MAX

for ((i=1;i<=$SCREENR;i++)) do
    for ((j=1;j<=$SCREENW;j++)) do
         printf '%s' "${SCREEN[$i,$j]}"
    done
    echo ""
done

exit 0
