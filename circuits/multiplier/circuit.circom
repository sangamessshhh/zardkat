pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  
   signal input Ainp;
   signal input Binp;

   signal X;
   signal Y;

   signal output Qout;

   component and=AND();
   component or=OR();
   component not=NOT();

   and.a <== Ainp ;
   and.b <== Binp ;
   X <== and.out ;

   not.in <== Binp ;
   Y <== not.out;

   or.a <== X;
   or.b <== Y;
   Qout <== or.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
