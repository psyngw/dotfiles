-- function date_translator(input, seg)
--    if (input == "orq") then
--       --- Candidate(type, start, end, text, comment)
--       yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
--       yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " "))
--    end
-- end

function date_translator(input, seg)
  if (input == "orq") then
    --- Candidate(type, start, end, text, comment)
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
    yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
  end
  if (input == "ouj") then
    --- Candidate(type, start, end, text, comment)
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
  end
  if (input == "oxq") then
    local weakTab = { '日', '一', '二', '三', '四', '五', '六' }
    yield(Candidate("week", seg.start, seg._end, "周" .. weakTab[tonumber(os.date("%w") + 1)], ""))
    yield(Candidate("week", seg.start, seg._end, "星期" .. weakTab[tonumber(os.date("%w") + 1)], ""))
    yield(Candidate("week", seg.start, seg._end, "礼拜" .. weakTab[tonumber(os.date("%w") + 1)], ""))
  end
end

function time_translator(input, seg)
  -- if (input == "ouj") then
  --    local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M"), " ")
  --    cand.quality = 1
  --    yield(cand)
  -- end
end
