
vuln_strcpy_O2:     file format elf64-x86-64


Disassembly of section .init:

000000000040033c <_init>:
  40033c:	f3 0f 1e fa          	endbr64
  400340:	48 83 ec 08          	sub    $0x8,%rsp
  400344:	48 8b 05 95 2c 00 00 	mov    0x2c95(%rip),%rax        # 402fe0 <__gmon_start__@Base>
  40034b:	48 85 c0             	test   %rax,%rax
  40034e:	74 02                	je     400352 <_init+0x16>
  400350:	ff d0                	call   *%rax
  400352:	48 83 c4 08          	add    $0x8,%rsp
  400356:	c3                   	ret

Disassembly of section .plt:

0000000000400360 <strcpy@plt-0x10>:
  400360:	ff 35 8a 2c 00 00    	push   0x2c8a(%rip)        # 402ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400366:	ff 25 8c 2c 00 00    	jmp    *0x2c8c(%rip)        # 402ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40036c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400370 <strcpy@plt>:
  400370:	ff 25 8a 2c 00 00    	jmp    *0x2c8a(%rip)        # 403000 <strcpy@GLIBC_2.2.5>
  400376:	68 00 00 00 00       	push   $0x0
  40037b:	e9 e0 ff ff ff       	jmp    400360 <_init+0x24>

0000000000400380 <printf@plt>:
  400380:	ff 25 82 2c 00 00    	jmp    *0x2c82(%rip)        # 403008 <printf@GLIBC_2.2.5>
  400386:	68 01 00 00 00       	push   $0x1
  40038b:	e9 d0 ff ff ff       	jmp    400360 <_init+0x24>

Disassembly of section .text:

0000000000400390 <main>:
  400390:	83 ff 01             	cmp    $0x1,%edi
  400393:	7f 03                	jg     400398 <main+0x8>
  400395:	31 c0                	xor    %eax,%eax
  400397:	c3                   	ret
  400398:	50                   	push   %rax
  400399:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  40039d:	e8 fe 00 00 00       	call   4004a0 <vulnerable>
  4003a2:	31 c0                	xor    %eax,%eax
  4003a4:	5a                   	pop    %rdx
  4003a5:	c3                   	ret
  4003a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4003ad:	00 00 00 

00000000004003b0 <_start>:
  4003b0:	f3 0f 1e fa          	endbr64
  4003b4:	31 ed                	xor    %ebp,%ebp
  4003b6:	49 89 d1             	mov    %rdx,%r9
  4003b9:	5e                   	pop    %rsi
  4003ba:	48 89 e2             	mov    %rsp,%rdx
  4003bd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4003c1:	50                   	push   %rax
  4003c2:	54                   	push   %rsp
  4003c3:	45 31 c0             	xor    %r8d,%r8d
  4003c6:	31 c9                	xor    %ecx,%ecx
  4003c8:	48 c7 c7 90 03 40 00 	mov    $0x400390,%rdi
  4003cf:	ff 15 03 2c 00 00    	call   *0x2c03(%rip)        # 402fd8 <__libc_start_main@GLIBC_2.34>
  4003d5:	f4                   	hlt
  4003d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4003dd:	00 00 00 

00000000004003e0 <_dl_relocate_static_pie>:
  4003e0:	f3 0f 1e fa          	endbr64
  4003e4:	c3                   	ret
  4003e5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4003ec:	00 00 00 
  4003ef:	90                   	nop

00000000004003f0 <deregister_tm_clones>:
  4003f0:	b8 18 30 40 00       	mov    $0x403018,%eax
  4003f5:	48 3d 18 30 40 00    	cmp    $0x403018,%rax
  4003fb:	74 13                	je     400410 <deregister_tm_clones+0x20>
  4003fd:	b8 00 00 00 00       	mov    $0x0,%eax
  400402:	48 85 c0             	test   %rax,%rax
  400405:	74 09                	je     400410 <deregister_tm_clones+0x20>
  400407:	bf 18 30 40 00       	mov    $0x403018,%edi
  40040c:	ff e0                	jmp    *%rax
  40040e:	66 90                	xchg   %ax,%ax
  400410:	c3                   	ret
  400411:	0f 1f 40 00          	nopl   0x0(%rax)
  400415:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40041c:	00 00 00 00 

0000000000400420 <register_tm_clones>:
  400420:	be 18 30 40 00       	mov    $0x403018,%esi
  400425:	48 81 ee 18 30 40 00 	sub    $0x403018,%rsi
  40042c:	48 89 f0             	mov    %rsi,%rax
  40042f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  400433:	48 c1 f8 03          	sar    $0x3,%rax
  400437:	48 01 c6             	add    %rax,%rsi
  40043a:	48 d1 fe             	sar    $1,%rsi
  40043d:	74 11                	je     400450 <register_tm_clones+0x30>
  40043f:	b8 00 00 00 00       	mov    $0x0,%eax
  400444:	48 85 c0             	test   %rax,%rax
  400447:	74 07                	je     400450 <register_tm_clones+0x30>
  400449:	bf 18 30 40 00       	mov    $0x403018,%edi
  40044e:	ff e0                	jmp    *%rax
  400450:	c3                   	ret
  400451:	0f 1f 40 00          	nopl   0x0(%rax)
  400455:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40045c:	00 00 00 00 

0000000000400460 <__do_global_dtors_aux>:
  400460:	f3 0f 1e fa          	endbr64
  400464:	80 3d a9 2b 00 00 00 	cmpb   $0x0,0x2ba9(%rip)        # 403014 <completed.0>
  40046b:	75 13                	jne    400480 <__do_global_dtors_aux+0x20>
  40046d:	55                   	push   %rbp
  40046e:	48 89 e5             	mov    %rsp,%rbp
  400471:	e8 7a ff ff ff       	call   4003f0 <deregister_tm_clones>
  400476:	c6 05 97 2b 00 00 01 	movb   $0x1,0x2b97(%rip)        # 403014 <completed.0>
  40047d:	5d                   	pop    %rbp
  40047e:	c3                   	ret
  40047f:	90                   	nop
  400480:	c3                   	ret
  400481:	0f 1f 40 00          	nopl   0x0(%rax)
  400485:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40048c:	00 00 00 00 

0000000000400490 <frame_dummy>:
  400490:	f3 0f 1e fa          	endbr64
  400494:	eb 8a                	jmp    400420 <register_tm_clones>
  400496:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40049d:	00 00 00 

00000000004004a0 <vulnerable>:
  4004a0:	48 83 ec 18          	sub    $0x18,%rsp
  4004a4:	48 89 fe             	mov    %rdi,%rsi
  4004a7:	48 8d 7c 24 06       	lea    0x6(%rsp),%rdi
  4004ac:	e8 bf fe ff ff       	call   400370 <strcpy@plt>
  4004b1:	48 8d 74 24 06       	lea    0x6(%rsp),%rsi
  4004b6:	bf b8 11 40 00       	mov    $0x4011b8,%edi
  4004bb:	31 c0                	xor    %eax,%eax
  4004bd:	e8 be fe ff ff       	call   400380 <printf@plt>
  4004c2:	48 83 c4 18          	add    $0x18,%rsp
  4004c6:	c3                   	ret

Disassembly of section .fini:

00000000004004c8 <_fini>:
  4004c8:	f3 0f 1e fa          	endbr64
  4004cc:	48 83 ec 08          	sub    $0x8,%rsp
  4004d0:	48 83 c4 08          	add    $0x8,%rsp
  4004d4:	c3                   	ret
