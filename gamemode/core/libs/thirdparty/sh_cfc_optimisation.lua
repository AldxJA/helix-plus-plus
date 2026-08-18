do
    local meta = FindMetaTable( "Entity" )

    meta.GMN_GetClass = meta.GMN_GetClass or meta.GetClass
    local getTable = meta.GetTable

    function meta:GetClass()
        if self == NULL then return self:GMN_GetClass() end

        local cached = getTable( self ).GMN_GetClassVar
        if cached then return cached end

        local id = self:GMN_GetClass()
        self.GMN_GetClassVar = id
        return id
    end
end

do
    local meta = FindMetaTable( "Player" )

    meta.GMN_SteamID = meta.GMN_SteamID or meta.SteamID

    function meta:SteamID()
        local cached = self:GetTable().GMN_SteamIDVar
        if cached then return cached end

        local id = self:GMN_SteamID()
        self.GMN_SteamIDVar = id
        return id
    end

    meta.GMN_SteamID64 = meta.GMN_SteamID64 or meta.SteamID64

    function meta:SteamID64()
        local cached = self:GetTable().GMN_SteamID64Var
        if cached then return cached end

        local id = self:GMN_SteamID64()
        self.GMN_SteamID64Var = id
        return id
    end
end

function widgets.PlayerTick()
end

function widgets.RenderMe()
end

hook.Remove( "OnEntityCreated", "CreateWidgets" )
hook.Remove( "EntityRemoved", "RemoveWidgets" )
