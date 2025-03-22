
function alterDnstapQuery(dq, tap)
    local ua = ""
    for key,value in pairs(dq:getHTTPHeaders()) do
      if key == 'user-agent' then
              ua = value
              break
      end
    end
    tap:setExtra(ua)
end

function alterDnstapResponse(dr, tap)
    tap:setExtra(dr.pool)
end

function alterDnstapCachedResponse(dr, tap)
    tap:setExtra("cached")
end