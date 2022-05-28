pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- the game code being tested
#include example.lua

-- helpers for writing tests
g_tests = {}
function add_test(suite_name, test_name, test)
    add(g_tests, { suite_name=suite_name, test_name=test_name, test=test })
end

-- the user written tests for that game code
#include test.lua

-- the remainer of this cart contains the test runner code

function _init()
    -- rearrange g_tests so that all tests for a given suite are grouped together
    local grouped_tests = {}
    for t in all(g_tests) do
        grouped_tests[t.suite_name] = grouped_tests[t.suite_name] or {}
        add(grouped_tests[t.suite_name], t)
    end
    g_tests = {}
    for suite_name,tests in pairs(grouped_tests) do
        for test in all(tests) do
            add(g_tests, test)
        end
    end

    g_curr_test_idx = 1
end

g_test_delay = 0
function _update()
    g_test_delay += 1
    if g_test_delay >= 3 then
        run_next_test()
        g_test_delay = 0
    end
end

function format_test_result(test)
    if test.test_result.result == nil then
        return test.test_name.." - [pass]"
    else
        return test.test_name.." - [fail]: " .. test.test_result.result
    end
end

function run_next_test()
    if g_curr_test_idx > count(g_tests) then
        return
    end

    local curr_test = g_tests[g_curr_test_idx]
    local test_suite_changed =
        g_curr_test_idx == 1 or
        g_tests[g_curr_test_idx-1].suite_name != curr_test.suite_name


    local test_result = g_tests[g_curr_test_idx].test()
    g_tests[g_curr_test_idx].test_result = { result=test_result}
    g_curr_test_idx += 1

    if test_suite_changed then
        printh(curr_test.suite_name)
    end
    printh("    "..format_test_result(curr_test))
end

function _draw()
    cls(0)
    local last_test_suite = nil
    for i=1,count(g_tests) do
        local test = g_tests[i]
        if test.test_result == nil then
            break
        end

        if test.suite_name != last_test_suite then
            print(test.suite_name)
            last_test_suite = test.suite_name
        end

        print("    "..format_test_result(test))
    end
end
