#include<iostream>
using namespace std;
void srectangle(int l,int b,char c)
{
    int i,j;
    for(i=0;i<b;i++)
    {
        for(j=0;j<l;j++)
        cout<<c;
        cout<<endl;
    }
}
void hrectangle(int l,int b,char c)
{
    int i,j;
    for ( i = 0; i < l; i++)
    {
        
        for(j=0;j<b;j++)
        {
            if(i==0||i==l-1){cout<<c;continue;}
            if(j==0||j==b-1)cout<<c;
            else
            cout<<" ";
        }
        cout<<endl;

    }
    
}
void invehalftri(int o,char c,int p)
{
    int i,j=0,k;
    for ( i = 0; i<=o; i++)
    {
        if(p==1)
        for(j=o-i;j>0;j--)cout<<c;
        else
        {
             for(j=o-i,k=1;j>0;j--,k++)cout<<k;
        }
        cout<<endl;
    }
    
}
void halftri(int o,char c)
{
    int i,j=0;
     for ( i = 0; i < o; i++)
    {
        for(j=0;j<=i;j++)cout<<c;
        cout<<endl;
    }
}
void holinvehalftri(int o,char c)
{
    int j,i;
    for(i=0;i<=o+1;i++)
    {
        for(j=o-i;j>0;j--)
        {
            if(i==0){cout<<c;continue;}
            if(j==o-i||j==1)cout<<c;
            else cout<<" ";
        }
        cout<<endl;
    }
}
void fulpyr(int o,char a,int f,int)
{
    int i,j,k;
    for(i=0;i<o;i++)
    {
        for(j=o-i;j>0;j--)cout<<" ";
        for(k=0;k<i*2+1;k++)
        {
            if(f==0){
            if(k%2==0)cout<<a;
            else cout<<" ";}
            else
            {
                if(i==o-1){if(k%2==0)cout<<a;else cout<<" ";continue;}
                if(k==0||k==i*2)cout<<a;
                else cout<<" ";
            }
            
        }
        cout<<endl;
    }

}
void infulpyr(int o,char c,int f)
{
    int i,j,k;
    for(i=0;i<o;i++)
    {
        for(j=0;j<i;j++)cout<<" ";
        for(k=2*o-i*2+1;k>0;k--)
        {
            if(f==0){
            if(k%2==0)cout<<c;
            else cout<<" ";}
            else
            {
                if(i==0)
                {
                    if(k%2==0)cout<<c;
                    else cout<<" " ;
                    continue;
                }
                else
                {
                    if(k==2*o-i*2||k==2)cout<<c;
                    else cout<<" ";
                }
            }
            
        }
        cout<<endl;

    }
}
main()
{
    //srectangle(6,5,'e');   
    //hrectangle(6,5,'*');
    invehalftri(10,'*',0);
    //holinvehalftri(8,'*');
   fulpyr(21,'*',1);          //'1'hollow '0'solid
   
  //infulpyr(10,'*',1);
    //fulpyr(10,'*',1);         //'1'hollow '0'solid
}