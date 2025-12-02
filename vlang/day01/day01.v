module day01

pub fn part1(lines []string) int {
	mut dial := 50
	mut count := 0

	for line in lines {
		direction, amount := parse_instruction(line)

		dial = match direction {
			`L` { (dial - amount) % 100 }
			`R` { (dial + amount) % 100 }
			else { panic('Invalid instruction: ${direction}') }
		}
		if dial == 0 {
			count++
		}
	}

	return count
}

pub fn part2(lines []string) int {
	mut dial := 50
	mut count := 0

	for line in lines {
		direction, amount := parse_instruction(line)

		click := match direction {
			`L` { -1 }
			`R` { 1 }
			else { panic('Invalid instruction: ${direction}') }
		}
		for _ in 0 .. amount {
			dial = (dial + click) % 100
			if dial == 0 {
				count++
			}
		}
	}

	return count
}

fn parse_instruction(line string) (u8, int) {
	return line[0], line[1..].int()
}
