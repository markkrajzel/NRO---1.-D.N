#include <iostream>
#include <cmath>


//Izračun arctan(x) s pomočjo Taylorjeve vrste
double arctan(double x, int iteracije) {
    double TV = 0.0;
    double t2;
    double t1;

    for (double n = 0; n <= iteracije; n++) {
        t1 = pow(x, 2 * n + 1) * pow(-1, n);
        t2 = t1 / (2 * n + 1);
        TV += t2;
    }

    return TV;
}


//Izračun e^3x
double eksp_3x(double x) {
    return exp(3 * x);
 }

//Funkcija za integracijo s trapezno metodo
double trapez_int (double (*f)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double rez = 0.5 * (f(a) + f(b));

    for (int i = 1; i < n; ++i) {
        double x = a + i * h;
        rez += f(x);
    }
    return h * rez;
}


int main() {
    double pi = acos(-1);
    double a = 0;
    double b = pi / 4;
    int n = 1000;

    double rez = trapez_int([](double x) {
        return eksp_3x(x) * arctan(x / 2.0, 100);
        }, a, b, n);
    
    std::cout << "Vrednost integrala: " << rez << std::endl;
    return 0;

}