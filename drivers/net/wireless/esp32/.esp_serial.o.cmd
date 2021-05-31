cmd_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o := aarch64-poky-linux-gcc -Wp,-MD,/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/.esp_serial.o.d  -nostdinc -isystem /opt/fsl-imx-xwayland/5.4-zeus/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/9.2.0/include -I/home/richard/work/cooker/software/linux/kernel/arch/arm64/include -I./arch/arm64/include/generated -I/home/richard/work/cooker/software/linux/kernel/include -I./include -I/home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/home/richard/work/cooker/software/linux/kernel/include/uapi -I./include/generated/uapi -include /home/richard/work/cooker/software/linux/kernel/include/linux/kconfig.h -include /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -mgeneral-regs-only -DCONFIG_AS_LSE=1 -DCONFIG_CC_HAS_K_CONSTRAINT=1 -fno-asynchronous-unwind-tables -Wno-psabi -mabi=lp64 -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=/home/richard/work/cooker/software/linux/kernel/= -Wno-packed-not-aligned --sysroot=/opt/fsl-imx-xwayland/5.4-zeus/sysroots/aarch64-poky-linux -mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=1136 -DCONFIG_SUPPORT_ESP_SERIAL -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/../../../../common/include -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32 -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/sdio  -DMODULE  -DKBUILD_BASENAME='"esp_serial"' -DKBUILD_MODNAME='"esp32_sdio"' -c -o /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.c

source_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o := /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.c

deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o := \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kconfig.h \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_attributes.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler-gcc.h \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/init.h \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/int-ll64.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/int-ll64.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/bitsperlong.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stddef.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/stddef.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/barrier.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kasan-checks.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/barrier.h \
    $(wildcard include/config/smp.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/const.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/const.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
  /opt/fsl-imx-xwayland/5.4-zeus/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/9.2.0/include/stdarg.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/limits.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/limits.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/linkage.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stringify.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/linkage.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bitops.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bits.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/bitops.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/builtin-__ffs.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/builtin-ffs.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/builtin-__fls.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/builtin-fls.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/ffz.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/fls64.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/sched.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/hweight.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/arch_hweight.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/const_hweight.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/atomic.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/atomic.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/atomic.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cmpxchg.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/build_bug.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/as/lse.h) \
    $(wildcard include/config/arm64/lse/atomics.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/atomic_ll_sc.h \
    $(wildcard include/config/cc/has/k/constraint.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/jump_label.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/insn.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cpucaps.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/atomic_lse.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/atomic-instrumented.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/atomic-fallback.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/atomic-long.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/lock.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/non-atomic.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/le.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/byteorder.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/byteorder/little_endian.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/byteorder/little_endian.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/swab.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/swab.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/byteorder/generic.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/typecheck.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kern_levels.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/kernel.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sysinfo.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cache.h \
    $(wildcard include/config/kasan/sw/tags.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cputype.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/pa/bits/52.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  arch/arm64/include/generated/asm/div64.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/div64.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stat.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/compat.h) \
  arch/arm64/include/generated/uapi/asm/stat.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/stat.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preemption.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/preempt.h \
    $(wildcard include/config/preempt.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/bug.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/brk-imm.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/restart_block.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/time64.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/time.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/time_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/current.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/thread_info.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/arm64/va/bits/52.h) \
    $(wildcard include/config/kasan/shadow/offset.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/debug/align/rodata.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/arm/gic/v3/its.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sizes.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
    $(wildcard include/config/arm64/cont/shift.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pfn.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/stack_pointer.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/irqflags.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/sve.h) \
    $(wildcard include/config/arm64/cnp.h) \
    $(wildcard include/config/arm64/ptr/auth.h) \
    $(wildcard include/config/arm64/pseudo/nmi.h) \
    $(wildcard include/config/arm64/debug/priority/masking.h) \
    $(wildcard include/config/arm64/ssbd.h) \
    $(wildcard include/config/arm64/pa/bits.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/hwcap.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/hwcap.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/sve_context.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bottom_half.h \
  arch/arm64/include/generated/asm/mmiowb.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/spinlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/spinlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/paravirt.h) \
    $(wildcard include/config/nr/cpus.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qrwlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rwlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/spinlock.h \
  arch/arm64/include/generated/asm/qrwlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qrwlock.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm64/force/52bit.h) \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm64/tagged/addr/abi.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/string.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/hw_breakpoint.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/virt.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/sections.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/sections.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/pgtable/levels.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/pointer_auth.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/random.h \
    $(wildcard include/config/arch/random.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/once.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/random.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/ioctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/ioctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/irqnr.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/irqnr.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/fpsimd.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/errno-base.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/sigcontext.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bitmap.h \
  arch/arm64/include/generated/asm/qspinlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qspinlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rwlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/time32.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timex.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/timex.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/param.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/param.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/param.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/timex.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/threads.h \
    $(wildcard include/config/base/small.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/percpu.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/virtualization.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/richard/work/cooker/software/linux/kernel/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timecounter.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/timex.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/compat.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/debug/rseq.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sched.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pid.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcutree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/wait.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/wait.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sem.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sem.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ipc.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/highuid.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rhashtable-types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/osq_lock.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ktime.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/jiffies.h \
  include/generated/timeconst.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timekeeping.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timekeeping32.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/ipcbuf.h \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/sembuf.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/shm.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/page.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/personality.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/personality.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/pgtable-types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/5level-fixup.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/getorder.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/shm.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/shmbuf.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/shmparam.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/shmparam.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kcov.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/kcov.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hrtimer_defs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rbtree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timerqueue.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/seccomp.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/seccomp.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/unistd.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/unistd.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/unistd.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/seccomp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/unistd.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/resource.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/resource.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/resource.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/latencytop.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/prio.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/signal.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/signal.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/signal.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/signal.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/signal-defs.h \
  arch/arm64/include/generated/uapi/asm/siginfo.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/siginfo.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/posix-timers.h \
    $(wildcard include/config/posix/timers.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/alarmtimer.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/rseq.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/magic.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/compat.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/stat.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kmod.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/umh.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shuffle/page/allocator.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/sparsemem.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/auxvec.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/auxvec.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/auxvec.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/err.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/completion.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/uprobes.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/mmu.h \
    $(wildcard include/config/unmap/kernel/at/el0.h) \
    $(wildcard include/config/randomize/base.h) \
    $(wildcard include/config/cavium/erratum/27456.h) \
    $(wildcard include/config/harden/branch/predictor.h) \
    $(wildcard include/config/harden/el2/vectors.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/notifier.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcu_segcblist.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/srcutree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/mmzone.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/numa.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/topology.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/topology.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sysctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/elf.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/elf.h \
    $(wildcard include/config/compat/vdso.h) \
  arch/arm64/include/generated/asm/user.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/user.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/elf.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/elf-em.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sysfs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/idr.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/radix-tree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kconfig.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kobject_ns.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kref.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rbtree_latch.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/error-injection.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/error-injection.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/tracepoint-defs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/static_key.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/arm64/erratum/843419.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/delay.h \
  arch/arm64/include/generated/asm/delay.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/delay.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cdev.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kdev_t.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/kdev_t.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/device.h \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/declare/coherent.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/arch/has/sync/dma/for/device.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu/all.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ioport.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/klist.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ratelimit.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/overflow.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/device.h \
    $(wildcard include/config/iommu/api.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pm_wakeup.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/fs.h \
    $(wildcard include/config/read/only/thp/for/fs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/fs/verity.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
    $(wildcard include/config/io/uring.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/wait_bit.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dcache.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rculist_bl.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/list_bl.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bit_spinlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/path.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/shrinker.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/capability.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/capability.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/semaphore.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/fcntl.h \
    $(wildcard include/config/arch/32bit/off/t.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/fcntl.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/fcntl.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/fcntl.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/fiemap.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/migrate_mode.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu-rwsem.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcuwait.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcu_sync.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/delayed_call.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/uuid.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/uuid.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/errseq.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ioprio.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/rt.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/iocontext.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/fs_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/fs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu_counter.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/dqblk_xfs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dqblk_v1.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dqblk_v2.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dqblk_qtree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/projid.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/quota.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/nfs_fs_i.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kthread.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu-refcount.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kasan.h \
    $(wildcard include/config/kasan/generic.h) \
  /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/irqreturn.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hardirq.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/hardirq.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/irq.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/irq.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/kvm_arm.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/esr.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/irq_cpustat.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/hyperv/net.h) \
    $(wildcard include/config/wlan.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/rps.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/xps.h) \
    $(wildcard include/config/xdp/sockets.h) \
    $(wildcard include/config/bql.h) \
    $(wildcard include/config/rfs/accel.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/xfrm/offload.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/libfcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/l3/master/dev.h) \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/tls/device.h) \
    $(wildcard include/config/vlan/8021q.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/tipc.h) \
    $(wildcard include/config/irda.h) \
    $(wildcard include/config/atalk.h) \
    $(wildcard include/config/decnet.h) \
    $(wildcard include/config/mpls/routing.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/netfilter/ingress.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/garp.h) \
    $(wildcard include/config/mrp.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/net/flow/limit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/prefetch.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dynamic_queue_limits.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ethtool.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compat.h \
    $(wildcard include/config/arch/has/syscall/wrapper.h) \
    $(wildcard include/config/x86/x32/abi.h) \
    $(wildcard include/config/compat/old/sigaction.h) \
    $(wildcard include/config/odd/rt/sigaction.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/socket.h \
  arch/arm64/include/generated/uapi/asm/socket.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/socket.h \
  arch/arm64/include/generated/uapi/asm/sockios.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/sockios.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sockios.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/uio.h \
    $(wildcard include/config/arch/has/uaccess/mcsafe.h) \
  /home/richard/work/cooker/software/linux/kernel/include/crypto/hash.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/crypto.h \
    $(wildcard include/config/crypto/stats.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/uaccess.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/arm64/pan.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/kernel-pgtable.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/pgtable.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/proc-fns.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/pgtable-prot.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/tlbflush.h \
    $(wildcard include/config/imx/scu/soc.h) \
    $(wildcard include/config/arm64/workaround/repeat/tlbi.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/fixmap.h \
    $(wildcard include/config/acpi/apei/ghes.h) \
    $(wildcard include/config/arm/sde/interface.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/boot.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/fixmap.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/pgtable.h \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/extable.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/uio.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/socket.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/libc-compat.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/hdlc/ioctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/aio_abi.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/syscall_wrapper.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/ethtool.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/if_ether.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/net/tc/skb/ext.h) \
    $(wildcard include/config/skb/extensions.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/switchdev.h) \
    $(wildcard include/config/net/rx/busy/poll.h) \
    $(wildcard include/config/network/secmark.h) \
    $(wildcard include/config/net.h) \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
    $(wildcard include/config/network/phy/timestamping.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/netfilter/xt/target/trace.h) \
    $(wildcard include/config/nf/tables.h) \
    $(wildcard include/config/ip/vs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bvec.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/arch/has/pkeys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/sparc64.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/arch/has/pte/devmap.h) \
    $(wildcard include/config/dev/pagemap/ops.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/pci/p2pdma.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/init/on/alloc/default/on.h) \
    $(wildcard include/config/init/on/free/default/on.h) \
    $(wildcard include/config/debug/pagealloc/enable/default.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/arch/has/set/direct/map.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/range.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/page_ext.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/arch/stackwalk.h) \
    $(wildcard include/config/have/reliable/stacktrace.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stackdepot.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/memremap.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/huge_mm.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/net.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/net.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/textsearch.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/checksum.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/checksum.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/checksum.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dma-mapping.h \
    $(wildcard include/config/swiotlb.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/setup/dma/ops.h) \
    $(wildcard include/config/arch/has/teardown/dma/ops.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dma-debug.h \
    $(wildcard include/config/dma/api/debug.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/dma-direction.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/sgl/alloc.h) \
    $(wildcard include/config/arch/no/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/io.h \
  arch/arm64/include/generated/asm/early_ioremap.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/logic_pio.h \
    $(wildcard include/config/indirect/pio.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/fwnode.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/vmalloc.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
  arch/arm64/include/generated/asm/dma-mapping.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/dma-mapping.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netdev_features.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/clock.h \
    $(wildcard include/config/have/unstable/sched/clock.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/flow_dissector.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/in6.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/in6.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/siphash.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_ether.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/splice.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pipe_fs_i.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_packet.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/flow.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netfilter/nf_conntrack_common.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netfilter/nf_conntrack_common.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/net_namespace.h \
    $(wildcard include/config/ieee802154/6lowpan.h) \
    $(wildcard include/config/ip/sctp.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/nf/defrag/ipv6.h) \
    $(wildcard include/config/netfilter/netlink/acct.h) \
    $(wildcard include/config/nf/ct/netlink/timeout.h) \
    $(wildcard include/config/wext/core.h) \
    $(wildcard include/config/mpls.h) \
    $(wildcard include/config/can.h) \
    $(wildcard include/config/crypto/user.h) \
    $(wildcard include/config/net/ns.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/core.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/snmp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/snmp.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/u64_stats_sync.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/unix.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/packet.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/route/classid.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/mroute/multiple/tables.h) \
    $(wildcard include/config/ip/route/multipath.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/inet_frag.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mroute/multiple/tables.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/dst_ops.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/icmpv6.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/nexthop.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/ieee802154_6lowpan.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/sctp.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/dccp.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/netfilter.h \
    $(wildcard include/config/netfilter/family/arp.h) \
    $(wildcard include/config/netfilter/family/bridge.h) \
    $(wildcard include/config/nf/defrag/ipv4.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netfilter_defs.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netfilter.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/in.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/in.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/conntrack.h \
    $(wildcard include/config/nf/ct/proto/dccp.h) \
    $(wildcard include/config/nf/ct/proto/sctp.h) \
    $(wildcard include/config/nf/ct/proto/gre.h) \
    $(wildcard include/config/nf/conntrack/events.h) \
    $(wildcard include/config/nf/conntrack/labels.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/list_nulls.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netfilter/nf_conntrack_tcp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netfilter/nf_conntrack_tcp.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netfilter/nf_conntrack_dccp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netfilter/nf_conntrack_tuple_common.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netfilter/nf_conntrack_sctp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netfilter/nf_conntrack_sctp.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/nftables.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/xfrm.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/xfrm.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/mpls.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/can.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netns/xdp.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ns_common.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/seq_file_net.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/seq_file.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/key.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/netprio_cgroup.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cgroup.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/sock/cgroup/data.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/data.h) \
    $(wildcard include/config/cgroup/bpf.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/cgroupstats.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/taskstats.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/nsproxy.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/user_namespace.h \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/persistent/keyrings.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kernel_stat.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cgroup-defs.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bpf-cgroup.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bpf.h \
    $(wildcard include/config/bpf/stream/parser.h) \
    $(wildcard include/config/inet.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/bpf.h \
    $(wildcard include/config/efficient/unaligned/access.h) \
    $(wildcard include/config/bpf/kprobe/override.h) \
    $(wildcard include/config/bpf/lirc/mode2.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/bpf_common.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/file.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/psi_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cgroup_subsys.h \
    $(wildcard include/config/cgroup/device.h) \
    $(wildcard include/config/cgroup/freezer.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cgroup/hugetlb.h) \
    $(wildcard include/config/cgroup/pids.h) \
    $(wildcard include/config/cgroup/rdma.h) \
    $(wildcard include/config/cgroup/debug.h) \
  /home/richard/work/cooker/software/linux/kernel/include/net/xdp.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/neighbour.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/netlink.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/scm.h \
    $(wildcard include/config/security/network.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/security.h \
    $(wildcard include/config/security/infiniband.h) \
    $(wildcard include/config/security/network/xfrm.h) \
    $(wildcard include/config/security/path.h) \
    $(wildcard include/config/securityfs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/signal.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/jobctl.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched/task.h \
    $(wildcard include/config/have/copy/thread/tls.h) \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
    $(wildcard include/config/have/arch/thread/struct/whitelist.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netlink.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/netdevice.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/if_link.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_link.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_bonding.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/pkt_cls.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/pkt_sched.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hashtable.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/bluetooth/bluetooth.h \
    $(wildcard include/config/bt/bredr.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/poll.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/poll.h \
  arch/arm64/include/generated/uapi/asm/poll.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/poll.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/eventpoll.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/sock.h \
    $(wildcard include/config/sock/validate/xmit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/page_counter.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/memcontrol.h \
    $(wildcard include/config/memcg/swap.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/vmpressure.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/eventfd.h \
    $(wildcard include/config/eventfd.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/writeback.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/flex_proportions.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/backing-dev-defs.h \
    $(wildcard include/config/debug/fs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/blk_types.h \
    $(wildcard include/config/blk/cgroup/iocost.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/blk-cgroup.h \
    $(wildcard include/config/blk/dev/throttling.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/blkdev.h \
    $(wildcard include/config/blk/rq/alloc/time.h) \
    $(wildcard include/config/blk/wbt.h) \
    $(wildcard include/config/blk/dev/zoned.h) \
    $(wildcard include/config/blk/dev/bsg.h) \
    $(wildcard include/config/blk/debug/fs.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/major.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/genhd.h \
    $(wildcard include/config/fail/make/request.h) \
    $(wildcard include/config/solaris/x86/partition.h) \
    $(wildcard include/config/bsd/disklabel.h) \
    $(wildcard include/config/unixware/disklabel.h) \
    $(wildcard include/config/minix/subpartition.h) \
  arch/arm64/include/generated/asm/local.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/local.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pagemap.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/highmem.h \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/debug/highmem.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cacheflush.h \
    $(wildcard include/config/kgdb.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kgdb.h \
    $(wildcard include/config/have/arch/kgdb.h) \
    $(wildcard include/config/serial/kgdb/nmi.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/kgdb.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pid_namespace.h \
    $(wildcard include/config/pid/ns.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/debug-monitors.h \
  arch/arm64/include/generated/asm/kmap_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/kmap_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/hugetlb_inline.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/mempool.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bio.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bsg.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/bsg.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/blkzoned.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/elevator.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/filter.h \
    $(wildcard include/config/bpf/jit.h) \
    $(wildcard include/config/have/ebpf/jit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cryptohash.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/set_memory.h \
    $(wildcard include/config/arch/has/set/memory.h) \
  arch/arm64/include/generated/asm/set_memory.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/set_memory.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kallsyms.h \
    $(wildcard include/config/kallsyms/all.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/if_vlan.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/etherdevice.h \
  arch/arm64/include/generated/asm/unaligned.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/unaligned.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/unaligned/access_ok.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/unaligned/generic.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rtnetlink.h \
    $(wildcard include/config/net/ingress.h) \
    $(wildcard include/config/net/egress.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/rtnetlink.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_addr.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/if_vlan.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/sch_generic.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/pkt_cls.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/gen_stats.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/gen_stats.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/rtnetlink.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/netlink.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/flow_offload.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rhashtable.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/jhash.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/unaligned/packed_struct.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/filter.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rculist_nulls.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/dst.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/neighbour.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/tcp_states.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/net_tstamp.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/smc.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/l3mdev.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/fib_rules.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/fib_rules.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/fib_notifier.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/bluetooth/hci_core.h \
    $(wildcard include/config/bt/leds.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/leds.h \
    $(wildcard include/config/leds/triggers.h) \
    $(wildcard include/config/leds/brightness/hw/changed.h) \
    $(wildcard include/config/leds/trigger/disk.h) \
    $(wildcard include/config/leds/trigger/mtd.h) \
    $(wildcard include/config/leds/trigger/camera.h) \
    $(wildcard include/config/new/leds.h) \
    $(wildcard include/config/leds/trigger/cpu.h) \
    $(wildcard include/config/leds/trigger/audio.h) \
  /home/richard/work/cooker/software/linux/kernel/include/dt-bindings/leds/common.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/bluetooth/hci.h \
  /home/richard/work/cooker/software/linux/kernel/include/net/bluetooth/hci_sock.h \
  /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/../../../../common/include/adapter.h \
  /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.h \
  /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_api.h \

/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o: $(deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o)

$(deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_serial.o):
