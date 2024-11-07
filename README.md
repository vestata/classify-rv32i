# Assignment 2: Classify

TODO: Add your own descriptions here.

## Troubleshooting Steps for `test_chain_1` Failure
After finishing the functions in Task A and Task B, all of the tests from `bash test.sh` are passed, except for `test_chain_1`. The First issue encountered is:

```
AssertionError: b'\x0[26 chars]x00\x84\x04\x00\x00\x8c\x00\x00\x00\x14\xfd\xf[1059 chars]\xff' != b'\x0[26 chars]x00\x10\t\x00\x00\xb4\xff\xff\xffa\xfc\xff\xff[1067 chars]\xff' : Bytes of /home/nini/classify-rv32i/tests/chain-1/batch1-output.bin and /home/nini/classify-rv32i/tests/chain-1/batch1-reference.bin did not match!
```

Here are some approaches to try in order to resolve this issue:

- [x] **Convert .bin files to ASCII**: Check the outputs by converting the .bin files in chain-1 to ASCII format for easier comparison.
- [x] **Use the mul extension**: Verify if the custom multiplication implementation is causing issues by testing with the mul extension.
- [ ] **Review chain.s in detail**: Carefully go through chain.s to identify any potential problems.

Introduced a new custom mutiplication with long multiplication, reducing loop iterations from multiplicand count to ilog2(multiplcand). This approach uses two additional registers, where the previous method uses only one additional register.