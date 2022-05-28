-- helpers for writing tests and hooking into the test runner

g_tests = {}
function add_test(suite_name, test_name, test)
    add(g_tests, { suite_name=suite_name, test_name=test_name, test=test })
end
