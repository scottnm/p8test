-- main.lua
-- an example for what the actual game runner cart looks like

function new_expr(v1, v2)
    return {v1=v1, v2=v2, sum=vec_add(v1,v2)}
end

function _init()
    expressions = {}
    add(expressions, new_expr(vec(1,2), vec(3,4)))
    add(expressions, new_expr(vec(-1,-2), vec(3,4)))
    add(expressions, new_expr(vec(-1,-2), vec(-3,-4)))
end

function _update()
    --noop
end

function _draw()
    cls(0) -- clear to black
    for e in all(expressions) do
        --print("{"..e.v1.x..","..e.v1.y.."} + {"..e.v2.x..","..e.v2.y.."} = {"..e.sum.x..",",..e.sum.y.."}")
        print("{"..e.v1.x..","..e.v1.y.."} + {"..e.v2.x..","..e.v2.y.."} = {"..e.sum.x..","..e.sum.y.."}")
    end
end
