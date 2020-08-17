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
Node* sortedMerge(Node* head1, Node* head2)  /*important*/
{  
    
    if(head1 == NULL)
        return head2;
    if(head2 == NULL)
        return head1;

    if(head1->data < head2->data) {
    head1->next = sortedMerge(head1->next,head2);
    return head1;
    } 
    else {
    head2->next = sortedMerge(head1,head2->next);
    return head2;
    }
}  
main()
{
    Node *head=NULL;  //firstlist
    append(&head,10);
    push(&head,15);
    push(&head,75);
    insertafter(head,65);
    append(&head,45);
    //print (head);
    Node *hea=NULL;  //secondlist
    append(&hea,75);
    push(&hea,15);
    push(&hea,75);
    insertafter(hea,65);
    append(&hea,45);
    head=sortedMerge(head,hea);
    print(head);

}