#!/usr/bin/env bats

@test "Simple check for date command" {
  date
}

@test "Check for current user" {
  result="$(whoami)"
  [ "$result" == `whoami` ]
}

@test "Test for something that does not exist" {
  skip "This test is skipped"
  ls /test/no/test
}

@test "Test for something that should not exist" {
  run ls /test/no
  [ "$status" -eq 2 ]
}

@test "Check for individual line of output" {
  run ping -c 1 google.com
  [ "$status" -eq 0 ]
  [ "${lines[3]}" = "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]
}
