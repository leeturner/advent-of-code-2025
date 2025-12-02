module main

import day01
import os

fn main() {
	day01_part1 := day01.part1(read_input('Day01'))
	println('Day01 Part 1 = ${day01_part1}')
	// assert day01_part1 == 3
	day01_part2 := day01.part2(read_input('Day01'))
	println('Day01 Part 2 = ${day01_part2}')
	// assert day01_part2 == 6
}

fn read_input(name string) []string {
	return os.read_lines('${name}.txt') or { panic('Failed to read file: ${name}') }
}
