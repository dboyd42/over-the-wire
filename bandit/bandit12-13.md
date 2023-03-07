# Bandit 12 :arrow_right: 13

> **Author:** David Boyd<br>
> **Date:** 2020-03-20<br>
> **Revised:** 2023-03-07

# Level Goal

The password for the next level is stored in the file data.txt, which is a
hexdump of a file that has been repeatedly compressed. For this level it may
be useful to create a directory under /tmp in which you can work using mkdir.
For example: mkdir /tmp/myname123. Then copy the datafile using cp, and
rename it using mv (read the manpages!)

Commands you may need to solve this level:

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv,
file

# Walkthrough

``` bash
# Login to server
i=$(( $i + 1 )); echo $i; ssh bandit$i@bandit.labs.overthewire.org -p 2220
  [<<] passwd: [>>] JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv

#### Capture the Flag ####
### 1. Setup workspace
mkdir /tmp/some-folder/
cp data.txt /tmp/some-folder/
cd /tmp/some-folder/

### 2. Loop following process:
## 2.1 Determine file type
file data.txt
## 2.2 Decompress file based on type (exception on first round: use xxd)
# Round 1: Reverse hexadecimal
xxd -r data.txt > unhexed
# Round 2: gzip
mv unhexed unhexed.gz           # GZip decompression requires '.gz' extension
gunzip unhexed.gz
# Round 3: bzip2
bunzip2 unhexed                 # Method 2: tar -xvjf data6.bin
# Round 4: gzip
mv unhexed.out unhexed.out.gz   # GZip decompression requires '.gz' extension
gunzip unhexed.out.gz
# Round 5: POSIX tar archive (GNU)
tar -xvf data5.bin
# Round 6: bzip2
bunzip2 data6.bin               # Method 2: tar -xvjf data6.bin
# Round 7: gzip
mv data8.bin data8.bin.gz       # GZip decompression requires '.gz' extension
gunzip data8.bin.gz

## 3. Get flag
cat data8.bin
  [<<] wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
```
