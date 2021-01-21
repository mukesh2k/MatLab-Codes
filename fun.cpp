#include <bits/stdc++.h>
using namespace std;
using namespace std::chrono;
class Solution
{
public:
        void start(char s, vector<string> &S)
        {
                switch (s)
                {
                case '1':
                        break;
                case '2':
                        S.push_back("a");
                        S.push_back("b");
                        S.push_back("c");
                        break;
                case '3':
                        S.push_back("d");
                        S.push_back("e");
                        S.push_back("f");
                        break;
                case '4':
                        S.push_back("g");
                        S.push_back("h");
                        S.push_back("i");
                        break;
                case '5':
                        S.push_back("j");
                        S.push_back("k");
                        S.push_back("l");
                        break;
                case '6':
                        S.push_back("m");
                        S.push_back("n");
                        S.push_back("o");
                        break;
                case '7':
                        S.push_back("p");
                        S.push_back("q");
                        S.push_back("r");
                        S.push_back("s");
                        break;
                case '8':
                        S.push_back("t");
                        S.push_back("u");
                        S.push_back("v");
                        break;
                case '9':
                        S.push_back("w");
                        S.push_back("x");
                        S.push_back("y");
                        S.push_back("z");
                        break;
                default:
                        break;
                }
                return;
        }
        vector<string> letterCombinations(string dig)
        {
                vector<string> S;
                if (dig.size() == 0)
                        return S;
                start(dig[0], S);
                for (int i = 1; i < dig.size(); i++)
                {
                        vector<string> Y;
                        for (int j = 0; j < S.size(); j++)
                        {
                                switch (dig[i])
                                {
                                case '1':
                                        break;
                                case '2':
                                        Y.push_back(S[j] + "a");
                                        Y.push_back(S[j] + "b");
                                        Y.push_back(S[j] + "c");
                                        break;
                                case '3':
                                        Y.push_back(S[j] + "d");
                                        Y.push_back(S[j] + "e");
                                        Y.push_back(S[j] + "f");
                                        break;
                                case '4':
                                        Y.push_back(S[j] + "g");
                                        Y.push_back(S[j] + "h");
                                        Y.push_back(S[j] + "i");
                                        break;
                                case '5':
                                        Y.push_back(S[j] + "j");
                                        Y.push_back(S[j] + "k");
                                        Y.push_back(S[j] + "l");
                                        break;
                                case '6':
                                        Y.push_back(S[j] + "m");
                                        Y.push_back(S[j] + "n");
                                        Y.push_back(S[j] + "o");
                                        break;
                                case '7':
                                        Y.push_back(S[j] + "p");
                                        Y.push_back(S[j] + "q");
                                        Y.push_back(S[j] + "r");
                                        Y.push_back(S[j] + "s");
                                        break;
                                case '8':
                                        Y.push_back(S[j] + "t");
                                        Y.push_back(S[j] + "u");
                                        Y.push_back(S[j] + "v");
                                        break;
                                case '9':
                                        Y.push_back(S[j] + "w");
                                        Y.push_back(S[j] + "x");
                                        Y.push_back(S[j] + "y");
                                        Y.push_back(S[j] + "z");
                                        break;
                                default:
                                        break;
                                }
                        }
                        S = Y;
                }
                return S;
        }
};

int main(void)
{
        ios_base::sync_with_stdio(false);
        cin.tie(NULL);
        auto start = high_resolution_clock::now();
        Solution a;
        vector<string> V;
        list<int> L;
        int y = 0;
        V = a.letterCombinations("9345697");
        for (auto i : V)
        {
                y++;
                cout << i << " ";
        }
        cout << y;

        auto stop = high_resolution_clock::now();

        auto duration = duration_cast<microseconds>(stop - start);

        cout << "Time taken by function: "
             << duration.count() << " microseconds" << endl;
        return 0;
}