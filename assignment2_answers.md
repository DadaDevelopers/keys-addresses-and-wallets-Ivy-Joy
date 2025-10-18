# Assignment 3 — Keys, Addresses, and Wallets  
**Author:** Ivy Joy  
**Repository:** [keys-addresses-and-wallets-Ivy-Joy](https://github.com/DadaDevelopers/keys-addresses-and-wallets-Ivy-Joy)
## Bech32m Address Output
bcrt1pcdd56gmd8prufcas39x5gh0v694mxcw7nk8v66x0w75ces93r6dq8lra35

### `getaddressinfo` Output

```json
{
  "address": "bcrt1pcdd56gmd8prufcas39x5gh0v694mxcw7nk8v66x0w75ces93r6dq8lra35",
  "scriptPubKey": "5120c35b4d236d3847c4e3b0894d445decd16bb361de9d8ecd68cf77a98cc0b11e9a",
  "ismine": true,
  "solvable": true,
  "desc": "tr([2616021f/86h/1h/0h/0/0]d6fc86f0f9839db5e9eb2dee190056c6da9643b95877b3b73f3e4b94c2df7946)#umwemyay",
  "parent_desc": "tr([2616021f/86h/1h/0h]tpubDD9tS4r6CL5Sb4pCj4TM1Hsf2ekCASDfr8kBD9nUm45g2bfEsVxbky1r5L3xfGMaqyy2RWA968dedjzQ7uzSsJbiMpU2DAhKaRWhWgBXeeP/0/*)#ze3x0mp3",
  "iswatchonly": false,
  "isscript": true,
  "iswitness": true,
  "witness_version": 1,
  "witness_program": "c35b4d236d3847c4e3b0894d445decd16bb361de9d8ecd68cf77a98cc0b11e9a",
  "ischange": false,
  "timestamp": 1760804465,
  "hdkeypath": "m/86h/1h/0h/0/0",
  "hdseedid": "0000000000000000000000000000000000000000",
  "hdmasterfingerprint": "2616021f",
  "labels": [""]
}
Q1. What is the difference between hardened and non-hardened keys?

In Bitcoin HD (Hierarchical Deterministic) wallets, all keys are derived from one master seed using derivation paths.

Feature         	Hardened Keys	               Non-Hardened Keys
Symbol in path	 ' or h (e.g. m/84h/1h/0h)	none (e.g. m/84h/1h/0h/0/2)
Derived using   	Parent private key	Parent public or private key
Security    More secure — child key cannot reveal parent Weaker — if child key leaks, parent may be exposed
Public derivation possible?	No	               Yes
Typical use	Account level separation	Address generation level

Example from the output:

addr1: m/84h/1h/0h/0/2
addr2: m/84h/1h/0h/0/3
addr3: m/84h/1h/0h/0/4


84h/1h/0h → hardened levels (secure account structure)

/0/2, /0/3, /0/4 → non-hardened (normal public addresses) 
                            
Q2. Why should a wallet developer prefer deterministic wallets over non-deterministic wallets?
Feature 	Deterministic Wallet    	Non-Deterministic Wallet
Key generation	All keys derived from one seed	Each key generated randomly
Backup & recovery One seed restores entire wallet	Each key must be backed up separately
Structure	Organized using BIP standards (BIP32, BIP44, BIP84)	Unstructured and random
Portability	Easy to import/export	      Hard to move or reconstruct
Security	Predictable and auditable	Harder to track and backup
Usage today	Used in all modern wallets	Obsolete (used in early Bitcoin versions)

Developers prefer deterministic wallets because:

Only one seed phrase is needed for backup and recovery

HD structure allows hierarchical account management

Simplifies watch-only and multi-device setups

Enhances user experience and security
 
Conclusion

Deterministic wallets and hardened derivation paths together make modern Bitcoin wallets secure, portable, and easy to back up.
Bech32m address confirms correct Taproot key derivation.
