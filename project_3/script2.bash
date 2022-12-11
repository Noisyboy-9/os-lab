# !/bin/bash
operand1=12;
operand2=2;
operator="/"
result=0;

case $operator in
    "+")
    result=$(($operand1+$operand2));
    ;;

    "-")
    result=$(($operand1-$operand2));
    ;;

    "*")
    result=$(($operand1*$operand2));
    ;;

    "/")
    result=$(($operand1/$operand2));
    ;;
esac

echo $result