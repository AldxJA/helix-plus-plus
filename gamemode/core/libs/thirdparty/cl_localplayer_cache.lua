local LocalPlayerOld = LocalPlayerOld or LocalPlayer
local ply

function LocalPlayer()
    if ply then return ply end
    ply = LocalPlayerOld()
    if ply == NULL then
        ply = nil
        return NULL
    end
    return ply
end
