-- test.lua
-- what the test suite cart looks like

add_test(
    "vec create tests",
    "vct1",
    function ()
        local v = vec(1,2)
        if v.x != 1 then return "v.x != 1 ("..v.x..")" end
        if v.y != 2 then return "v.x != 2 ("..v.y..")" end
        return nil
    end)
add_test(
    "vec create tests",
    "vct2",
    function ()
        local v = vec(2,2)
        -- N.B. intentionally broken to show failure
        if v.x != 1 then return "v.x != 1 ("..v.x..")" end
        if v.y != 2 then return "v.x != 2 ("..v.y..")" end
        return nil
    end)

add_test(
    "vec add tests",
    "vat1",
    function ()
        local v = vec_add(vec(1,2), vec(3, 4))
        if v.x != 4 then return "v.x != 4 ("..v.x..")" end
        if v.y != 6 then return "v.x != 6 ("..v.y..")" end
        return nil
    end)
