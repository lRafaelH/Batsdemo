#!/usr/bin/env bats

load 'bats-support/load'
load 'bats-assert-1/load'

@test "Should output hi" {

 run echo "hello"
 assert_output hi
}

@test "test expected to success" {
 run ls
 assert_success
}

@test "test for skip" {
 skip
 run foo
 assert_failure
}

@test "test expected to fail" {
 run foo
 assert_failure
}

@test "Should add numbers together" {
 assert_equal $(echo 1+1 | bc) 2
}

