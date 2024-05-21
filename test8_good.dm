//function decl test
testfunc : () int {}

test: (temp:int) bool {}

tester: (tem:int) bool {return;}

test: (temp:int) bool {woah:int; return;}

test: (temp:int) int {temp--; temp++;}

woah: (this:bool) bool {take too; take too -- what;}

yup: (so:int) int {give intliteral; give - stringliteral;}

okay: (alright:void) bool {while (true) {}}

goo: (goob:int) void {while(false) {goober:int; gooby:bool; return;}}

gooooo: (sup:bool) void {if(false) {if(true){goo:int;}} goo:bool;}

happy: (think:int) bool {if(true) {stinky:bool;} else {stinky:int;}}

mult: (num:int, anothernum:int) int {
    return num*anothernum;
}

main: () int {
    answer:int = mult(2,3);

    num:int = 10;
    anothernum:int = 2;

    anotheranswer = mult(num, anothernum);

    if(answer>anotheranswer) {
        return 1;
    }

    else {
        return 0;
    }
}

classy:class {
    smell:int;
    stinky:bool = true;

    funky: (fart:int, toot:int) bool {
        if (fart>1) {
            if(toot>1) {
                smell=10000;
                stinky = true;
                return true;
            }
        }
        else {
            smell=-100;
            stinky = false;
            return false;
        }
    }
};