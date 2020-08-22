#include <iostream>
#include <vector>
#define A 6
using namespace std;

void merger(int a[], int l, int m, int r)
{
    int n1 = m - l + 1, n2 = r - m;
    int L[n1], R[n2];
    int i, j, k;
    for (i = 0; i < n1; i++)
        L[i] = a[l + i];
    for (j = 0; j < n2; j++)
        R[j] = a[1 + m + j];
    i = 0, j = 0, k = l;
    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            a[k] = L[i];
            i++;
        }
        else
        {
            a[k] = R[j];
            j++;
        }
        k++;
    }
    while (i < n1)
    {
        a[k] = L[i];
        i++;
        k++;
    }
    while (j < n2)
    {
        a[k] = R[j];
        j++;
        k++;
    }
}
void mergesort(int a[], int l, int r)
{
    if (l < r)
    {
        int i = 0;
        int m = (l + (r - 1)) / 2;
        mergesort(a, l, m);
        mergesort(a, m + 1, r);
        merger(a, l, m, r);
        // cout<<i++;
    }
}
void swap(int *a, int *b)
{
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int *a, int l, int h)
{
    int pi = a[h], i = l, j = 0;
    for (j = l; j <= h - 1; j++)
        if (a[j] < pi) swap(a + i++, a + j);
    swap(a + h, a + i);
    return i ;
}
void quicksort(int *a, int l, int h)
{
    if (l < h)
    {
        int pi = partition(a, l, h);
        quicksort(a, l, pi - 1);
        quicksort(a, pi + 1, h);
    }
}
void insertions(int *a,int n)
{
    int key,i,j;
    for(i=1;i<n;i++)
    {
        key=a[i];
        j=i-1;
        while(j>=0&&a[j]>key)
        {
            a[j+1]=a[j];
            j--;
        }
        a[j+1]=key;
    }
}
main()
{
    int a[A] = {2, 65, 6, 6, 4, 45};
    insertions(a, A );      //     merge,insertion,quick sorts avaliable
    int i;
    for (i = 0; i < A; i++)
        cout << a[i] << endl;
}
