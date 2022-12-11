# !/bin/bash
operand1=-12.6;
operand2=2;
operator="/"
result=0;

case $operator in
    "+")
    result=$(echo $operand1 + $operand2 | bc);
    ;;

    "-")
    result=$(echo $operand1 - $operand2 | bc);
    ;;

    "*")
    result=$(echo $operand1 * $operand2 | bc);
    ;;

    "/")
    result=$(echo scale=2\;$operand1 / $operand2 | bc);
    ;;
esac

echo $result