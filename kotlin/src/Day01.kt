fun main() {

  fun parseInstruction(line: String) = line[0] to line.drop(1).toInt()

  fun part1(input: List<String>): Int {
    var dial1 = 50
    var count = 0

    input.forEach {
      val (direction, amount) = parseInstruction(it)
      dial1 = when (direction) {
        'L' -> (dial1 - amount) % 100
        'R' -> (dial1 + amount) % 100
        else -> error("Invalid instruction: $direction")
      }
      if (dial1 == 0) count++
    }

    return count
  }

  fun part2(input: List<String>): Int {
    var dial2 = 50
    var pass = 0

    input.forEach {
      val (direction, amount) = parseInstruction(it)
      val click = when (direction) {
        'L' -> -1
        'R' -> 1
        else -> error("Invalid instruction: $direction")
      }
      repeat(amount) {
        dial2 = (dial2 + click) % 100
        if (dial2 == 0) pass++
      }
    }
    return pass
  }


  val testInput = readInput("Day01_test")
  check(part1(testInput) == 3)
  check(part2(testInput) == 6)

  val input = readInput("Day01")
  part1(input).println()
  part2(input).println()
}
