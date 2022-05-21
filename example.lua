-- example.lua
-- where the game logic being tested lives

-- for this simple sample, we'll just test some a vector addition function
function vec(x, y)
    return {x=x,y=y}
end
function vec_add(v1, v2)
    return vec(v1.x+v2.x, v1.y+v2.y)
end
