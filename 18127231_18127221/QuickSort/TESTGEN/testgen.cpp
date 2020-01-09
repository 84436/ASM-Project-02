#include <bits/stdc++.h>
using namespace std;

int main() {
    random_device rd;
    ofstream fout("../input_sort.txt");
    if (!fout.is_open())
        abort();
    int n;
   n = rd()%99 + 2;  //2  < n < 1000
    //n = 7;
    fout << n << endl;
    vector<int> array(n);
    for (int i = 0;i < n;i++)
    {
        array[i] = rd()%1000;
        array[i] = abs(array[i]);
        fout << array[i];
        if (i != n - 1)
            fout << " ";
    }
    fout << endl;

    fout.close();
    fout.open("../output_sort.txt");
    sort(array.begin(),array.end());
    for (auto i: array)
    {
        fout << i << " ";
    }
    fout.close();
    return 0;
}
