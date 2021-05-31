cmd_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o := aarch64-poky-linux-gcc -Wp,-MD,/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/.esp_rb.o.d  -nostdinc -isystem /opt/fsl-imx-xwayland/5.4-zeus/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/9.2.0/include -I/home/richard/work/cooker/software/linux/kernel/arch/arm64/include -I./arch/arm64/include/generated -I/home/richard/work/cooker/software/linux/kernel/include -I./include -I/home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/home/richard/work/cooker/software/linux/kernel/include/uapi -I./include/generated/uapi -include /home/richard/work/cooker/software/linux/kernel/include/linux/kconfig.h -include /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -mgeneral-regs-only -DCONFIG_AS_LSE=1 -DCONFIG_CC_HAS_K_CONSTRAINT=1 -fno-asynchronous-unwind-tables -Wno-psabi -mabi=lp64 -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -fmacro-prefix-map=/home/richard/work/cooker/software/linux/kernel/= -Wno-packed-not-aligned --sysroot=/opt/fsl-imx-xwayland/5.4-zeus/sysroots/aarch64-poky-linux -mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=1136 -DCONFIG_SUPPORT_ESP_SERIAL -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/../../../../common/include -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32 -I/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/sdio  -DMODULE  -DKBUILD_BASENAME='"esp_rb"' -DKBUILD_MODNAME='"esp32_sdio"' -c -o /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.c

source_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o := /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.c

deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o := \
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
  /home/richard/work/cooker/software/linux/kernel/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /opt/fsl-imx-xwayland/5.4-zeus/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/9.2.0/include/stdarg.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/limits.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/limits.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/int-ll64.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/int-ll64.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bitsperlong.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/bitsperlong.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stddef.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/stddef.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/posix_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/linkage.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/stringify.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/barrier.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kasan-checks.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/barrier.h \
    $(wildcard include/config/smp.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/linkage.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bitops.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bits.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/const.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/const.h \
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
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/jump_label.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/insn.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cpucaps.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
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
  /home/richard/work/cooker/software/linux/kernel/include/linux/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/errno.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/errno.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/asm-generic/errno-base.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
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
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
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
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/preemption.h) \
    $(wildcard include/config/debug/rseq.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/sched.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/current.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/pid.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/irqflags.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
    $(wildcard include/config/arm64/sve.h) \
    $(wildcard include/config/arm64/cnp.h) \
    $(wildcard include/config/arm64/ptr/auth.h) \
    $(wildcard include/config/arm64/pseudo/nmi.h) \
    $(wildcard include/config/arm64/debug/priority/masking.h) \
    $(wildcard include/config/arm64/ssbd.h) \
    $(wildcard include/config/arm64/pa/bits.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/hwcap.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/hwcap.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/bug.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/brk-imm.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/ptrace.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/sve_context.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/preempt.h \
    $(wildcard include/config/preempt.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/thread_info.h \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/restart_block.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/time64.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/time.h \
  /home/richard/work/cooker/software/linux/kernel/include/uapi/linux/time_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/thread_info.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/arm64/va/bits/52.h) \
    $(wildcard include/config/kasan/shadow/offset.h) \
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
  /home/richard/work/cooker/software/linux/kernel/include/linux/bottom_half.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm64/force/52bit.h) \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm64/tagged/addr/abi.h) \
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
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/uapi/asm/sigcontext.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/bitmap.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rcutree.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/wait.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
  arch/arm64/include/generated/asm/mmiowb.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/spinlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/spinlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/paravirt.h) \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qrwlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/rwlock_types.h \
  /home/richard/work/cooker/software/linux/kernel/arch/arm64/include/asm/spinlock.h \
  arch/arm64/include/generated/asm/qrwlock.h \
  /home/richard/work/cooker/software/linux/kernel/include/asm-generic/qrwlock.h \
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
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/ktime.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/seqlock.h \
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
  /home/richard/work/cooker/software/linux/kernel/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/zone/dma.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/gfp.h \
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
    $(wildcard include/config/tree/srcu.h) \
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
  /home/richard/work/cooker/software/linux/kernel/include/linux/overflow.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/percpu-refcount.h \
  /home/richard/work/cooker/software/linux/kernel/include/linux/kasan.h \
    $(wildcard include/config/kasan/generic.h) \
  /home/richard/work/cooker/software/linux/kernel/include/linux/semaphore.h \
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
  /home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.h \

/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o: $(deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o)

$(deps_/home/richard/work/cooker/software/linux/patch/wifi/esp32/esp-hosted/host/linux/host_driver/esp32/esp_rb.o):
