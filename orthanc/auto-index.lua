function Initialize()
    local pfile = assert(io.popen("find '/data/' -mindepth 1 -iname '*.dcm' -ipath '*by-filename*' -type f -printf '%p\\0'", 'r'))
    local list = pfile:read('*a')
    pfile:close()

    for filename in string.gmatch(list, '[^%z]+') do
        local f = assert(io.open(filename, 'rb'))
        local resp = ParseJson(RestApiPost('/instances', f:read('*all')))
        f:close()
        if resp['Status'] == 'Success' then
            local uuid = ParseJson(RestApiGet(resp['Path']))['FileUuid']
            local path = '/var/lib/orthanc/db/' .. uuid:sub(1, 2) .. '/' .. uuid:sub(3, 4) .. '/'
            local p = assert(io.popen('mkdir -p ' .. path))
            p:read('*a')
            p:close()
            local p = assert(io.popen('ln -sf ' .. filename .. ' ' .. path .. uuid))
            p:read('*a')
            p:close()
        end
    end
end
