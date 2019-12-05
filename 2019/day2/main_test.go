package main

import "testing"

func TestRunIntcode(t *testing.T) {
	tests := []struct {
		noun   int
		verb   int
		input  string
		output string
	}{
		{0, 0, "1,0,0,0,99", "2,0,0,0,99"},
		{3, 0, "2,3,0,3,99", "2,3,0,6,99"},
		{4, 4, "2,4,4,5,99,0", "2,4,4,5,99,9801"},
		{1, 1, "1,1,1,4,99,5,6,0,99", "30,1,1,4,2,5,6,0,99"},
		{0, 0, "1,0,0,0,99,1,2,3", "2,0,0,0,99,1,2,3"},
	}

	for _, test := range tests {
		res, err := RunIntcode(test.noun, test.verb, &test.input)
		if err != nil {
			t.Error(err)
		}
		if *res != test.output {
			t.Errorf("Expected %v, got %v", test.output, *res)
		}
	}
}

func TestFindOutputWithLimit(t *testing.T) {
	tests := []struct {
		expected int
		output   int
		input    string
	}{
		{3, 12, "1,0,0,5,1,5,6,0,99"},
	}

	for _, test := range tests {
		res, err := FindOutputWithLimit(100, test.output, &test.input)
		if err != nil {
			t.Error(err)
		}
		if *res != test.expected {
			t.Errorf("Expected %v, got %v", test.expected, *res)
		}
	}
}
