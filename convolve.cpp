#include<iostream>
using namespace std;
void change(float *a,int n)
{
    int i;
    float t=a[0];
    for(i=0;i<n-1;i++)a[i]=a[i+1];
    a[i]=t;
}
main()
{
    int n,i,j;
    cin>>n;
    float a[n],b[n],s[n];
    for ( i = 0; i < n; i++)cin>>a[i];
    for ( i = 0; i < n; i++)cin>>b[i];
    float m[n][n],sum[2*n-1];
    for(i=0;i<n;i++)
    for(j=0;j<n;j++)
    m[i][j]=a[i]*b[j];
    cout<<"Convolve: ";
    for(i=0;i<n;i++)
    {
        int k=0;
        j=i;
        sum[i]=0;
        while(j>=0)sum[i]+=m[j--][k++];
        cout<<sum[i]<<" ";
    }
    for(i=1;i<=n-1;i++)
    {
        int j=n-1,k=i;
        sum[n+i-1]=0;
        while(k<n)
        {
            sum[n+i-1]+=m[j--][k++];
        }
        cout<<sum[n+i-1]<<" ";
    }
    cout<<endl<<"CircularConvolve: ";
    for(i=0;i<n;i++)
    {
        change(a,n);
        s[i]=0;
        for(j=0;j<n;j++) s[i]+=a[n-j-1]*b[j];
        cout<<s[i]<<" ";
    }
    
}