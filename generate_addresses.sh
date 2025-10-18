CLI="$HOME/bitcoin/build/bin/bitcoin-cli -regtest"
OUTFILE=output.txt
:>$OUTFILE
echo "===== Wallet & Node info =====" >> $OUTFILE
$CLI -version 2>&1 | sed -n '1p' >> $OUTFILE 2>&1
echo >> $OUTFILE 
echo "Creating/loading wallet 'wallet1'..." | tee -a $OUTFILE
$CLI createwallet "wallet1" 2>&1 | tee -a $OUTFILE 
echo >> $OUTFILE
echo "===== getwalletinfo for wallet1 =====" >> $OUTFILE
$CLI -rpcwallet=wallet1 getwalletinfo >> $OUTFILE 2>&1 
echo >> $OUTFILE
echo "===== listwallets =====" >> $OUTFILE
$CLI listwallets >> $OUTFILE 2>&1 
LEGACY=$($CLI -rpcwallet=wallet1 getnewaddress "" legacy)
echo >> $OUTFILE
echo "===== Legacy Address (getnewaddress \"\" legacy) =====" >> $OUTFILE
echo "$LEGACY" >> $OUTFILE
echo >> $OUTFILE
echo "getaddressinfo for legacy address:" >> $OUTFILE
$CLI -rpcwallet=wallet1 getaddressinfo $LEGACY >> $OUTFILE 2>&1 
BECH32=$($CLI -rpcwallet=wallet1 getnewaddress "" bech32)
echo >> $OUTFILE
echo "===== Bech32 (SegWit v0) Address (getnewaddress \"\" bech32) =====" >> $OUTFILE
echo "$BECH32" >> $OUTFILE
echo >> $OUTFILE
echo "getaddressinfo for bech32 address:" >> $OUTFILE
$CLI -rpcwallet=wallet1 getaddressinfo $BECH32 >> $OUTFILE 2>&1
echo >> $OUTFILE
echo "===== Bech32m Address =====" >> $OUTFILE
BECH32M=$($CLI -rpcwallet=wallet1 getnewaddress "" bech32m 2>&1) || true
echo "$BECH32M" >> $OUTFILE
if echo "$BECH32M" | grep -qE '^bc1|^tb1|^bcrt1'; then
  echo >> $OUTFILE
  echo "getaddressinfo for bech32m:" >> $OUTFILE
  $CLI -rpcwallet=wallet1 getaddressinfo $BECH32M >> $OUTFILE 2>&1
else
  echo >> $OUTFILE
  echo "bech32m not supported or error:" >> $OUTFILE
  echo "$BECH32M" >> $OUTFILE
fi 
echo >> $OUTFILE
echo "===== Deterministic derivation (3 bech32 addresses) =====" >> $OUTFILE
A1=$($CLI -rpcwallet=wallet1 getnewaddress "" bech32)
A2=$($CLI -rpcwallet=wallet1 getnewaddress "" bech32)
A3=$($CLI -rpcwallet=wallet1 getnewaddress "" bech32)
echo "addr1: $A1" >> $OUTFILE
$CLI -rpcwallet=wallet1 getaddressinfo $A1 >> $OUTFILE 2>&1
echo "addr2: $A2" >> $OUTFILE
$CLI -rpcwallet=wallet1 getaddressinfo $A2 >> $OUTFILE 2>&1
echo "addr3: $A3" >> $OUTFILE
$CLI -rpcwallet=wallet1 getaddressinfo $A3 >> $OUTFILE 2>&1 
echo >> $OUTFILE
echo "===== Completed at $(date -u) =====" >> $OUTFILE 
echo "Saved outputs to $OUTFILE" 
