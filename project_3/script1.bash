read -p 'enter first number: ' num1
read -p 'enter second number: ' num2

if ! [[ $num1 =~ ^[0-9]+$ ]];
then echo "error: variable 1 not a number"; exit 1
elif ! [[ $num2 =~ ^[0-9]+$ ]];
then echo "error: variable 2 not a number"; exit 1
fi

echo "sum is: " $(($num1 + $num2))

if (($num1 > $num2))
then
  echo "bigger number is: " $num1
elif (($num1 < $num2))
then
  echo "bigger number is: " $num2
else
  echo "they are equal"
fi


