read -p "enter x:" x;
read -p "enter y:" y;
read -p "enter filename:" filename;
counter=0;

while IFS= read -r line
do
    counter=$(($counter+1))
    if (($counter >= $x && $counter <= $y))
    then
        echo $line
    fi 
done < "$filename"