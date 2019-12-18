swGame.stats = do ->
  (url) ->
    paramIndex = 0
    params = {}
    params["stats_param#{paramIndex}"] = param while param = arguments[++paramIndex]
    swGame.helpers.ajax
      url: url
      params: params
