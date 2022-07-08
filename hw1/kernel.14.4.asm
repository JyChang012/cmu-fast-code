
kernel.x:     file format elf64-x86-64


Disassembly of section .init:

0000000000400490 <_init>:
  400490:	48 83 ec 08          	sub    $0x8,%rsp
  400494:	48 8b 05 5d 1b 20 00 	mov    0x201b5d(%rip),%rax        # 601ff8 <__gmon_start__>
  40049b:	48 85 c0             	test   %rax,%rax
  40049e:	74 05                	je     4004a5 <_init+0x15>
  4004a0:	e8 4b 00 00 00       	callq  4004f0 <__gmon_start__@plt>
  4004a5:	48 83 c4 08          	add    $0x8,%rsp
  4004a9:	c3                   	retq   

Disassembly of section .plt:

00000000004004b0 <.plt>:
  4004b0:	ff 35 52 1b 20 00    	pushq  0x201b52(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004b6:	ff 25 54 1b 20 00    	jmpq   *0x201b54(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004c0 <free@plt>:
  4004c0:	ff 25 52 1b 20 00    	jmpq   *0x201b52(%rip)        # 602018 <free@GLIBC_2.2.5>
  4004c6:	68 00 00 00 00       	pushq  $0x0
  4004cb:	e9 e0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004d0 <printf@plt>:
  4004d0:	ff 25 4a 1b 20 00    	jmpq   *0x201b4a(%rip)        # 602020 <printf@GLIBC_2.2.5>
  4004d6:	68 01 00 00 00       	pushq  $0x1
  4004db:	e9 d0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004e0 <__libc_start_main@plt>:
  4004e0:	ff 25 42 1b 20 00    	jmpq   *0x201b42(%rip)        # 602028 <__libc_start_main@GLIBC_2.2.5>
  4004e6:	68 02 00 00 00       	pushq  $0x2
  4004eb:	e9 c0 ff ff ff       	jmpq   4004b0 <.plt>

00000000004004f0 <__gmon_start__@plt>:
  4004f0:	ff 25 3a 1b 20 00    	jmpq   *0x201b3a(%rip)        # 602030 <__gmon_start__>
  4004f6:	68 03 00 00 00       	pushq  $0x3
  4004fb:	e9 b0 ff ff ff       	jmpq   4004b0 <.plt>

0000000000400500 <posix_memalign@plt>:
  400500:	ff 25 32 1b 20 00    	jmpq   *0x201b32(%rip)        # 602038 <posix_memalign@GLIBC_2.2.5>
  400506:	68 04 00 00 00       	pushq  $0x4
  40050b:	e9 a0 ff ff ff       	jmpq   4004b0 <.plt>

0000000000400510 <rand@plt>:
  400510:	ff 25 2a 1b 20 00    	jmpq   *0x201b2a(%rip)        # 602040 <rand@GLIBC_2.2.5>
  400516:	68 05 00 00 00       	pushq  $0x5
  40051b:	e9 90 ff ff ff       	jmpq   4004b0 <.plt>

Disassembly of section .text:

0000000000400520 <main>:
  400520:	55                   	push   %rbp
  400521:	48 89 e5             	mov    %rsp,%rbp
  400524:	41 57                	push   %r15
  400526:	41 bf 00 0e 00 00    	mov    $0xe00,%r15d
  40052c:	41 56                	push   %r14
  40052e:	41 55                	push   %r13
  400530:	41 54                	push   %r12
  400532:	53                   	push   %rbx
  400533:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400537:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  40053e:	48 c7 44 24 10 00 04 	movq   $0x400,0x10(%rsp)
  400545:	00 00 
  400547:	c7 44 24 1c 20 00 00 	movl   $0x20,0x1c(%rsp)
  40054e:	00 
  40054f:	90                   	nop
  400550:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  400555:	4c 89 fa             	mov    %r15,%rdx
  400558:	be 40 00 00 00       	mov    $0x40,%esi
  40055d:	31 db                	xor    %ebx,%ebx
  40055f:	e8 9c ff ff ff       	callq  400500 <posix_memalign@plt>
  400564:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400569:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40056e:	be 40 00 00 00       	mov    $0x40,%esi
  400573:	e8 88 ff ff ff       	callq  400500 <posix_memalign@plt>
  400578:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  40057d:	ba c0 01 00 00       	mov    $0x1c0,%edx
  400582:	be 40 00 00 00       	mov    $0x40,%esi
  400587:	e8 74 ff ff ff       	callq  400500 <posix_memalign@plt>
  40058c:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  400593:	00 
  400594:	ba c0 01 00 00       	mov    $0x1c0,%edx
  400599:	be 40 00 00 00       	mov    $0x40,%esi
  40059e:	e8 5d ff ff ff       	callq  400500 <posix_memalign@plt>
  4005a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4005a8:	49 89 dc             	mov    %rbx,%r12
  4005ab:	4c 03 64 24 20       	add    0x20(%rsp),%r12
  4005b0:	48 83 c3 08          	add    $0x8,%rbx
  4005b4:	e8 57 ff ff ff       	callq  400510 <rand@plt>
  4005b9:	c5 fb 2a c0          	vcvtsi2sd %eax,%xmm0,%xmm0
  4005bd:	4c 39 fb             	cmp    %r15,%rbx
  4005c0:	c5 fb 5e 05 a0 0e 00 	vdivsd 0xea0(%rip),%xmm0,%xmm0        # 401468 <__dso_handle+0x20>
  4005c7:	00 
  4005c8:	c4 c1 7b 11 04 24    	vmovsd %xmm0,(%r12)
  4005ce:	75 d8                	jne    4005a8 <main+0x88>
  4005d0:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  4005d5:	31 db                	xor    %ebx,%ebx
  4005d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4005de:	00 00 
  4005e0:	49 89 dc             	mov    %rbx,%r12
  4005e3:	4c 03 64 24 40       	add    0x40(%rsp),%r12
  4005e8:	48 83 c3 08          	add    $0x8,%rbx
  4005ec:	e8 1f ff ff ff       	callq  400510 <rand@plt>
  4005f1:	c5 fb 2a c0          	vcvtsi2sd %eax,%xmm0,%xmm0
  4005f5:	49 39 dd             	cmp    %rbx,%r13
  4005f8:	c5 fb 5e 05 68 0e 00 	vdivsd 0xe68(%rip),%xmm0,%xmm0        # 401468 <__dso_handle+0x20>
  4005ff:	00 
  400600:	c4 c1 7b 11 04 24    	vmovsd %xmm0,(%r12)
  400606:	75 d8                	jne    4005e0 <main+0xc0>
  400608:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
  40060f:	00 
  400610:	4c 8b 4c 24 60       	mov    0x60(%rsp),%r9
  400615:	48 8d 41 20          	lea    0x20(%rcx),%rax
  400619:	49 39 c1             	cmp    %rax,%r9
  40061c:	0f 82 f6 07 00 00    	jb     400e18 <main+0x8f8>
  400622:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  400626:	c4 c1 79 11 01       	vmovupd %xmm0,(%r9)
  40062b:	c4 c3 7d 19 41 10 01 	vextractf128 $0x1,%ymm0,0x10(%r9)
  400632:	c5 f9 11 01          	vmovupd %xmm0,(%rcx)
  400636:	c4 e3 7d 19 41 10 01 	vextractf128 $0x1,%ymm0,0x10(%rcx)
  40063d:	c4 c1 79 11 41 20    	vmovupd %xmm0,0x20(%r9)
  400643:	c4 c3 7d 19 41 30 01 	vextractf128 $0x1,%ymm0,0x30(%r9)
  40064a:	c5 f9 11 41 20       	vmovupd %xmm0,0x20(%rcx)
  40064f:	c4 e3 7d 19 41 30 01 	vextractf128 $0x1,%ymm0,0x30(%rcx)
  400656:	c4 c1 79 11 41 40    	vmovupd %xmm0,0x40(%r9)
  40065c:	c4 c3 7d 19 41 50 01 	vextractf128 $0x1,%ymm0,0x50(%r9)
  400663:	c5 f9 11 41 40       	vmovupd %xmm0,0x40(%rcx)
  400668:	c4 e3 7d 19 41 50 01 	vextractf128 $0x1,%ymm0,0x50(%rcx)
  40066f:	c4 c1 79 11 41 60    	vmovupd %xmm0,0x60(%r9)
  400675:	c4 c3 7d 19 41 70 01 	vextractf128 $0x1,%ymm0,0x70(%r9)
  40067c:	c5 f9 11 41 60       	vmovupd %xmm0,0x60(%rcx)
  400681:	c4 e3 7d 19 41 70 01 	vextractf128 $0x1,%ymm0,0x70(%rcx)
  400688:	c4 c1 79 11 81 80 00 	vmovupd %xmm0,0x80(%r9)
  40068f:	00 00 
  400691:	c4 c3 7d 19 81 90 00 	vextractf128 $0x1,%ymm0,0x90(%r9)
  400698:	00 00 01 
  40069b:	c5 f9 11 81 80 00 00 	vmovupd %xmm0,0x80(%rcx)
  4006a2:	00 
  4006a3:	c4 e3 7d 19 81 90 00 	vextractf128 $0x1,%ymm0,0x90(%rcx)
  4006aa:	00 00 01 
  4006ad:	c4 c1 79 11 81 a0 00 	vmovupd %xmm0,0xa0(%r9)
  4006b4:	00 00 
  4006b6:	c4 c3 7d 19 81 b0 00 	vextractf128 $0x1,%ymm0,0xb0(%r9)
  4006bd:	00 00 01 
  4006c0:	c5 f9 11 81 a0 00 00 	vmovupd %xmm0,0xa0(%rcx)
  4006c7:	00 
  4006c8:	c4 e3 7d 19 81 b0 00 	vextractf128 $0x1,%ymm0,0xb0(%rcx)
  4006cf:	00 00 01 
  4006d2:	c4 c1 79 11 81 c0 00 	vmovupd %xmm0,0xc0(%r9)
  4006d9:	00 00 
  4006db:	c4 c3 7d 19 81 d0 00 	vextractf128 $0x1,%ymm0,0xd0(%r9)
  4006e2:	00 00 01 
  4006e5:	c5 f9 11 81 c0 00 00 	vmovupd %xmm0,0xc0(%rcx)
  4006ec:	00 
  4006ed:	c4 e3 7d 19 81 d0 00 	vextractf128 $0x1,%ymm0,0xd0(%rcx)
  4006f4:	00 00 01 
  4006f7:	c4 c1 79 11 81 e0 00 	vmovupd %xmm0,0xe0(%r9)
  4006fe:	00 00 
  400700:	c4 c3 7d 19 81 f0 00 	vextractf128 $0x1,%ymm0,0xf0(%r9)
  400707:	00 00 01 
  40070a:	c5 f9 11 81 e0 00 00 	vmovupd %xmm0,0xe0(%rcx)
  400711:	00 
  400712:	c4 e3 7d 19 81 f0 00 	vextractf128 $0x1,%ymm0,0xf0(%rcx)
  400719:	00 00 01 
  40071c:	c4 c1 79 11 81 00 01 	vmovupd %xmm0,0x100(%r9)
  400723:	00 00 
  400725:	c4 c3 7d 19 81 10 01 	vextractf128 $0x1,%ymm0,0x110(%r9)
  40072c:	00 00 01 
  40072f:	c5 f9 11 81 00 01 00 	vmovupd %xmm0,0x100(%rcx)
  400736:	00 
  400737:	c4 e3 7d 19 81 10 01 	vextractf128 $0x1,%ymm0,0x110(%rcx)
  40073e:	00 00 01 
  400741:	c4 c1 79 11 81 20 01 	vmovupd %xmm0,0x120(%r9)
  400748:	00 00 
  40074a:	c4 c3 7d 19 81 30 01 	vextractf128 $0x1,%ymm0,0x130(%r9)
  400751:	00 00 01 
  400754:	c5 f9 11 81 20 01 00 	vmovupd %xmm0,0x120(%rcx)
  40075b:	00 
  40075c:	c4 e3 7d 19 81 30 01 	vextractf128 $0x1,%ymm0,0x130(%rcx)
  400763:	00 00 01 
  400766:	c4 c1 79 11 81 40 01 	vmovupd %xmm0,0x140(%r9)
  40076d:	00 00 
  40076f:	c4 c3 7d 19 81 50 01 	vextractf128 $0x1,%ymm0,0x150(%r9)
  400776:	00 00 01 
  400779:	c5 f9 11 81 40 01 00 	vmovupd %xmm0,0x140(%rcx)
  400780:	00 
  400781:	c4 e3 7d 19 81 50 01 	vextractf128 $0x1,%ymm0,0x150(%rcx)
  400788:	00 00 01 
  40078b:	c4 c1 79 11 81 60 01 	vmovupd %xmm0,0x160(%r9)
  400792:	00 00 
  400794:	c4 c3 7d 19 81 70 01 	vextractf128 $0x1,%ymm0,0x170(%r9)
  40079b:	00 00 01 
  40079e:	c5 f9 11 81 60 01 00 	vmovupd %xmm0,0x160(%rcx)
  4007a5:	00 
  4007a6:	c4 e3 7d 19 81 70 01 	vextractf128 $0x1,%ymm0,0x170(%rcx)
  4007ad:	00 00 01 
  4007b0:	c4 c1 79 11 81 80 01 	vmovupd %xmm0,0x180(%r9)
  4007b7:	00 00 
  4007b9:	c4 c3 7d 19 81 90 01 	vextractf128 $0x1,%ymm0,0x190(%r9)
  4007c0:	00 00 01 
  4007c3:	c5 f9 11 81 80 01 00 	vmovupd %xmm0,0x180(%rcx)
  4007ca:	00 
  4007cb:	c4 e3 7d 19 81 90 01 	vextractf128 $0x1,%ymm0,0x190(%rcx)
  4007d2:	00 00 01 
  4007d5:	c4 c1 79 11 81 a0 01 	vmovupd %xmm0,0x1a0(%r9)
  4007dc:	00 00 
  4007de:	c4 c3 7d 19 81 b0 01 	vextractf128 $0x1,%ymm0,0x1b0(%r9)
  4007e5:	00 00 01 
  4007e8:	c5 f9 11 81 a0 01 00 	vmovupd %xmm0,0x1a0(%rcx)
  4007ef:	00 
  4007f0:	c4 e3 7d 19 81 b0 01 	vextractf128 $0x1,%ymm0,0x1b0(%rcx)
  4007f7:	00 00 01 
  4007fa:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  4007ff:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  400804:	4c 8d 5b 70          	lea    0x70(%rbx),%r11
  400808:	48 89 1c 24          	mov    %rbx,(%rsp)
  40080c:	48 89 df             	mov    %rbx,%rdi
  40080f:	48 8d 70 08          	lea    0x8(%rax),%rsi
  400813:	4c 8d 40 10          	lea    0x10(%rax),%r8
  400817:	48 8d 50 18          	lea    0x18(%rax),%rdx
  40081b:	4f 8d 74 1f 90       	lea    -0x70(%r15,%r11,1),%r14
  400820:	48 8d 99 c0 01 00 00 	lea    0x1c0(%rcx),%rbx
  400827:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40082c:	0f 1f 40 00          	nopl   0x0(%rax)
  400830:	48 39 f3             	cmp    %rsi,%rbx
  400833:	0f 96 c0             	setbe  %al
  400836:	4c 39 c1             	cmp    %r8,%rcx
  400839:	41 0f 93 c2          	setae  %r10b
  40083d:	44 09 d0             	or     %r10d,%eax
  400840:	4c 39 c3             	cmp    %r8,%rbx
  400843:	41 0f 96 c2          	setbe  %r10b
  400847:	48 39 ca             	cmp    %rcx,%rdx
  40084a:	41 0f 96 c4          	setbe  %r12b
  40084e:	45 09 e2             	or     %r12d,%r10d
  400851:	44 21 d0             	and    %r10d,%eax
  400854:	48 39 fb             	cmp    %rdi,%rbx
  400857:	41 0f 96 c2          	setbe  %r10b
  40085b:	4c 39 d9             	cmp    %r11,%rcx
  40085e:	41 0f 93 c4          	setae  %r12b
  400862:	45 09 e2             	or     %r12d,%r10d
  400865:	44 21 d0             	and    %r10d,%eax
  400868:	4c 8d 56 18          	lea    0x18(%rsi),%r10
  40086c:	4c 39 d1             	cmp    %r10,%rcx
  40086f:	41 0f 93 c2          	setae  %r10b
  400873:	48 39 d3             	cmp    %rdx,%rbx
  400876:	41 0f 96 c4          	setbe  %r12b
  40087a:	45 09 e2             	or     %r12d,%r10d
  40087d:	44 84 d0             	test   %r10b,%al
  400880:	0f 84 fa 04 00 00    	je     400d80 <main+0x860>
  400886:	48 8d 46 f8          	lea    -0x8(%rsi),%rax
  40088a:	48 39 c3             	cmp    %rax,%rbx
  40088d:	48 89 c8             	mov    %rcx,%rax
  400890:	41 0f 96 c5          	setbe  %r13b
  400894:	48 39 f1             	cmp    %rsi,%rcx
  400897:	41 0f 93 c4          	setae  %r12b
  40089b:	45 31 d2             	xor    %r10d,%r10d
  40089e:	45 08 e5             	or     %r12b,%r13b
  4008a1:	0f 84 d9 04 00 00    	je     400d80 <main+0x860>
  4008a7:	c5 f9 10 18          	vmovupd (%rax),%xmm3
  4008ab:	48 83 e8 80          	sub    $0xffffffffffffff80,%rax
  4008af:	c5 f9 10 48 a0       	vmovupd -0x60(%rax),%xmm1
  4008b4:	c4 e3 65 18 58 90 01 	vinsertf128 $0x1,-0x70(%rax),%ymm3,%ymm3
  4008bb:	c5 f9 10 50 c0       	vmovupd -0x40(%rax),%xmm2
  4008c0:	c4 e3 75 18 48 b0 01 	vinsertf128 $0x1,-0x50(%rax),%ymm1,%ymm1
  4008c7:	c5 f9 10 40 e0       	vmovupd -0x20(%rax),%xmm0
  4008cc:	c4 e3 6d 18 50 d0 01 	vinsertf128 $0x1,-0x30(%rax),%ymm2,%ymm2
  4008d3:	c4 e3 7d 18 40 f0 01 	vinsertf128 $0x1,-0x10(%rax),%ymm0,%ymm0
  4008da:	c4 e3 65 18 e1 01    	vinsertf128 $0x1,%xmm1,%ymm3,%ymm4
  4008e0:	c4 e3 65 06 c9 31    	vperm2f128 $0x31,%ymm1,%ymm3,%ymm1
  4008e6:	c5 dd 14 d9          	vunpcklpd %ymm1,%ymm4,%ymm3
  4008ea:	c5 dd 15 c9          	vunpckhpd %ymm1,%ymm4,%ymm1
  4008ee:	c4 e3 6d 18 e0 01    	vinsertf128 $0x1,%xmm0,%ymm2,%ymm4
  4008f4:	c4 e3 6d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm2,%ymm0
  4008fa:	c5 dd 14 d0          	vunpcklpd %ymm0,%ymm4,%ymm2
  4008fe:	c5 dd 15 c0          	vunpckhpd %ymm0,%ymm4,%ymm0
  400902:	c4 a1 79 10 24 17    	vmovupd (%rdi,%r10,1),%xmm4
  400908:	c4 e3 65 18 f2 01    	vinsertf128 $0x1,%xmm2,%ymm3,%ymm6
  40090e:	c4 e3 65 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm3,%ymm2
  400914:	c4 a3 5d 18 64 17 10 	vinsertf128 $0x1,0x10(%rdi,%r10,1),%ymm4,%ymm4
  40091b:	01 
  40091c:	49 83 c2 20          	add    $0x20,%r10
  400920:	c5 cd 14 ea          	vunpcklpd %ymm2,%ymm6,%ymm5
  400924:	c4 e2 7d 19 5e f8    	vbroadcastsd -0x8(%rsi),%ymm3
  40092a:	c5 cd 15 f2          	vunpckhpd %ymm2,%ymm6,%ymm6
  40092e:	c4 e2 d5 98 dc       	vfmadd132pd %ymm4,%ymm5,%ymm3
  400933:	c4 e3 75 18 e8 01    	vinsertf128 $0x1,%xmm0,%ymm1,%ymm5
  400939:	c4 e3 75 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm1,%ymm0
  40093f:	c4 c2 7d 19 10       	vbroadcastsd (%r8),%ymm2
  400944:	c4 e2 7d 19 0e       	vbroadcastsd (%rsi),%ymm1
  400949:	c5 d5 14 f8          	vunpcklpd %ymm0,%ymm5,%ymm7
  40094d:	c4 e2 cd 98 d4       	vfmadd132pd %ymm4,%ymm6,%ymm2
  400952:	c5 d5 15 e8          	vunpckhpd %ymm0,%ymm5,%ymm5
  400956:	c4 e2 7d 19 02       	vbroadcastsd (%rdx),%ymm0
  40095b:	c4 e2 c5 98 cc       	vfmadd132pd %ymm4,%ymm7,%ymm1
  400960:	c4 e2 d5 98 c4       	vfmadd132pd %ymm4,%ymm5,%ymm0
  400965:	c4 e3 65 18 eb 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm5
  40096b:	c4 e3 6d 18 e2 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm4
  400971:	c4 e3 65 06 db 31    	vperm2f128 $0x31,%ymm3,%ymm3,%ymm3
  400977:	c4 e3 6d 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm2,%ymm2
  40097d:	c5 d5 c6 e4 0c       	vshufpd $0xc,%ymm4,%ymm5,%ymm4
  400982:	c4 e3 75 18 e9 01    	vinsertf128 $0x1,%xmm1,%ymm1,%ymm5
  400988:	c5 e5 c6 d2 0c       	vshufpd $0xc,%ymm2,%ymm3,%ymm2
  40098d:	c4 e3 7d 18 d8 01    	vinsertf128 $0x1,%xmm0,%ymm0,%ymm3
  400993:	c4 e3 75 06 c9 31    	vperm2f128 $0x31,%ymm1,%ymm1,%ymm1
  400999:	c4 e3 7d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm0,%ymm0
  40099f:	c5 d5 c6 db 0c       	vshufpd $0xc,%ymm3,%ymm5,%ymm3
  4009a4:	c4 e3 5d 18 ec 01    	vinsertf128 $0x1,%xmm4,%ymm4,%ymm5
  4009aa:	c5 f5 c6 c0 0c       	vshufpd $0xc,%ymm0,%ymm1,%ymm0
  4009af:	c4 e3 65 18 cb 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm1
  4009b5:	c4 e3 5d 06 e4 31    	vperm2f128 $0x31,%ymm4,%ymm4,%ymm4
  4009bb:	c4 e3 65 06 db 31    	vperm2f128 $0x31,%ymm3,%ymm3,%ymm3
  4009c1:	c5 d5 c6 c9 0c       	vshufpd $0xc,%ymm1,%ymm5,%ymm1
  4009c6:	c5 f9 11 48 80       	vmovupd %xmm1,-0x80(%rax)
  4009cb:	c4 e3 7d 19 48 90 01 	vextractf128 $0x1,%ymm1,-0x70(%rax)
  4009d2:	c5 dd c6 cb 0c       	vshufpd $0xc,%ymm3,%ymm4,%ymm1
  4009d7:	c4 e3 6d 18 da 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm3
  4009dd:	c4 e3 6d 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm2,%ymm2
  4009e3:	c5 f9 11 48 a0       	vmovupd %xmm1,-0x60(%rax)
  4009e8:	c4 e3 7d 19 48 b0 01 	vextractf128 $0x1,%ymm1,-0x50(%rax)
  4009ef:	c4 e3 7d 18 c8 01    	vinsertf128 $0x1,%xmm0,%ymm0,%ymm1
  4009f5:	c4 e3 7d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm0,%ymm0
  4009fb:	c5 e5 c6 c9 0c       	vshufpd $0xc,%ymm1,%ymm3,%ymm1
  400a00:	c5 ed c6 c0 0c       	vshufpd $0xc,%ymm0,%ymm2,%ymm0
  400a05:	c5 f9 11 48 c0       	vmovupd %xmm1,-0x40(%rax)
  400a0a:	c4 e3 7d 19 48 d0 01 	vextractf128 $0x1,%ymm1,-0x30(%rax)
  400a11:	c5 f9 11 40 e0       	vmovupd %xmm0,-0x20(%rax)
  400a16:	c4 e3 7d 19 40 f0 01 	vextractf128 $0x1,%ymm0,-0x10(%rax)
  400a1d:	49 83 fa 60          	cmp    $0x60,%r10
  400a21:	0f 85 80 fe ff ff    	jne    4008a7 <main+0x387>
  400a27:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a2c:	c5 fb 10 b9 80 01 00 	vmovsd 0x180(%rcx),%xmm7
  400a33:	00 
  400a34:	c5 fb 10 b1 a8 01 00 	vmovsd 0x1a8(%rcx),%xmm6
  400a3b:	00 
  400a3c:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400a42:	c5 fb 11 81 80 01 00 	vmovsd %xmm0,0x180(%rcx)
  400a49:	00 
  400a4a:	c5 fb 10 b9 88 01 00 	vmovsd 0x188(%rcx),%xmm7
  400a51:	00 
  400a52:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a57:	c4 e2 c1 99 06       	vfmadd132sd (%rsi),%xmm7,%xmm0
  400a5c:	c5 fb 11 81 88 01 00 	vmovsd %xmm0,0x188(%rcx)
  400a63:	00 
  400a64:	c5 fb 10 b9 90 01 00 	vmovsd 0x190(%rcx),%xmm7
  400a6b:	00 
  400a6c:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a71:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400a76:	c5 fb 11 81 90 01 00 	vmovsd %xmm0,0x190(%rcx)
  400a7d:	00 
  400a7e:	c5 fb 10 b9 98 01 00 	vmovsd 0x198(%rcx),%xmm7
  400a85:	00 
  400a86:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a8b:	c4 e2 c1 99 02       	vfmadd132sd (%rdx),%xmm7,%xmm0
  400a90:	c5 fb 11 81 98 01 00 	vmovsd %xmm0,0x198(%rcx)
  400a97:	00 
  400a98:	c5 fb 10 b9 a0 01 00 	vmovsd 0x1a0(%rcx),%xmm7
  400a9f:	00 
  400aa0:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400aa5:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400aab:	c5 fb 11 81 a0 01 00 	vmovsd %xmm0,0x1a0(%rcx)
  400ab2:	00 
  400ab3:	c5 fb 10 b9 b0 01 00 	vmovsd 0x1b0(%rcx),%xmm7
  400aba:	00 
  400abb:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400ac0:	c4 e2 c9 99 06       	vfmadd132sd (%rsi),%xmm6,%xmm0
  400ac5:	c5 fb 11 81 a8 01 00 	vmovsd %xmm0,0x1a8(%rcx)
  400acc:	00 
  400acd:	c5 fb 10 b1 b8 01 00 	vmovsd 0x1b8(%rcx),%xmm6
  400ad4:	00 
  400ad5:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400ada:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400adf:	c5 fb 11 81 b0 01 00 	vmovsd %xmm0,0x1b0(%rcx)
  400ae6:	00 
  400ae7:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400aec:	c4 e2 c9 99 02       	vfmadd132sd (%rdx),%xmm6,%xmm0
  400af1:	c5 fb 11 81 b8 01 00 	vmovsd %xmm0,0x1b8(%rcx)
  400af8:	00 
  400af9:	48 83 c7 70          	add    $0x70,%rdi
  400afd:	49 83 c3 70          	add    $0x70,%r11
  400b01:	48 83 c6 20          	add    $0x20,%rsi
  400b05:	49 83 c0 20          	add    $0x20,%r8
  400b09:	48 83 c2 20          	add    $0x20,%rdx
  400b0d:	4c 39 f7             	cmp    %r14,%rdi
  400b10:	0f 85 1a fd ff ff    	jne    400830 <main+0x310>
  400b16:	0f 31                	rdtsc  
  400b18:	48 89 d3             	mov    %rdx,%rbx
  400b1b:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
  400b20:	48 8b 0c 24          	mov    (%rsp),%rcx
  400b24:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
  400b28:	48 c1 e3 20          	shl    $0x20,%rbx
  400b2c:	89 c0                	mov    %eax,%eax
  400b2e:	48 09 c3             	or     %rax,%rbx
  400b31:	be 04 00 00 00       	mov    $0x4,%esi
  400b36:	bf 0e 00 00 00       	mov    $0xe,%edi
  400b3b:	c5 f8 77             	vzeroupper 
  400b3e:	e8 cd 06 00 00       	callq  401210 <kernel>
  400b43:	0f 31                	rdtsc  
  400b45:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  400b4a:	49 89 d2             	mov    %rdx,%r10
  400b4d:	89 c0                	mov    %eax,%eax
  400b4f:	49 c1 e2 20          	shl    $0x20,%r10
  400b53:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
  400b5a:	00 
  400b5b:	49 09 c2             	or     %rax,%r10
  400b5e:	48 89 f8             	mov    %rdi,%rax
  400b61:	48 c1 e0 3c          	shl    $0x3c,%rax
  400b65:	48 c1 e8 3f          	shr    $0x3f,%rax
  400b69:	85 c0                	test   %eax,%eax
  400b6b:	0f 84 8f 02 00 00    	je     400e00 <main+0x8e0>
  400b71:	c5 fb 10 07          	vmovsd (%rdi),%xmm0
  400b75:	45 31 f6             	xor    %r14d,%r14d
  400b78:	41 b8 37 00 00 00    	mov    $0x37,%r8d
  400b7e:	c5 fb 10 3d ea 08 00 	vmovsd 0x8ea(%rip),%xmm7        # 401470 <__dso_handle+0x28>
  400b85:	00 
  400b86:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  400b8c:	c4 c1 7b 5c 01       	vsubsd (%r9),%xmm0,%xmm0
  400b91:	c5 f9 54 05 e7 08 00 	vandpd 0x8e7(%rip),%xmm0,%xmm0        # 401480 <__dso_handle+0x38>
  400b98:	00 
  400b99:	c5 f9 2e f8          	vucomisd %xmm0,%xmm7
  400b9d:	41 0f 97 c6          	seta   %r14b
  400ba1:	41 bb 38 00 00 00    	mov    $0x38,%r11d
  400ba7:	c5 f9 76 c0          	vpcmpeqd %xmm0,%xmm0,%xmm0
  400bab:	41 29 c3             	sub    %eax,%r11d
  400bae:	89 c0                	mov    %eax,%eax
  400bb0:	31 c9                	xor    %ecx,%ecx
  400bb2:	44 89 de             	mov    %r11d,%esi
  400bb5:	48 c1 e0 03          	shl    $0x3,%rax
  400bb9:	c1 ee 02             	shr    $0x2,%esi
  400bbc:	49 8d 14 01          	lea    (%r9,%rax,1),%rdx
  400bc0:	48 01 f8             	add    %rdi,%rax
  400bc3:	44 8d 24 b5 00 00 00 	lea    0x0(,%rsi,4),%r12d
  400bca:	00 
  400bcb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400bd0:	c5 f9 10 0a          	vmovupd (%rdx),%xmm1
  400bd4:	83 c1 01             	add    $0x1,%ecx
  400bd7:	48 83 c2 20          	add    $0x20,%rdx
  400bdb:	48 83 c0 20          	add    $0x20,%rax
  400bdf:	c5 f9 28 50 e0       	vmovapd -0x20(%rax),%xmm2
  400be4:	c5 f9 28 58 f0       	vmovapd -0x10(%rax),%xmm3
  400be9:	c5 e9 5c d1          	vsubpd %xmm1,%xmm2,%xmm2
  400bed:	c5 f9 10 4a f0       	vmovupd -0x10(%rdx),%xmm1
  400bf2:	39 ce                	cmp    %ecx,%esi
  400bf4:	c5 e1 5c c9          	vsubpd %xmm1,%xmm3,%xmm1
  400bf8:	c5 e9 54 15 90 08 00 	vandpd 0x890(%rip),%xmm2,%xmm2        # 401490 <__dso_handle+0x48>
  400bff:	00 
  400c00:	c5 f1 54 0d 88 08 00 	vandpd 0x888(%rip),%xmm1,%xmm1        # 401490 <__dso_handle+0x48>
  400c07:	00 
  400c08:	c5 e9 c2 15 8f 08 00 	vcmpltpd 0x88f(%rip),%xmm2,%xmm2        # 4014a0 <__dso_handle+0x58>
  400c0f:	00 01 
  400c11:	c5 f1 c2 0d 86 08 00 	vcmpltpd 0x886(%rip),%xmm1,%xmm1        # 4014a0 <__dso_handle+0x58>
  400c18:	00 01 
  400c1a:	c5 e9 db 15 8e 08 00 	vpand  0x88e(%rip),%xmm2,%xmm2        # 4014b0 <__dso_handle+0x68>
  400c21:	00 
  400c22:	c5 f1 db 0d 86 08 00 	vpand  0x886(%rip),%xmm1,%xmm1        # 4014b0 <__dso_handle+0x68>
  400c29:	00 
  400c2a:	c5 e8 c6 c9 88       	vshufps $0x88,%xmm1,%xmm2,%xmm1
  400c2f:	c5 f9 db c1          	vpand  %xmm1,%xmm0,%xmm0
  400c33:	77 9b                	ja     400bd0 <main+0x6b0>
  400c35:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
  400c3a:	c5 f1 db c0          	vpand  %xmm0,%xmm1,%xmm0
  400c3e:	45 01 e5             	add    %r12d,%r13d
  400c41:	45 29 e0             	sub    %r12d,%r8d
  400c44:	c5 f1 73 d8 04       	vpsrldq $0x4,%xmm0,%xmm1
  400c49:	c5 f1 db c0          	vpand  %xmm0,%xmm1,%xmm0
  400c4d:	c4 e3 79 16 c0 00    	vpextrd $0x0,%xmm0,%eax
  400c53:	44 21 f0             	and    %r14d,%eax
  400c56:	45 39 dc             	cmp    %r11d,%r12d
  400c59:	74 7f                	je     400cda <main+0x7ba>
  400c5b:	49 63 d5             	movslq %r13d,%rdx
  400c5e:	c5 fb 10 0d 0a 08 00 	vmovsd 0x80a(%rip),%xmm1        # 401470 <__dso_handle+0x28>
  400c65:	00 
  400c66:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400c6b:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400c71:	31 d2                	xor    %edx,%edx
  400c73:	c5 f9 54 05 05 08 00 	vandpd 0x805(%rip),%xmm0,%xmm0        # 401480 <__dso_handle+0x38>
  400c7a:	00 
  400c7b:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400c7f:	0f 97 c2             	seta   %dl
  400c82:	21 d0                	and    %edx,%eax
  400c84:	41 83 f8 01          	cmp    $0x1,%r8d
  400c88:	41 8d 55 01          	lea    0x1(%r13),%edx
  400c8c:	74 4c                	je     400cda <main+0x7ba>
  400c8e:	48 63 d2             	movslq %edx,%rdx
  400c91:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400c96:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400c9c:	31 d2                	xor    %edx,%edx
  400c9e:	c5 f9 54 05 da 07 00 	vandpd 0x7da(%rip),%xmm0,%xmm0        # 401480 <__dso_handle+0x38>
  400ca5:	00 
  400ca6:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400caa:	0f 97 c2             	seta   %dl
  400cad:	21 d0                	and    %edx,%eax
  400caf:	41 83 f8 02          	cmp    $0x2,%r8d
  400cb3:	41 8d 55 02          	lea    0x2(%r13),%edx
  400cb7:	74 21                	je     400cda <main+0x7ba>
  400cb9:	48 63 d2             	movslq %edx,%rdx
  400cbc:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400cc1:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400cc7:	31 d2                	xor    %edx,%edx
  400cc9:	c5 f9 54 05 af 07 00 	vandpd 0x7af(%rip),%xmm0,%xmm0        # 401480 <__dso_handle+0x38>
  400cd0:	00 
  400cd1:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400cd5:	0f 97 c2             	seta   %dl
  400cd8:	21 d0                	and    %edx,%eax
  400cda:	49 29 da             	sub    %rbx,%r10
  400cdd:	c5 f3 2a 4c 24 1c    	vcvtsi2sdl 0x1c(%rsp),%xmm1,%xmm1
  400ce3:	c5 f3 59 0d 8d 07 00 	vmulsd 0x78d(%rip),%xmm1,%xmm1        # 401478 <__dso_handle+0x30>
  400cea:	00 
  400ceb:	0f 88 60 01 00 00    	js     400e51 <main+0x931>
  400cf1:	c4 c1 fb 2a c2       	vcvtsi2sd %r10,%xmm0,%xmm0
  400cf6:	c5 f3 5e c0          	vdivsd %xmm0,%xmm1,%xmm0
  400cfa:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
  400cfe:	41 89 c0             	mov    %eax,%r8d
  400d01:	ba 04 00 00 00       	mov    $0x4,%edx
  400d06:	be 0e 00 00 00       	mov    $0xe,%esi
  400d0b:	bf 50 14 40 00       	mov    $0x401450,%edi
  400d10:	b8 01 00 00 00       	mov    $0x1,%eax
  400d15:	49 81 c7 00 0e 00 00 	add    $0xe00,%r15
  400d1c:	e8 af f7 ff ff       	callq  4004d0 <printf@plt>
  400d21:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  400d26:	e8 95 f7 ff ff       	callq  4004c0 <free@plt>
  400d2b:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
  400d30:	e8 8b f7 ff ff       	callq  4004c0 <free@plt>
  400d35:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  400d3a:	e8 81 f7 ff ff       	callq  4004c0 <free@plt>
  400d3f:	48 8b bc 24 80 00 00 	mov    0x80(%rsp),%rdi
  400d46:	00 
  400d47:	e8 74 f7 ff ff       	callq  4004c0 <free@plt>
  400d4c:	83 44 24 1c 20       	addl   $0x20,0x1c(%rsp)
  400d51:	48 81 44 24 10 00 04 	addq   $0x400,0x10(%rsp)
  400d58:	00 00 
  400d5a:	81 7c 24 1c 20 02 00 	cmpl   $0x220,0x1c(%rsp)
  400d61:	00 
  400d62:	0f 85 e8 f7 ff ff    	jne    400550 <main+0x30>
  400d68:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  400d6c:	31 c0                	xor    %eax,%eax
  400d6e:	5b                   	pop    %rbx
  400d6f:	41 5c                	pop    %r12
  400d71:	41 5d                	pop    %r13
  400d73:	41 5e                	pop    %r14
  400d75:	41 5f                	pop    %r15
  400d77:	5d                   	pop    %rbp
  400d78:	c3                   	retq   
  400d79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400d80:	48 89 c8             	mov    %rcx,%rax
  400d83:	49 89 fa             	mov    %rdi,%r10
  400d86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400d8d:	00 00 00 
  400d90:	c4 c1 7b 10 02       	vmovsd (%r10),%xmm0
  400d95:	49 83 c2 08          	add    $0x8,%r10
  400d99:	48 83 c0 20          	add    $0x20,%rax
  400d9d:	c5 fb 10 78 e0       	vmovsd -0x20(%rax),%xmm7
  400da2:	c5 fb 10 70 e8       	vmovsd -0x18(%rax),%xmm6
  400da7:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400dad:	c5 fb 11 40 e0       	vmovsd %xmm0,-0x20(%rax)
  400db2:	c5 fb 10 78 f0       	vmovsd -0x10(%rax),%xmm7
  400db7:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400dbd:	c4 e2 c9 99 06       	vfmadd132sd (%rsi),%xmm6,%xmm0
  400dc2:	c5 fb 11 40 e8       	vmovsd %xmm0,-0x18(%rax)
  400dc7:	c5 fb 10 70 f8       	vmovsd -0x8(%rax),%xmm6
  400dcc:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400dd2:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400dd7:	c5 fb 11 40 f0       	vmovsd %xmm0,-0x10(%rax)
  400ddc:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400de2:	c4 e2 c9 99 02       	vfmadd132sd (%rdx),%xmm6,%xmm0
  400de7:	c5 fb 11 40 f8       	vmovsd %xmm0,-0x8(%rax)
  400dec:	4d 39 da             	cmp    %r11,%r10
  400def:	75 9f                	jne    400d90 <main+0x870>
  400df1:	e9 03 fd ff ff       	jmpq   400af9 <main+0x5d9>
  400df6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400dfd:	00 00 00 
  400e00:	41 b8 38 00 00 00    	mov    $0x38,%r8d
  400e06:	45 31 ed             	xor    %r13d,%r13d
  400e09:	41 be 01 00 00 00    	mov    $0x1,%r14d
  400e0f:	e9 8d fd ff ff       	jmpq   400ba1 <main+0x681>
  400e14:	0f 1f 40 00          	nopl   0x0(%rax)
  400e18:	49 8d 41 20          	lea    0x20(%r9),%rax
  400e1c:	48 39 c1             	cmp    %rax,%rcx
  400e1f:	0f 83 fd f7 ff ff    	jae    400622 <main+0x102>
  400e25:	31 c0                	xor    %eax,%eax
  400e27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e2e:	00 00 
  400e30:	49 c7 04 01 00 00 00 	movq   $0x0,(%r9,%rax,1)
  400e37:	00 
  400e38:	48 c7 04 01 00 00 00 	movq   $0x0,(%rcx,%rax,1)
  400e3f:	00 
  400e40:	48 83 c0 08          	add    $0x8,%rax
  400e44:	48 3d c0 01 00 00    	cmp    $0x1c0,%rax
  400e4a:	75 e4                	jne    400e30 <main+0x910>
  400e4c:	e9 a9 f9 ff ff       	jmpq   4007fa <main+0x2da>
  400e51:	4c 89 d2             	mov    %r10,%rdx
  400e54:	41 83 e2 01          	and    $0x1,%r10d
  400e58:	48 d1 ea             	shr    %rdx
  400e5b:	4c 09 d2             	or     %r10,%rdx
  400e5e:	c4 e1 fb 2a c2       	vcvtsi2sd %rdx,%xmm0,%xmm0
  400e63:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
  400e67:	e9 8a fe ff ff       	jmpq   400cf6 <main+0x7d6>

0000000000400e6c <_start>:
  400e6c:	31 ed                	xor    %ebp,%ebp
  400e6e:	49 89 d1             	mov    %rdx,%r9
  400e71:	5e                   	pop    %rsi
  400e72:	48 89 e2             	mov    %rsp,%rdx
  400e75:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400e79:	50                   	push   %rax
  400e7a:	54                   	push   %rsp
  400e7b:	49 c7 c0 30 14 40 00 	mov    $0x401430,%r8
  400e82:	48 c7 c1 c0 13 40 00 	mov    $0x4013c0,%rcx
  400e89:	48 c7 c7 20 05 40 00 	mov    $0x400520,%rdi
  400e90:	e8 4b f6 ff ff       	callq  4004e0 <__libc_start_main@plt>
  400e95:	f4                   	hlt    
  400e96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e9d:	00 00 00 

0000000000400ea0 <deregister_tm_clones>:
  400ea0:	b8 57 20 60 00       	mov    $0x602057,%eax
  400ea5:	55                   	push   %rbp
  400ea6:	48 2d 50 20 60 00    	sub    $0x602050,%rax
  400eac:	48 83 f8 0e          	cmp    $0xe,%rax
  400eb0:	48 89 e5             	mov    %rsp,%rbp
  400eb3:	77 02                	ja     400eb7 <deregister_tm_clones+0x17>
  400eb5:	5d                   	pop    %rbp
  400eb6:	c3                   	retq   
  400eb7:	b8 00 00 00 00       	mov    $0x0,%eax
  400ebc:	48 85 c0             	test   %rax,%rax
  400ebf:	74 f4                	je     400eb5 <deregister_tm_clones+0x15>
  400ec1:	5d                   	pop    %rbp
  400ec2:	bf 50 20 60 00       	mov    $0x602050,%edi
  400ec7:	ff e0                	jmpq   *%rax
  400ec9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400ed0 <register_tm_clones>:
  400ed0:	b8 50 20 60 00       	mov    $0x602050,%eax
  400ed5:	55                   	push   %rbp
  400ed6:	48 2d 50 20 60 00    	sub    $0x602050,%rax
  400edc:	48 c1 f8 03          	sar    $0x3,%rax
  400ee0:	48 89 e5             	mov    %rsp,%rbp
  400ee3:	48 89 c2             	mov    %rax,%rdx
  400ee6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400eea:	48 01 d0             	add    %rdx,%rax
  400eed:	48 d1 f8             	sar    %rax
  400ef0:	75 02                	jne    400ef4 <register_tm_clones+0x24>
  400ef2:	5d                   	pop    %rbp
  400ef3:	c3                   	retq   
  400ef4:	ba 00 00 00 00       	mov    $0x0,%edx
  400ef9:	48 85 d2             	test   %rdx,%rdx
  400efc:	74 f4                	je     400ef2 <register_tm_clones+0x22>
  400efe:	5d                   	pop    %rbp
  400eff:	48 89 c6             	mov    %rax,%rsi
  400f02:	bf 50 20 60 00       	mov    $0x602050,%edi
  400f07:	ff e2                	jmpq   *%rdx
  400f09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f10 <__do_global_dtors_aux>:
  400f10:	80 3d 35 11 20 00 00 	cmpb   $0x0,0x201135(%rip)        # 60204c <_edata>
  400f17:	75 11                	jne    400f2a <__do_global_dtors_aux+0x1a>
  400f19:	55                   	push   %rbp
  400f1a:	48 89 e5             	mov    %rsp,%rbp
  400f1d:	e8 7e ff ff ff       	callq  400ea0 <deregister_tm_clones>
  400f22:	5d                   	pop    %rbp
  400f23:	c6 05 22 11 20 00 01 	movb   $0x1,0x201122(%rip)        # 60204c <_edata>
  400f2a:	f3 c3                	repz retq 
  400f2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f30 <frame_dummy>:
  400f30:	48 83 3d e8 0e 20 00 	cmpq   $0x0,0x200ee8(%rip)        # 601e20 <__JCR_END__>
  400f37:	00 
  400f38:	74 1e                	je     400f58 <frame_dummy+0x28>
  400f3a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3f:	48 85 c0             	test   %rax,%rax
  400f42:	74 14                	je     400f58 <frame_dummy+0x28>
  400f44:	55                   	push   %rbp
  400f45:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  400f4a:	48 89 e5             	mov    %rsp,%rbp
  400f4d:	ff d0                	callq  *%rax
  400f4f:	5d                   	pop    %rbp
  400f50:	e9 7b ff ff ff       	jmpq   400ed0 <register_tm_clones>
  400f55:	0f 1f 00             	nopl   (%rax)
  400f58:	e9 73 ff ff ff       	jmpq   400ed0 <register_tm_clones>
  400f5d:	0f 1f 00             	nopl   (%rax)

0000000000400f60 <naive>:
  400f60:	55                   	push   %rbp
  400f61:	48 89 e5             	mov    %rsp,%rbp
  400f64:	41 57                	push   %r15
  400f66:	41 56                	push   %r14
  400f68:	41 55                	push   %r13
  400f6a:	41 54                	push   %r12
  400f6c:	53                   	push   %rbx
  400f6d:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400f71:	48 83 c4 08          	add    $0x8,%rsp
  400f75:	85 d2                	test   %edx,%edx
  400f77:	89 7c 24 f4          	mov    %edi,-0xc(%rsp)
  400f7b:	89 54 24 b4          	mov    %edx,-0x4c(%rsp)
  400f7f:	48 89 4c 24 a8       	mov    %rcx,-0x58(%rsp)
  400f84:	0f 84 67 02 00 00    	je     4011f1 <naive+0x291>
  400f8a:	48 63 c6             	movslq %esi,%rax
  400f8d:	41 89 f6             	mov    %esi,%r14d
  400f90:	4d 89 c5             	mov    %r8,%r13
  400f93:	48 c1 e0 03          	shl    $0x3,%rax
  400f97:	4d 89 cc             	mov    %r9,%r12
  400f9a:	c7 44 24 b8 00 00 00 	movl   $0x0,-0x48(%rsp)
  400fa1:	00 
  400fa2:	48 89 44 24 e0       	mov    %rax,-0x20(%rsp)
  400fa7:	45 31 ff             	xor    %r15d,%r15d
  400faa:	c7 44 24 bc 00 00 00 	movl   $0x0,-0x44(%rsp)
  400fb1:	00 
  400fb2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400fb8:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  400fbc:	85 c0                	test   %eax,%eax
  400fbe:	0f 84 0c 02 00 00    	je     4011d0 <naive+0x270>
  400fc4:	48 63 54 24 b8       	movslq -0x48(%rsp),%rdx
  400fc9:	48 8b 7c 24 a8       	mov    -0x58(%rsp),%rdi
  400fce:	4c 89 e0             	mov    %r12,%rax
  400fd1:	48 8d 3c d7          	lea    (%rdi,%rdx,8),%rdi
  400fd5:	49 63 d7             	movslq %r15d,%rdx
  400fd8:	49 8d 74 d5 00       	lea    0x0(%r13,%rdx,8),%rsi
  400fdd:	41 8d 57 01          	lea    0x1(%r15),%edx
  400fe1:	48 89 7c 24 d8       	mov    %rdi,-0x28(%rsp)
  400fe6:	48 63 d2             	movslq %edx,%rdx
  400fe9:	48 89 74 24 e8       	mov    %rsi,-0x18(%rsp)
  400fee:	49 8d 7c d5 00       	lea    0x0(%r13,%rdx,8),%rdi
  400ff3:	41 8d 57 02          	lea    0x2(%r15),%edx
  400ff7:	48 63 d2             	movslq %edx,%rdx
  400ffa:	48 89 7c 24 c8       	mov    %rdi,-0x38(%rsp)
  400fff:	49 8d 74 d5 00       	lea    0x0(%r13,%rdx,8),%rsi
  401004:	41 8d 57 03          	lea    0x3(%r15),%edx
  401008:	48 63 d2             	movslq %edx,%rdx
  40100b:	48 89 74 24 c0       	mov    %rsi,-0x40(%rsp)
  401010:	31 f6                	xor    %esi,%esi
  401012:	49 8d 7c d5 00       	lea    0x0(%r13,%rdx,8),%rdi
  401017:	48 89 7c 24 d0       	mov    %rdi,-0x30(%rsp)
  40101c:	31 ff                	xor    %edi,%edi
  40101e:	e9 64 01 00 00       	jmpq   401187 <naive+0x227>
  401023:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401028:	48 8b 5c 24 e8       	mov    -0x18(%rsp),%rbx
  40102d:	83 fa 01             	cmp    $0x1,%edx
  401030:	b9 01 00 00 00       	mov    $0x1,%ecx
  401035:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  401039:	c4 e2 f9 a9 08       	vfmadd213sd (%rax),%xmm0,%xmm1
  40103e:	c5 fb 11 08          	vmovsd %xmm1,(%rax)
  401042:	74 4c                	je     401090 <naive+0x130>
  401044:	48 8b 5c 24 c8       	mov    -0x38(%rsp),%rbx
  401049:	83 fa 02             	cmp    $0x2,%edx
  40104c:	b1 02                	mov    $0x2,%cl
  40104e:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  401052:	c4 e2 f9 a9 48 08    	vfmadd213sd 0x8(%rax),%xmm0,%xmm1
  401058:	c5 fb 11 48 08       	vmovsd %xmm1,0x8(%rax)
  40105d:	74 31                	je     401090 <naive+0x130>
  40105f:	48 8b 5c 24 c0       	mov    -0x40(%rsp),%rbx
  401064:	83 fa 04             	cmp    $0x4,%edx
  401067:	b1 03                	mov    $0x3,%cl
  401069:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  40106d:	c4 e2 f9 a9 48 10    	vfmadd213sd 0x10(%rax),%xmm0,%xmm1
  401073:	c5 fb 11 48 10       	vmovsd %xmm1,0x10(%rax)
  401078:	75 16                	jne    401090 <naive+0x130>
  40107a:	48 8b 5c 24 d0       	mov    -0x30(%rsp),%rbx
  40107f:	b1 04                	mov    $0x4,%cl
  401081:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  401085:	c4 e2 f9 a9 48 18    	vfmadd213sd 0x18(%rax),%xmm0,%xmm1
  40108b:	c5 fb 11 48 18       	vmovsd %xmm1,0x18(%rax)
  401090:	44 39 f2             	cmp    %r14d,%edx
  401093:	0f 84 dc 00 00 00    	je     401175 <naive+0x215>
  401099:	44 89 f3             	mov    %r14d,%ebx
  40109c:	41 89 d1             	mov    %edx,%r9d
  40109f:	29 d3                	sub    %edx,%ebx
  4010a1:	41 89 db             	mov    %ebx,%r11d
  4010a4:	89 5c 24 f0          	mov    %ebx,-0x10(%rsp)
  4010a8:	41 c1 eb 02          	shr    $0x2,%r11d
  4010ac:	42 8d 1c 9d 00 00 00 	lea    0x0(,%r11,4),%ebx
  4010b3:	00 
  4010b4:	85 db                	test   %ebx,%ebx
  4010b6:	74 4b                	je     401103 <naive+0x1a3>
  4010b8:	c5 fb 12 d0          	vmovddup %xmm0,%xmm2
  4010bc:	49 c1 e1 03          	shl    $0x3,%r9
  4010c0:	31 d2                	xor    %edx,%edx
  4010c2:	4e 8d 14 08          	lea    (%rax,%r9,1),%r10
  4010c6:	4c 03 4c 24 e8       	add    -0x18(%rsp),%r9
  4010cb:	45 31 c0             	xor    %r8d,%r8d
  4010ce:	c4 e3 6d 18 d2 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm2
  4010d4:	c4 c1 79 10 0c 11    	vmovupd (%r9,%rdx,1),%xmm1
  4010da:	41 83 c0 01          	add    $0x1,%r8d
  4010de:	c4 c3 75 18 4c 11 10 	vinsertf128 $0x1,0x10(%r9,%rdx,1),%ymm1,%ymm1
  4010e5:	01 
  4010e6:	c4 c2 ed a8 0c 12    	vfmadd213pd (%r10,%rdx,1),%ymm2,%ymm1
  4010ec:	c4 c1 7d 29 0c 12    	vmovapd %ymm1,(%r10,%rdx,1)
  4010f2:	48 83 c2 20          	add    $0x20,%rdx
  4010f6:	45 39 d8             	cmp    %r11d,%r8d
  4010f9:	72 d9                	jb     4010d4 <naive+0x174>
  4010fb:	01 d9                	add    %ebx,%ecx
  4010fd:	39 5c 24 f0          	cmp    %ebx,-0x10(%rsp)
  401101:	74 72                	je     401175 <naive+0x215>
  401103:	8d 14 0f             	lea    (%rdi,%rcx,1),%edx
  401106:	45 8d 04 0f          	lea    (%r15,%rcx,1),%r8d
  40110a:	48 63 d2             	movslq %edx,%rdx
  40110d:	4d 63 c0             	movslq %r8d,%r8
  401110:	49 8d 14 d4          	lea    (%r12,%rdx,8),%rdx
  401114:	c4 81 7b 10 4c c5 00 	vmovsd 0x0(%r13,%r8,8),%xmm1
  40111b:	c4 e2 f9 a9 0a       	vfmadd213sd (%rdx),%xmm0,%xmm1
  401120:	c5 fb 11 0a          	vmovsd %xmm1,(%rdx)
  401124:	8d 51 01             	lea    0x1(%rcx),%edx
  401127:	41 39 d6             	cmp    %edx,%r14d
  40112a:	74 49                	je     401175 <naive+0x215>
  40112c:	44 8d 04 3a          	lea    (%rdx,%rdi,1),%r8d
  401130:	44 01 fa             	add    %r15d,%edx
  401133:	83 c1 02             	add    $0x2,%ecx
  401136:	48 63 d2             	movslq %edx,%rdx
  401139:	41 39 ce             	cmp    %ecx,%r14d
  40113c:	4d 63 c0             	movslq %r8d,%r8
  40113f:	c4 c1 7b 10 4c d5 00 	vmovsd 0x0(%r13,%rdx,8),%xmm1
  401146:	4f 8d 04 c4          	lea    (%r12,%r8,8),%r8
  40114a:	c4 c2 f9 a9 08       	vfmadd213sd (%r8),%xmm0,%xmm1
  40114f:	c4 c1 7b 11 08       	vmovsd %xmm1,(%r8)
  401154:	74 1f                	je     401175 <naive+0x215>
  401156:	8d 14 0f             	lea    (%rdi,%rcx,1),%edx
  401159:	44 01 f9             	add    %r15d,%ecx
  40115c:	48 63 c9             	movslq %ecx,%rcx
  40115f:	48 63 d2             	movslq %edx,%rdx
  401162:	49 8d 14 d4          	lea    (%r12,%rdx,8),%rdx
  401166:	c5 fb 10 1a          	vmovsd (%rdx),%xmm3
  40116a:	c4 c2 e1 99 44 cd 00 	vfmadd132sd 0x0(%r13,%rcx,8),%xmm3,%xmm0
  401171:	c5 fb 11 02          	vmovsd %xmm0,(%rdx)
  401175:	48 83 c6 01          	add    $0x1,%rsi
  401179:	48 03 44 24 e0       	add    -0x20(%rsp),%rax
  40117e:	44 01 f7             	add    %r14d,%edi
  401181:	39 74 24 f4          	cmp    %esi,-0xc(%rsp)
  401185:	74 49                	je     4011d0 <naive+0x270>
  401187:	45 85 f6             	test   %r14d,%r14d
  40118a:	74 e9                	je     401175 <naive+0x215>
  40118c:	48 89 c1             	mov    %rax,%rcx
  40118f:	48 8b 5c 24 d8       	mov    -0x28(%rsp),%rbx
  401194:	44 89 f2             	mov    %r14d,%edx
  401197:	83 e1 1f             	and    $0x1f,%ecx
  40119a:	48 c1 e9 03          	shr    $0x3,%rcx
  40119e:	48 f7 d9             	neg    %rcx
  4011a1:	c5 fb 10 04 f3       	vmovsd (%rbx,%rsi,8),%xmm0
  4011a6:	83 e1 03             	and    $0x3,%ecx
  4011a9:	44 39 f1             	cmp    %r14d,%ecx
  4011ac:	41 0f 47 ce          	cmova  %r14d,%ecx
  4011b0:	41 83 fe 04          	cmp    $0x4,%r14d
  4011b4:	0f 86 6e fe ff ff    	jbe    401028 <naive+0xc8>
  4011ba:	85 c9                	test   %ecx,%ecx
  4011bc:	75 42                	jne    401200 <naive+0x2a0>
  4011be:	31 d2                	xor    %edx,%edx
  4011c0:	31 c9                	xor    %ecx,%ecx
  4011c2:	e9 d2 fe ff ff       	jmpq   401099 <naive+0x139>
  4011c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4011ce:	00 00 
  4011d0:	83 44 24 bc 01       	addl   $0x1,-0x44(%rsp)
  4011d5:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4011d9:	45 01 f7             	add    %r14d,%r15d
  4011dc:	01 44 24 b8          	add    %eax,-0x48(%rsp)
  4011e0:	8b 44 24 b4          	mov    -0x4c(%rsp),%eax
  4011e4:	39 44 24 bc          	cmp    %eax,-0x44(%rsp)
  4011e8:	0f 85 ca fd ff ff    	jne    400fb8 <naive+0x58>
  4011ee:	c5 f8 77             	vzeroupper 
  4011f1:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  4011f5:	5b                   	pop    %rbx
  4011f6:	41 5c                	pop    %r12
  4011f8:	41 5d                	pop    %r13
  4011fa:	41 5e                	pop    %r14
  4011fc:	41 5f                	pop    %r15
  4011fe:	5d                   	pop    %rbp
  4011ff:	c3                   	retq   
  401200:	89 ca                	mov    %ecx,%edx
  401202:	e9 21 fe ff ff       	jmpq   401028 <naive+0xc8>
  401207:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40120e:	00 00 

0000000000401210 <kernel>:
  401210:	85 d2                	test   %edx,%edx
  401212:	c4 41 7d 28 31       	vmovapd (%r9),%ymm14
  401217:	c4 41 7d 28 69 20    	vmovapd 0x20(%r9),%ymm13
  40121d:	c4 41 7d 28 61 40    	vmovapd 0x40(%r9),%ymm12
  401223:	c4 41 7d 28 59 60    	vmovapd 0x60(%r9),%ymm11
  401229:	c4 41 7d 28 91 80 00 	vmovapd 0x80(%r9),%ymm10
  401230:	00 00 
  401232:	c4 41 7d 28 89 a0 00 	vmovapd 0xa0(%r9),%ymm9
  401239:	00 00 
  40123b:	c4 41 7d 28 81 c0 00 	vmovapd 0xc0(%r9),%ymm8
  401242:	00 00 
  401244:	c4 c1 7d 28 b9 e0 00 	vmovapd 0xe0(%r9),%ymm7
  40124b:	00 00 
  40124d:	c4 c1 7d 28 b1 00 01 	vmovapd 0x100(%r9),%ymm6
  401254:	00 00 
  401256:	c4 c1 7d 28 a9 20 01 	vmovapd 0x120(%r9),%ymm5
  40125d:	00 00 
  40125f:	c4 c1 7d 28 a1 40 01 	vmovapd 0x140(%r9),%ymm4
  401266:	00 00 
  401268:	c4 c1 7d 28 99 60 01 	vmovapd 0x160(%r9),%ymm3
  40126f:	00 00 
  401271:	c4 c1 7d 28 91 80 01 	vmovapd 0x180(%r9),%ymm2
  401278:	00 00 
  40127a:	c4 c1 7d 28 89 a0 01 	vmovapd 0x1a0(%r9),%ymm1
  401281:	00 00 
  401283:	0f 84 bf 00 00 00    	je     401348 <kernel+0x138>
  401289:	8d 42 ff             	lea    -0x1(%rdx),%eax
  40128c:	48 c1 e0 05          	shl    $0x5,%rax
  401290:	49 8d 44 00 20       	lea    0x20(%r8,%rax,1),%rax
  401295:	0f 1f 00             	nopl   (%rax)
  401298:	c4 c1 7d 28 00       	vmovapd (%r8),%ymm0
  40129d:	49 83 c0 20          	add    $0x20,%r8
  4012a1:	48 83 c1 70          	add    $0x70,%rcx
  4012a5:	c4 62 7d 19 79 90    	vbroadcastsd -0x70(%rcx),%ymm15
  4012ab:	c4 62 85 b8 f0       	vfmadd231pd %ymm0,%ymm15,%ymm14
  4012b0:	c4 62 7d 19 79 98    	vbroadcastsd -0x68(%rcx),%ymm15
  4012b6:	c4 62 85 b8 e8       	vfmadd231pd %ymm0,%ymm15,%ymm13
  4012bb:	c4 62 7d 19 79 a0    	vbroadcastsd -0x60(%rcx),%ymm15
  4012c1:	c4 62 85 b8 e0       	vfmadd231pd %ymm0,%ymm15,%ymm12
  4012c6:	c4 62 7d 19 79 a8    	vbroadcastsd -0x58(%rcx),%ymm15
  4012cc:	c4 62 85 b8 d8       	vfmadd231pd %ymm0,%ymm15,%ymm11
  4012d1:	c4 62 7d 19 79 b0    	vbroadcastsd -0x50(%rcx),%ymm15
  4012d7:	c4 62 85 b8 d0       	vfmadd231pd %ymm0,%ymm15,%ymm10
  4012dc:	c4 62 7d 19 79 b8    	vbroadcastsd -0x48(%rcx),%ymm15
  4012e2:	c4 62 85 b8 c8       	vfmadd231pd %ymm0,%ymm15,%ymm9
  4012e7:	c4 62 7d 19 79 c0    	vbroadcastsd -0x40(%rcx),%ymm15
  4012ed:	c4 62 85 b8 c0       	vfmadd231pd %ymm0,%ymm15,%ymm8
  4012f2:	c4 62 7d 19 79 c8    	vbroadcastsd -0x38(%rcx),%ymm15
  4012f8:	c4 e2 85 b8 f8       	vfmadd231pd %ymm0,%ymm15,%ymm7
  4012fd:	c4 62 7d 19 79 d0    	vbroadcastsd -0x30(%rcx),%ymm15
  401303:	c4 e2 85 b8 f0       	vfmadd231pd %ymm0,%ymm15,%ymm6
  401308:	c4 62 7d 19 79 d8    	vbroadcastsd -0x28(%rcx),%ymm15
  40130e:	c4 e2 85 b8 e8       	vfmadd231pd %ymm0,%ymm15,%ymm5
  401313:	c4 62 7d 19 79 e0    	vbroadcastsd -0x20(%rcx),%ymm15
  401319:	c4 e2 85 b8 e0       	vfmadd231pd %ymm0,%ymm15,%ymm4
  40131e:	c4 62 7d 19 79 e8    	vbroadcastsd -0x18(%rcx),%ymm15
  401324:	c4 e2 85 b8 d8       	vfmadd231pd %ymm0,%ymm15,%ymm3
  401329:	c4 62 7d 19 79 f0    	vbroadcastsd -0x10(%rcx),%ymm15
  40132f:	c4 e2 85 b8 d0       	vfmadd231pd %ymm0,%ymm15,%ymm2
  401334:	c4 62 7d 19 79 f8    	vbroadcastsd -0x8(%rcx),%ymm15
  40133a:	49 39 c0             	cmp    %rax,%r8
  40133d:	c4 e2 85 b8 c8       	vfmadd231pd %ymm0,%ymm15,%ymm1
  401342:	0f 85 50 ff ff ff    	jne    401298 <kernel+0x88>
  401348:	c4 41 7d 29 31       	vmovapd %ymm14,(%r9)
  40134d:	c4 41 7d 29 69 20    	vmovapd %ymm13,0x20(%r9)
  401353:	c4 41 7d 29 61 40    	vmovapd %ymm12,0x40(%r9)
  401359:	c4 41 7d 29 59 60    	vmovapd %ymm11,0x60(%r9)
  40135f:	c4 41 7d 29 91 80 00 	vmovapd %ymm10,0x80(%r9)
  401366:	00 00 
  401368:	c4 41 7d 29 89 a0 00 	vmovapd %ymm9,0xa0(%r9)
  40136f:	00 00 
  401371:	c4 41 7d 29 81 c0 00 	vmovapd %ymm8,0xc0(%r9)
  401378:	00 00 
  40137a:	c4 c1 7d 29 b9 e0 00 	vmovapd %ymm7,0xe0(%r9)
  401381:	00 00 
  401383:	c4 c1 7d 29 b1 00 01 	vmovapd %ymm6,0x100(%r9)
  40138a:	00 00 
  40138c:	c4 c1 7d 29 a9 20 01 	vmovapd %ymm5,0x120(%r9)
  401393:	00 00 
  401395:	c4 c1 7d 29 a1 40 01 	vmovapd %ymm4,0x140(%r9)
  40139c:	00 00 
  40139e:	c4 c1 7d 29 99 60 01 	vmovapd %ymm3,0x160(%r9)
  4013a5:	00 00 
  4013a7:	c4 c1 7d 29 91 80 01 	vmovapd %ymm2,0x180(%r9)
  4013ae:	00 00 
  4013b0:	c4 c1 7d 29 89 a0 01 	vmovapd %ymm1,0x1a0(%r9)
  4013b7:	00 00 
  4013b9:	c5 f8 77             	vzeroupper 
  4013bc:	c3                   	retq   
  4013bd:	0f 1f 00             	nopl   (%rax)

00000000004013c0 <__libc_csu_init>:
  4013c0:	41 57                	push   %r15
  4013c2:	41 89 ff             	mov    %edi,%r15d
  4013c5:	41 56                	push   %r14
  4013c7:	49 89 f6             	mov    %rsi,%r14
  4013ca:	41 55                	push   %r13
  4013cc:	49 89 d5             	mov    %rdx,%r13
  4013cf:	41 54                	push   %r12
  4013d1:	4c 8d 25 38 0a 20 00 	lea    0x200a38(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  4013d8:	55                   	push   %rbp
  4013d9:	48 8d 2d 38 0a 20 00 	lea    0x200a38(%rip),%rbp        # 601e18 <__init_array_end>
  4013e0:	53                   	push   %rbx
  4013e1:	4c 29 e5             	sub    %r12,%rbp
  4013e4:	31 db                	xor    %ebx,%ebx
  4013e6:	48 c1 fd 03          	sar    $0x3,%rbp
  4013ea:	48 83 ec 08          	sub    $0x8,%rsp
  4013ee:	e8 9d f0 ff ff       	callq  400490 <_init>
  4013f3:	48 85 ed             	test   %rbp,%rbp
  4013f6:	74 1e                	je     401416 <__libc_csu_init+0x56>
  4013f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4013ff:	00 
  401400:	4c 89 ea             	mov    %r13,%rdx
  401403:	4c 89 f6             	mov    %r14,%rsi
  401406:	44 89 ff             	mov    %r15d,%edi
  401409:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40140d:	48 83 c3 01          	add    $0x1,%rbx
  401411:	48 39 eb             	cmp    %rbp,%rbx
  401414:	75 ea                	jne    401400 <__libc_csu_init+0x40>
  401416:	48 83 c4 08          	add    $0x8,%rsp
  40141a:	5b                   	pop    %rbx
  40141b:	5d                   	pop    %rbp
  40141c:	41 5c                	pop    %r12
  40141e:	41 5d                	pop    %r13
  401420:	41 5e                	pop    %r14
  401422:	41 5f                	pop    %r15
  401424:	c3                   	retq   
  401425:	90                   	nop
  401426:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40142d:	00 00 00 

0000000000401430 <__libc_csu_fini>:
  401430:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401434 <_fini>:
  401434:	48 83 ec 08          	sub    $0x8,%rsp
  401438:	48 83 c4 08          	add    $0x8,%rsp
  40143c:	c3                   	retq   
