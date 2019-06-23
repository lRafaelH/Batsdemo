#!/usr/bin/env bats
 load 'bats-support/load'
 load 'bats-assert-1/load'
 
setup() {
 mkdir -p $BATS_TEST_DIRNAME/testdir
}


teardown() {
rm -rf $BATS_TEST_DIRNAME/testdir
}
 
@test "create a file in test directory" {
run touch $BATS_TEST_DIRNAME/testdir/file.txt 
assert_success
}
 
@test "insert text into file.txt" {
run echo "this is a text file" >> $BATS_TEST_DIRNAME/testdir/file.txt
assert_output 'this is a text file'
}
 
@test "Shows computer name" {
 run hostname
 assert_success
 assert_output "localhost.localdomain"
}
 
@test "shows username" {
 run users
 assert_success
 assert_output 'root'
}
 
 
@test "shows total memory" {
 run bash -c "echo "$(free -h | grep Mem | awk '{print $2}')B""
 assert_success
 assert_output --partial 'GB'
}
 
@test "shows memory usage" {
 run bash -c "echo "$(free -h | grep "Mem" | awk '{print $3}')B/$(free -h | grep "Mem" | awk '{print $2}')B""
 assert_success
 assert_output --partial 'GB'
 assert_output --partial '/'
}
 
@test "show Disk storage" {
 run bash -c "echo  "$(df -H | grep /dev/mapper/ | awk '{print $3}')B/$(df -H | grep /dev/mapper/ | awk '{print $2}')B $(df -H | grep /dev/mapper/ | awk '{print $5}') Used""
 assert_success
 assert_output --partial 'GB'
 assert_output --partial '/'
 
}

@test "counts number of cpu" {
 run grep -c ^processor /proc/cpuinfo
 assert_success
 [[ $output =~ ^[0-9]+$ ]]
}

 
