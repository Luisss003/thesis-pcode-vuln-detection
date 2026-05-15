
vuln_strcpy_O0:     file format elf64-x86-64


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

0000000000400390 <_start>:
  400390:	f3 0f 1e fa          	endbr64
  400394:	31 ed                	xor    %ebp,%ebp
  400396:	49 89 d1             	mov    %rdx,%r9
  400399:	5e                   	pop    %rsi
  40039a:	48 89 e2             	mov    %rsp,%rdx
  40039d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4003a1:	50                   	push   %rax
  4003a2:	54                   	push   %rsp
  4003a3:	45 31 c0             	xor    %r8d,%r8d
  4003a6:	31 c9                	xor    %ecx,%ecx
  4003a8:	48 c7 c7 ae 04 40 00 	mov    $0x4004ae,%rdi
  4003af:	ff 15 23 2c 00 00    	call   *0x2c23(%rip)        # 402fd8 <__libc_start_main@GLIBC_2.34>
  4003b5:	f4                   	hlt
  4003b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4003bd:	00 00 00 

00000000004003c0 <_dl_relocate_static_pie>:
  4003c0:	f3 0f 1e fa          	endbr64
  4003c4:	c3                   	ret
  4003c5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4003cc:	00 00 00 
  4003cf:	90                   	nop

00000000004003d0 <deregister_tm_clones>:
  4003d0:	b8 18 30 40 00       	mov    $0x403018,%eax
  4003d5:	48 3d 18 30 40 00    	cmp    $0x403018,%rax
  4003db:	74 13                	je     4003f0 <deregister_tm_clones+0x20>
  4003dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4003e2:	48 85 c0             	test   %rax,%rax
  4003e5:	74 09                	je     4003f0 <deregister_tm_clones+0x20>
  4003e7:	bf 18 30 40 00       	mov    $0x403018,%edi
  4003ec:	ff e0                	jmp    *%rax
  4003ee:	66 90                	xchg   %ax,%ax
  4003f0:	c3                   	ret
  4003f1:	0f 1f 40 00          	nopl   0x0(%rax)
  4003f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4003fc:	00 00 00 00 

0000000000400400 <register_tm_clones>:
  400400:	be 18 30 40 00       	mov    $0x403018,%esi
  400405:	48 81 ee 18 30 40 00 	sub    $0x403018,%rsi
  40040c:	48 89 f0             	mov    %rsi,%rax
  40040f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  400413:	48 c1 f8 03          	sar    $0x3,%rax
  400417:	48 01 c6             	add    %rax,%rsi
  40041a:	48 d1 fe             	sar    $1,%rsi
  40041d:	74 11                	je     400430 <register_tm_clones+0x30>
  40041f:	b8 00 00 00 00       	mov    $0x0,%eax
  400424:	48 85 c0             	test   %rax,%rax
  400427:	74 07                	je     400430 <register_tm_clones+0x30>
  400429:	bf 18 30 40 00       	mov    $0x403018,%edi
  40042e:	ff e0                	jmp    *%rax
  400430:	c3                   	ret
  400431:	0f 1f 40 00          	nopl   0x0(%rax)
  400435:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40043c:	00 00 00 00 

0000000000400440 <__do_global_dtors_aux>:
  400440:	f3 0f 1e fa          	endbr64
  400444:	80 3d c9 2b 00 00 00 	cmpb   $0x0,0x2bc9(%rip)        # 403014 <completed.0>
  40044b:	75 13                	jne    400460 <__do_global_dtors_aux+0x20>
  40044d:	55                   	push   %rbp
  40044e:	48 89 e5             	mov    %rsp,%rbp
  400451:	e8 7a ff ff ff       	call   4003d0 <deregister_tm_clones>
  400456:	c6 05 b7 2b 00 00 01 	movb   $0x1,0x2bb7(%rip)        # 403014 <completed.0>
  40045d:	5d                   	pop    %rbp
  40045e:	c3                   	ret
  40045f:	90                   	nop
  400460:	c3                   	ret
  400461:	0f 1f 40 00          	nopl   0x0(%rax)
  400465:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40046c:	00 00 00 00 

0000000000400470 <frame_dummy>:
  400470:	f3 0f 1e fa          	endbr64
  400474:	eb 8a                	jmp    400400 <register_tm_clones>

0000000000400476 <vulnerable>:
  400476:	55                   	push   %rbp
  400477:	48 89 e5             	mov    %rsp,%rbp
  40047a:	48 83 ec 20          	sub    $0x20,%rsp
  40047e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  400482:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  400486:	48 8d 45 f6          	lea    -0xa(%rbp),%rax
  40048a:	48 89 d6             	mov    %rdx,%rsi
  40048d:	48 89 c7             	mov    %rax,%rdi
  400490:	e8 db fe ff ff       	call   400370 <strcpy@plt>
  400495:	48 8d 45 f6          	lea    -0xa(%rbp),%rax
  400499:	48 89 c6             	mov    %rax,%rsi
  40049c:	bf b8 11 40 00       	mov    $0x4011b8,%edi
  4004a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4004a6:	e8 d5 fe ff ff       	call   400380 <printf@plt>
  4004ab:	90                   	nop
  4004ac:	c9                   	leave
  4004ad:	c3                   	ret

00000000004004ae <main>:
  4004ae:	55                   	push   %rbp
  4004af:	48 89 e5             	mov    %rsp,%rbp
  4004b2:	48 83 ec 10          	sub    $0x10,%rsp
  4004b6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4004b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  4004bd:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4004c1:	7e 13                	jle    4004d6 <main+0x28>
  4004c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4004c7:	48 83 c0 08          	add    $0x8,%rax
  4004cb:	48 8b 00             	mov    (%rax),%rax
  4004ce:	48 89 c7             	mov    %rax,%rdi
  4004d1:	e8 a0 ff ff ff       	call   400476 <vulnerable>
  4004d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4004db:	c9                   	leave
  4004dc:	c3                   	ret

Disassembly of section .fini:

00000000004004e0 <_fini>:
  4004e0:	f3 0f 1e fa          	endbr64
  4004e4:	48 83 ec 08          	sub    $0x8,%rsp
  4004e8:	48 83 c4 08          	add    $0x8,%rsp
  4004ec:	c3                   	ret
