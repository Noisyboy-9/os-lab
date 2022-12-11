while true
do
    sum=0
    echo "please enter a number:"
    read number 
    if ! [[ $number =~ ^[0-9]+$ ]];
    then echo "error: variable 1 not a number"; exit 1
    fi
    strlen=${#number}
    reverse_str=""
    for (( i=$strlen-1; i>=0; i-- ))
    do
        reverse_str=$reverse_str${number:$i:1}
    done

    for (( i=$strlen-1; i>=0; i-- ))
    do
        sum=$(($sum+${number:$i:1} )) 
    done

    echo "Original String : $number"
    echo "Reversed String : $reverse_str"
    echo "Sum : $sum"
done
