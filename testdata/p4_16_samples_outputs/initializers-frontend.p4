extern Fake {
    Fake();
    void call(in bit<32> data);
}

parser P() {
    @name("x") bit<32> x_0;
    @name("fake") Fake() fake_0;
    state start {
        x_0 = 32w0;
        fake_0.call(x_0);
        transition accept;
    }
}

control C() {
    @name("x") bit<32> x_1;
    @name("y") bit<32> y_0;
    @name("fake") Fake() fake_1;
    bit<32> tmp;
    apply {
        x_1 = 32w0;
        tmp = x_1 + 32w1;
        y_0 = tmp;
        fake_1.call(y_0);
    }
}

parser SimpleParser();
control SimpleControl();
package top(SimpleParser prs, SimpleControl ctrl);
top(P(), C()) main;