#include <iostream>
using namespace std;
int o(char u)
{
    switch(u)
    {
        case '*' :return  1;
        case '/' : return 1;
        case '+':return 0;
        case '-':return 0;
        case '^':return 2;
        }
        return -1;
}
int main() {
	//code
	int t;
	cin>>t;
	while(t--)
	{
	    char a[1001],s[1001];
	    int i,top=-1,f=0;
	    cin>>a;
	    for(i=0;a[i]!='\0';i++)
	    {
	        int y=o(a[i]);
	        if(a[i]=='(')
	        {
	            s[++top]=a[i];
	            continue;
	        }
	        if(a[i]==')')
	        {
	            while(s[top]!='(')
	            {
	                cout<<s[top--];
	            }
	            top--;
	            continue;
	        }
	        if(y==-1)
	        {
	            cout<<a[i];
	            continue;
	        }
	        if(top==-1)s[++top]=a[i];
	        else if(o(s[top])<o(a[i]))
	        {
	            s[++top]=a[i];
	        }
	        else if(o(s[top])>=o(a[i]))
	        {
	            cout<<s[top];
	            s[top]=a[i];
	        }
	    }
	    while(top!=-1)
	    {
	        cout<<s[top--];
	    }
	    cout<<endl;
	}
	return 0;
}