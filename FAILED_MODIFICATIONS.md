# Failed modificatons

## LTO
Enabling LTO via `-flto` flag, leads to the error `MAX_NR_ZONES undefined` on kernel compilation. Disabling LTO for kernel leads to a linker error at some point (maybe some things are dynamically linked?).

## Changing march
Changing march flag leads to compiler error with missing headers (tried only with `-march=24kec`)

## Optimizing unlikely/likely branches
Setting `CONFIG_JUMP_LABEL=y` in kernel config causes kernel compilation to fail with:
```c
arch/mips/kernel/jump_label.c: In function 'arch_jump_label_transform':
arch/mips/kernel/jump_label.c:46:37: error: implicit declaration of function 'msk_isa16_mode' [-Werror=implicit-function-declaration]
  insn_p = (union mips_instruction *)msk_isa16_mode(e->code);
                                     ^~~~~~~~~~~~~~
arch/mips/kernel/jump_label.c:55:38: error: 'mm_j32_op' undeclared (first use in this function); did you mean 'dsra32_op'?
   insn.j_format.opcode = J_ISA_BIT ? mm_j32_op : j_op;
                                      ^~~~~~~~~
                                      dsra32_op
```

## Updating userspace apps and kernel
Padavan uses old Linux kernel (3.4.3), as well as outdated versions of some apps, it would be the best to update them.

Unfortunately it seems kernel and apps contain certain modifications, which I don't have knowledge to determine and port.
