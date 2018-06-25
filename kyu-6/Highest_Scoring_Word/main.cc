// https://www.codewars.com/kata/57eb8fcdf670e99d9b000272

#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include <stdio.h>

using namespace std;

inline int to_l(int a) {
	return (a < 97) ? a+32 : a;
}

std::vector<std::string> split(string &str, char key) {
	string buffer;
	stringstream ss(str);
	vector<string> result;
	while (ss.good()) {
		string sub;
		getline(ss, sub, key);
		result.push_back(sub);
	}
	return result;
}


int score(string s) {
	int score = 0;
	for (int i = 0; i < s.size(); ++i) {
		score+=s[i]-96;
	}
	return score;
}


string highestScoringWord(string str) {
	vector<string> s = split(str, ' ');
	int str_score = 0;
	string highest = "";
	for (int i = 0; i < s.size(); ++i) {
		int tmp_score = score(s[i]);
		if (tmp_score > str_score) {
			str_score = tmp_score;
			highest = s[i];
		}
	}
	return highest;
}
