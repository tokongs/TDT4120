function mincoinsgreedy(coins, value)
  coinIndex = 1
  cointCounter = 0
  while value > 0
    while coins[coinIndex] > value
      coinIndex += 1
    end
      value -= coins[coinIndex]
      cointCounter += 1
  end

  return cointCounter
end