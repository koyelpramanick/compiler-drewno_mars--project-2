addEmUp : (num1:int, num2:int) int {
    return num1+num2;
}

main : () int {
    answer1:int = addEmUp(-5,7);

    num1:int = 10;
    num2:int = 80;

    answer2:int = addEmUp(num1,num2);

    if (answer1 > answer2 > 5) {
        return 1;
    }

    else {
        return 0;
    }
}