#include <iostream>
using namespace std;
class Node
{
    public:
    int data;
    Node *next;
    
};
void push(Node **head,int da)
{
    Node *n=new Node();
    n->data=da;
    n->next=(*head);
    *head=n;
}
void insertafter(Node *n,int data)
{
    Node *ne=new Node();
    ne->data=data;
    Node *last=n->next;
    n->next=ne;
    ne->next=last;
}
void print(Node *head)
{
    while(head!=NULL)
    {
        cout<<head->data<<endl;
        head=head->next;
    }
}
void append(Node **he,int data)
{
    Node *ne=new Node();
    ne->data=data;
    ne->next=*he;
    *he=ne;

}
void merger(Node** po,Node *h2)
{
    Node *h1=*po;
    while ((h1->next)!=NULL)h1=h1->next;
    h1->next=h2;
}
main()
{
    Node *head=NULL;
    append(&head,75);
    push(&head,15);
    push(&head,75);
    insertafter(head,65);
    append(&head,45);
    print (head);
    Node *hea=NULL;
    append(&hea,75);
    push(&hea,15);
    push(&hea,75);
    insertafter(hea,65);
    append(&hea,45);
    merger(&head,hea);
    print(head);

}