pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- vvvv - the game code being tested goes here 
#include example_game_logic.lua
-- ^^^^ - the game code being tested goes here 

#include testrunner_src/testutils.lua

-- vvvv - the user-provided tests for that game code goes here
#include example_tests.lua
-- ^^^^ - the user-provided tests for that game code goes here

#include testrunner_src/testmain.lua
