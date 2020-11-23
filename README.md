# kTokens
### Wrapped aTokens with non-increasing balance.

#### Explanation Video: [https://youtu.be/xuU4nB3IOgU](https://youtu.be/xuU4nB3IOgU)

[![](https://i.imgur.com/M4Jzk7Q.png)](https://twitter.com/StaniKulechov/status/1308873571280785410)

## Problem with aToken bridge via ShuttleFlow (to Conflux)
![](https://i.imgur.com/pNcg8Dx.png)

aTokens are interest bearing tokens. Their balance keeps on increasing inside the user's wallet with each passing second.

Let's take an example where user wants to move aToken (aDAI) from Ethereum to Conflux:
1. User deposits 100 aDAI to ShuttleFlow's deposit contract.
2. Corresponding 100 aDAI gets minted on Conflux blockchain.
3. User enjoys high transaction speeds with aDAI on Conflux.
4. As ShuttleFlow has the custody of aDAI now, so during this it accumulates 20 aDAI as interest.
5. User burns 100 aDAI on Conflux, to receive 100 aDAI on Ethereum.
6. The 20 aDAI (accumulated interest) gets locked in the ShuttleFlow deposit contract.

## Solution: kTokens!!!
![](https://i.imgur.com/uqIDI1v.png)

1. The user deposits their aTokens into the corresponding kToken pool. Eg;: Deposit aDAI to mint kDAI.
2. These kDAI act similar to Compound's cTokens. The amount of tokens remain constant, but the underlying assets keeps increasing!
3. The ShuttleFlow bridge works perfectly fine now.
4. When the user burns their initial 100 kDAI, they get back 120 aDAI (100 initial + 20 interest).
