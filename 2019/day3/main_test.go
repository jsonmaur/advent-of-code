package main

import "testing"

func TestNearestIntersect(t *testing.T) {
	tests := []struct {
		output int
		input1 []string
		input2 []string
	}{
		{610, []string{"R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"}, []string{"U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"}},
		{410, []string{"R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"}, []string{"U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"}},
	}

	for _, test := range tests {
		res, err := NearestIntersect(&[]*[]string{&test.input1, &test.input2})
		if err != nil {
			t.Error(err)
		}
		if res != test.output {
			t.Errorf("Expected %v, got %v", test.output, res)
		}
	}
}
