#include <iostream>
#include <fstream>
#include <vector>
#include <iomanip>

using namespace std;

// centralna diferenčna shema
double CentralDifference(vector<double>& x, vector<double>& fx, int i, double dx) {
    return (fx[i + 1] - fx[i - 1]) / (2 * dx);
}

// odvod naprej
double ForwardDifference(vector<double>& x, vector<double>& fx, int i, double dx) {
    return (-3 * fx[i] + 4 * fx[i + 1] - fx[i + 2]) / (2 * dx);
}

// odvod nazaj
double BackwardDifference(vector<double>& x, vector<double>& fx, int i, double dx) {
    return (3 * fx[i] - 4 * fx[i - 1] + fx[i - 2]) / (2 * dx);
}

int main() {
    ifstream inputFile("poly.txt");
    ofstream outputFile("diff_poly.txt");

    if (!inputFile) {
        cerr << "Napaka pri odpiranju vhodne datoteke 'poly.txt'" << endl;
        return 1;
    }

    if (!outputFile) {
        cerr << "Napaka pri odpiranju izhodne datoteke 'diff_poly.txt'" << endl;
        return 1;
    }

    int n;
    inputFile >> n; 

    vector<double> x(n);
    vector<double> fx(n);

   
    for (int i = 0; i < n; ++i) {
        inputFile >> x[i] >> fx[i];
    }

    
    double dx = x[1] - x[0]; 

    for (int i = 0; i < n; ++i) {
        double centralDiff = CentralDifference(x, fx, i, dx);

        
        outputFile << "Odvod f'(" << x[i] << ") = " << centralDiff << endl;
    }

    cout << "Odvodi so bili uspešno izračunani in shranjeni v datoteko 'diff_poly.txt'" << endl;

    return 0;
}