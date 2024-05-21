classiestClassButBadThisTime : class {
    isClassy : (price:int) bool {
        //we all know classy means expensive
        if (price >= 500) {
            return true;
        }

        return false;
    }
    //this is totally real and definitely not fake since I am super classy and don't drive a minivan
    priceOfMyClassyCar : int = 99999999;

     myCarCosts:() int {
        return priceOfMyClassyCar;
     }

}