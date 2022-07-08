
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
  400526:	41 bf 00 0f 00 00    	mov    $0xf00,%r15d
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
  40057d:	ba e0 01 00 00       	mov    $0x1e0,%edx
  400582:	be 40 00 00 00       	mov    $0x40,%esi
  400587:	e8 74 ff ff ff       	callq  400500 <posix_memalign@plt>
  40058c:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  400593:	00 
  400594:	ba e0 01 00 00       	mov    $0x1e0,%edx
  400599:	be 40 00 00 00       	mov    $0x40,%esi
  40059e:	e8 5d ff ff ff       	callq  400500 <posix_memalign@plt>
  4005a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4005a8:	49 89 dc             	mov    %rbx,%r12
  4005ab:	4c 03 64 24 20       	add    0x20(%rsp),%r12
  4005b0:	48 83 c3 08          	add    $0x8,%rbx
  4005b4:	e8 57 ff ff ff       	callq  400510 <rand@plt>
  4005b9:	c5 fb 2a c0          	vcvtsi2sd %eax,%xmm0,%xmm0
  4005bd:	4c 39 fb             	cmp    %r15,%rbx
  4005c0:	c5 fb 5e 05 70 0f 00 	vdivsd 0xf70(%rip),%xmm0,%xmm0        # 401538 <__dso_handle+0x20>
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
  4005f8:	c5 fb 5e 05 38 0f 00 	vdivsd 0xf38(%rip),%xmm0,%xmm0        # 401538 <__dso_handle+0x20>
  4005ff:	00 
  400600:	c4 c1 7b 11 04 24    	vmovsd %xmm0,(%r12)
  400606:	75 d8                	jne    4005e0 <main+0xc0>
  400608:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
  40060f:	00 
  400610:	4c 8b 4c 24 60       	mov    0x60(%rsp),%r9
  400615:	48 8d 41 20          	lea    0x20(%rcx),%rax
  400619:	49 39 c1             	cmp    %rax,%r9
  40061c:	0f 82 86 08 00 00    	jb     400ea8 <main+0x988>
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
  4007fa:	c4 c1 79 11 81 c0 01 	vmovupd %xmm0,0x1c0(%r9)
  400801:	00 00 
  400803:	c4 c3 7d 19 81 d0 01 	vextractf128 $0x1,%ymm0,0x1d0(%r9)
  40080a:	00 00 01 
  40080d:	c5 f9 11 81 c0 01 00 	vmovupd %xmm0,0x1c0(%rcx)
  400814:	00 
  400815:	c4 e3 7d 19 81 d0 01 	vextractf128 $0x1,%ymm0,0x1d0(%rcx)
  40081c:	00 00 01 
  40081f:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  400824:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  400829:	4c 8d 5b 78          	lea    0x78(%rbx),%r11
  40082d:	48 89 1c 24          	mov    %rbx,(%rsp)
  400831:	48 89 df             	mov    %rbx,%rdi
  400834:	48 8d 70 08          	lea    0x8(%rax),%rsi
  400838:	4c 8d 40 10          	lea    0x10(%rax),%r8
  40083c:	48 8d 50 18          	lea    0x18(%rax),%rdx
  400840:	4f 8d 74 1f 88       	lea    -0x78(%r15,%r11,1),%r14
  400845:	48 8d 99 e0 01 00 00 	lea    0x1e0(%rcx),%rbx
  40084c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  400851:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400858:	48 39 f3             	cmp    %rsi,%rbx
  40085b:	0f 96 c0             	setbe  %al
  40085e:	4c 39 c1             	cmp    %r8,%rcx
  400861:	41 0f 93 c2          	setae  %r10b
  400865:	44 09 d0             	or     %r10d,%eax
  400868:	4c 39 c3             	cmp    %r8,%rbx
  40086b:	41 0f 96 c2          	setbe  %r10b
  40086f:	48 39 ca             	cmp    %rcx,%rdx
  400872:	41 0f 96 c4          	setbe  %r12b
  400876:	45 09 e2             	or     %r12d,%r10d
  400879:	44 21 d0             	and    %r10d,%eax
  40087c:	48 39 fb             	cmp    %rdi,%rbx
  40087f:	41 0f 96 c2          	setbe  %r10b
  400883:	4c 39 d9             	cmp    %r11,%rcx
  400886:	41 0f 93 c4          	setae  %r12b
  40088a:	45 09 e2             	or     %r12d,%r10d
  40088d:	44 21 d0             	and    %r10d,%eax
  400890:	4c 8d 56 18          	lea    0x18(%rsi),%r10
  400894:	4c 39 d1             	cmp    %r10,%rcx
  400897:	41 0f 93 c2          	setae  %r10b
  40089b:	48 39 d3             	cmp    %rdx,%rbx
  40089e:	41 0f 96 c4          	setbe  %r12b
  4008a2:	45 09 e2             	or     %r12d,%r10d
  4008a5:	44 84 d0             	test   %r10b,%al
  4008a8:	0f 84 62 05 00 00    	je     400e10 <main+0x8f0>
  4008ae:	48 8d 46 f8          	lea    -0x8(%rsi),%rax
  4008b2:	48 39 c3             	cmp    %rax,%rbx
  4008b5:	48 89 c8             	mov    %rcx,%rax
  4008b8:	41 0f 96 c5          	setbe  %r13b
  4008bc:	48 39 f1             	cmp    %rsi,%rcx
  4008bf:	41 0f 93 c4          	setae  %r12b
  4008c3:	45 31 d2             	xor    %r10d,%r10d
  4008c6:	45 08 e5             	or     %r12b,%r13b
  4008c9:	0f 84 41 05 00 00    	je     400e10 <main+0x8f0>
  4008cf:	c5 f9 10 18          	vmovupd (%rax),%xmm3
  4008d3:	48 83 e8 80          	sub    $0xffffffffffffff80,%rax
  4008d7:	c5 f9 10 48 a0       	vmovupd -0x60(%rax),%xmm1
  4008dc:	c4 e3 65 18 58 90 01 	vinsertf128 $0x1,-0x70(%rax),%ymm3,%ymm3
  4008e3:	c5 f9 10 50 c0       	vmovupd -0x40(%rax),%xmm2
  4008e8:	c4 e3 75 18 48 b0 01 	vinsertf128 $0x1,-0x50(%rax),%ymm1,%ymm1
  4008ef:	c5 f9 10 40 e0       	vmovupd -0x20(%rax),%xmm0
  4008f4:	c4 e3 6d 18 50 d0 01 	vinsertf128 $0x1,-0x30(%rax),%ymm2,%ymm2
  4008fb:	c4 e3 7d 18 40 f0 01 	vinsertf128 $0x1,-0x10(%rax),%ymm0,%ymm0
  400902:	c4 e3 65 18 e1 01    	vinsertf128 $0x1,%xmm1,%ymm3,%ymm4
  400908:	c4 e3 65 06 c9 31    	vperm2f128 $0x31,%ymm1,%ymm3,%ymm1
  40090e:	c5 dd 14 d9          	vunpcklpd %ymm1,%ymm4,%ymm3
  400912:	c5 dd 15 c9          	vunpckhpd %ymm1,%ymm4,%ymm1
  400916:	c4 e3 6d 18 e0 01    	vinsertf128 $0x1,%xmm0,%ymm2,%ymm4
  40091c:	c4 e3 6d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm2,%ymm0
  400922:	c5 dd 14 d0          	vunpcklpd %ymm0,%ymm4,%ymm2
  400926:	c5 dd 15 c0          	vunpckhpd %ymm0,%ymm4,%ymm0
  40092a:	c4 a1 79 10 24 17    	vmovupd (%rdi,%r10,1),%xmm4
  400930:	c4 e3 65 18 f2 01    	vinsertf128 $0x1,%xmm2,%ymm3,%ymm6
  400936:	c4 e3 65 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm3,%ymm2
  40093c:	c4 a3 5d 18 64 17 10 	vinsertf128 $0x1,0x10(%rdi,%r10,1),%ymm4,%ymm4
  400943:	01 
  400944:	49 83 c2 20          	add    $0x20,%r10
  400948:	c5 cd 14 ea          	vunpcklpd %ymm2,%ymm6,%ymm5
  40094c:	c4 e2 7d 19 5e f8    	vbroadcastsd -0x8(%rsi),%ymm3
  400952:	c5 cd 15 f2          	vunpckhpd %ymm2,%ymm6,%ymm6
  400956:	c4 e2 d5 98 dc       	vfmadd132pd %ymm4,%ymm5,%ymm3
  40095b:	c4 e3 75 18 e8 01    	vinsertf128 $0x1,%xmm0,%ymm1,%ymm5
  400961:	c4 e3 75 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm1,%ymm0
  400967:	c4 c2 7d 19 10       	vbroadcastsd (%r8),%ymm2
  40096c:	c4 e2 7d 19 0e       	vbroadcastsd (%rsi),%ymm1
  400971:	c5 d5 14 f8          	vunpcklpd %ymm0,%ymm5,%ymm7
  400975:	c4 e2 cd 98 d4       	vfmadd132pd %ymm4,%ymm6,%ymm2
  40097a:	c5 d5 15 e8          	vunpckhpd %ymm0,%ymm5,%ymm5
  40097e:	c4 e2 7d 19 02       	vbroadcastsd (%rdx),%ymm0
  400983:	c4 e2 c5 98 cc       	vfmadd132pd %ymm4,%ymm7,%ymm1
  400988:	c4 e2 d5 98 c4       	vfmadd132pd %ymm4,%ymm5,%ymm0
  40098d:	c4 e3 65 18 eb 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm5
  400993:	c4 e3 6d 18 e2 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm4
  400999:	c4 e3 65 06 db 31    	vperm2f128 $0x31,%ymm3,%ymm3,%ymm3
  40099f:	c4 e3 6d 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm2,%ymm2
  4009a5:	c5 d5 c6 e4 0c       	vshufpd $0xc,%ymm4,%ymm5,%ymm4
  4009aa:	c4 e3 75 18 e9 01    	vinsertf128 $0x1,%xmm1,%ymm1,%ymm5
  4009b0:	c5 e5 c6 d2 0c       	vshufpd $0xc,%ymm2,%ymm3,%ymm2
  4009b5:	c4 e3 7d 18 d8 01    	vinsertf128 $0x1,%xmm0,%ymm0,%ymm3
  4009bb:	c4 e3 75 06 c9 31    	vperm2f128 $0x31,%ymm1,%ymm1,%ymm1
  4009c1:	c4 e3 7d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm0,%ymm0
  4009c7:	c5 d5 c6 db 0c       	vshufpd $0xc,%ymm3,%ymm5,%ymm3
  4009cc:	c4 e3 5d 18 ec 01    	vinsertf128 $0x1,%xmm4,%ymm4,%ymm5
  4009d2:	c5 f5 c6 c0 0c       	vshufpd $0xc,%ymm0,%ymm1,%ymm0
  4009d7:	c4 e3 65 18 cb 01    	vinsertf128 $0x1,%xmm3,%ymm3,%ymm1
  4009dd:	c4 e3 5d 06 e4 31    	vperm2f128 $0x31,%ymm4,%ymm4,%ymm4
  4009e3:	c4 e3 65 06 db 31    	vperm2f128 $0x31,%ymm3,%ymm3,%ymm3
  4009e9:	c5 d5 c6 c9 0c       	vshufpd $0xc,%ymm1,%ymm5,%ymm1
  4009ee:	c5 f9 11 48 80       	vmovupd %xmm1,-0x80(%rax)
  4009f3:	c4 e3 7d 19 48 90 01 	vextractf128 $0x1,%ymm1,-0x70(%rax)
  4009fa:	c5 dd c6 cb 0c       	vshufpd $0xc,%ymm3,%ymm4,%ymm1
  4009ff:	c4 e3 6d 18 da 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm3
  400a05:	c4 e3 6d 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm2,%ymm2
  400a0b:	c5 f9 11 48 a0       	vmovupd %xmm1,-0x60(%rax)
  400a10:	c4 e3 7d 19 48 b0 01 	vextractf128 $0x1,%ymm1,-0x50(%rax)
  400a17:	c4 e3 7d 18 c8 01    	vinsertf128 $0x1,%xmm0,%ymm0,%ymm1
  400a1d:	c4 e3 7d 06 c0 31    	vperm2f128 $0x31,%ymm0,%ymm0,%ymm0
  400a23:	c5 e5 c6 c9 0c       	vshufpd $0xc,%ymm1,%ymm3,%ymm1
  400a28:	c5 ed c6 c0 0c       	vshufpd $0xc,%ymm0,%ymm2,%ymm0
  400a2d:	c5 f9 11 48 c0       	vmovupd %xmm1,-0x40(%rax)
  400a32:	c4 e3 7d 19 48 d0 01 	vextractf128 $0x1,%ymm1,-0x30(%rax)
  400a39:	c5 f9 11 40 e0       	vmovupd %xmm0,-0x20(%rax)
  400a3e:	c4 e3 7d 19 40 f0 01 	vextractf128 $0x1,%ymm0,-0x10(%rax)
  400a45:	49 83 fa 60          	cmp    $0x60,%r10
  400a49:	0f 85 80 fe ff ff    	jne    4008cf <main+0x3af>
  400a4f:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a54:	c5 fb 10 b9 80 01 00 	vmovsd 0x180(%rcx),%xmm7
  400a5b:	00 
  400a5c:	c5 fb 10 b1 a8 01 00 	vmovsd 0x1a8(%rcx),%xmm6
  400a63:	00 
  400a64:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400a6a:	c5 fb 11 81 80 01 00 	vmovsd %xmm0,0x180(%rcx)
  400a71:	00 
  400a72:	c5 fb 10 b9 88 01 00 	vmovsd 0x188(%rcx),%xmm7
  400a79:	00 
  400a7a:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a7f:	c4 e2 c1 99 06       	vfmadd132sd (%rsi),%xmm7,%xmm0
  400a84:	c5 fb 11 81 88 01 00 	vmovsd %xmm0,0x188(%rcx)
  400a8b:	00 
  400a8c:	c5 fb 10 b9 90 01 00 	vmovsd 0x190(%rcx),%xmm7
  400a93:	00 
  400a94:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400a99:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400a9e:	c5 fb 11 81 90 01 00 	vmovsd %xmm0,0x190(%rcx)
  400aa5:	00 
  400aa6:	c5 fb 10 b9 98 01 00 	vmovsd 0x198(%rcx),%xmm7
  400aad:	00 
  400aae:	c5 fb 10 47 60       	vmovsd 0x60(%rdi),%xmm0
  400ab3:	c4 e2 c1 99 02       	vfmadd132sd (%rdx),%xmm7,%xmm0
  400ab8:	c5 fb 11 81 98 01 00 	vmovsd %xmm0,0x198(%rcx)
  400abf:	00 
  400ac0:	c5 fb 10 b9 a0 01 00 	vmovsd 0x1a0(%rcx),%xmm7
  400ac7:	00 
  400ac8:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400acd:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400ad3:	c5 fb 11 81 a0 01 00 	vmovsd %xmm0,0x1a0(%rcx)
  400ada:	00 
  400adb:	c5 fb 10 b9 b0 01 00 	vmovsd 0x1b0(%rcx),%xmm7
  400ae2:	00 
  400ae3:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400ae8:	c4 e2 c9 99 06       	vfmadd132sd (%rsi),%xmm6,%xmm0
  400aed:	c5 fb 11 81 a8 01 00 	vmovsd %xmm0,0x1a8(%rcx)
  400af4:	00 
  400af5:	c5 fb 10 b1 b8 01 00 	vmovsd 0x1b8(%rcx),%xmm6
  400afc:	00 
  400afd:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400b02:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400b07:	c5 fb 11 81 b0 01 00 	vmovsd %xmm0,0x1b0(%rcx)
  400b0e:	00 
  400b0f:	c5 fb 10 b9 c0 01 00 	vmovsd 0x1c0(%rcx),%xmm7
  400b16:	00 
  400b17:	c5 fb 10 47 68       	vmovsd 0x68(%rdi),%xmm0
  400b1c:	c4 e2 c9 99 02       	vfmadd132sd (%rdx),%xmm6,%xmm0
  400b21:	c5 fb 11 81 b8 01 00 	vmovsd %xmm0,0x1b8(%rcx)
  400b28:	00 
  400b29:	c5 fb 10 47 70       	vmovsd 0x70(%rdi),%xmm0
  400b2e:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400b34:	c5 fb 11 81 c0 01 00 	vmovsd %xmm0,0x1c0(%rcx)
  400b3b:	00 
  400b3c:	c5 fb 10 47 70       	vmovsd 0x70(%rdi),%xmm0
  400b41:	c5 fb 10 b1 c8 01 00 	vmovsd 0x1c8(%rcx),%xmm6
  400b48:	00 
  400b49:	c5 fb 10 b9 d0 01 00 	vmovsd 0x1d0(%rcx),%xmm7
  400b50:	00 
  400b51:	c4 e2 c9 99 06       	vfmadd132sd (%rsi),%xmm6,%xmm0
  400b56:	c5 fb 11 81 c8 01 00 	vmovsd %xmm0,0x1c8(%rcx)
  400b5d:	00 
  400b5e:	c5 fb 10 a9 d8 01 00 	vmovsd 0x1d8(%rcx),%xmm5
  400b65:	00 
  400b66:	c5 fb 10 47 70       	vmovsd 0x70(%rdi),%xmm0
  400b6b:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400b70:	c5 fb 11 81 d0 01 00 	vmovsd %xmm0,0x1d0(%rcx)
  400b77:	00 
  400b78:	c5 fb 10 47 70       	vmovsd 0x70(%rdi),%xmm0
  400b7d:	c4 e2 d1 99 02       	vfmadd132sd (%rdx),%xmm5,%xmm0
  400b82:	c5 fb 11 81 d8 01 00 	vmovsd %xmm0,0x1d8(%rcx)
  400b89:	00 
  400b8a:	48 83 c7 78          	add    $0x78,%rdi
  400b8e:	49 83 c3 78          	add    $0x78,%r11
  400b92:	48 83 c6 20          	add    $0x20,%rsi
  400b96:	49 83 c0 20          	add    $0x20,%r8
  400b9a:	48 83 c2 20          	add    $0x20,%rdx
  400b9e:	4c 39 f7             	cmp    %r14,%rdi
  400ba1:	0f 85 b1 fc ff ff    	jne    400858 <main+0x338>
  400ba7:	0f 31                	rdtsc  
  400ba9:	48 89 d3             	mov    %rdx,%rbx
  400bac:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
  400bb1:	48 8b 0c 24          	mov    (%rsp),%rcx
  400bb5:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
  400bb9:	48 c1 e3 20          	shl    $0x20,%rbx
  400bbd:	89 c0                	mov    %eax,%eax
  400bbf:	48 09 c3             	or     %rax,%rbx
  400bc2:	be 04 00 00 00       	mov    $0x4,%esi
  400bc7:	bf 0f 00 00 00       	mov    $0xf,%edi
  400bcc:	c5 f8 77             	vzeroupper 
  400bcf:	e8 cc 06 00 00       	callq  4012a0 <kernel>
  400bd4:	0f 31                	rdtsc  
  400bd6:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  400bdb:	49 89 d2             	mov    %rdx,%r10
  400bde:	89 c0                	mov    %eax,%eax
  400be0:	49 c1 e2 20          	shl    $0x20,%r10
  400be4:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
  400beb:	00 
  400bec:	49 09 c2             	or     %rax,%r10
  400bef:	48 89 f8             	mov    %rdi,%rax
  400bf2:	48 c1 e0 3c          	shl    $0x3c,%rax
  400bf6:	48 c1 e8 3f          	shr    $0x3f,%rax
  400bfa:	85 c0                	test   %eax,%eax
  400bfc:	0f 84 8e 02 00 00    	je     400e90 <main+0x970>
  400c02:	c5 fb 10 07          	vmovsd (%rdi),%xmm0
  400c06:	45 31 f6             	xor    %r14d,%r14d
  400c09:	41 b8 3b 00 00 00    	mov    $0x3b,%r8d
  400c0f:	c5 fb 10 35 29 09 00 	vmovsd 0x929(%rip),%xmm6        # 401540 <__dso_handle+0x28>
  400c16:	00 
  400c17:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  400c1d:	c4 c1 7b 5c 01       	vsubsd (%r9),%xmm0,%xmm0
  400c22:	c5 f9 54 05 26 09 00 	vandpd 0x926(%rip),%xmm0,%xmm0        # 401550 <__dso_handle+0x38>
  400c29:	00 
  400c2a:	c5 f9 2e f0          	vucomisd %xmm0,%xmm6
  400c2e:	41 0f 97 c6          	seta   %r14b
  400c32:	41 bb 3c 00 00 00    	mov    $0x3c,%r11d
  400c38:	c5 f9 76 c0          	vpcmpeqd %xmm0,%xmm0,%xmm0
  400c3c:	41 29 c3             	sub    %eax,%r11d
  400c3f:	89 c0                	mov    %eax,%eax
  400c41:	31 c9                	xor    %ecx,%ecx
  400c43:	44 89 de             	mov    %r11d,%esi
  400c46:	48 c1 e0 03          	shl    $0x3,%rax
  400c4a:	c1 ee 02             	shr    $0x2,%esi
  400c4d:	49 8d 14 01          	lea    (%r9,%rax,1),%rdx
  400c51:	48 01 f8             	add    %rdi,%rax
  400c54:	44 8d 24 b5 00 00 00 	lea    0x0(,%rsi,4),%r12d
  400c5b:	00 
  400c5c:	0f 1f 40 00          	nopl   0x0(%rax)
  400c60:	c5 f9 10 0a          	vmovupd (%rdx),%xmm1
  400c64:	83 c1 01             	add    $0x1,%ecx
  400c67:	48 83 c2 20          	add    $0x20,%rdx
  400c6b:	48 83 c0 20          	add    $0x20,%rax
  400c6f:	c5 f9 28 50 e0       	vmovapd -0x20(%rax),%xmm2
  400c74:	c5 f9 28 58 f0       	vmovapd -0x10(%rax),%xmm3
  400c79:	c5 e9 5c d1          	vsubpd %xmm1,%xmm2,%xmm2
  400c7d:	c5 f9 10 4a f0       	vmovupd -0x10(%rdx),%xmm1
  400c82:	39 ce                	cmp    %ecx,%esi
  400c84:	c5 e1 5c c9          	vsubpd %xmm1,%xmm3,%xmm1
  400c88:	c5 e9 54 15 d0 08 00 	vandpd 0x8d0(%rip),%xmm2,%xmm2        # 401560 <__dso_handle+0x48>
  400c8f:	00 
  400c90:	c5 f1 54 0d c8 08 00 	vandpd 0x8c8(%rip),%xmm1,%xmm1        # 401560 <__dso_handle+0x48>
  400c97:	00 
  400c98:	c5 e9 c2 15 cf 08 00 	vcmpltpd 0x8cf(%rip),%xmm2,%xmm2        # 401570 <__dso_handle+0x58>
  400c9f:	00 01 
  400ca1:	c5 f1 c2 0d c6 08 00 	vcmpltpd 0x8c6(%rip),%xmm1,%xmm1        # 401570 <__dso_handle+0x58>
  400ca8:	00 01 
  400caa:	c5 e9 db 15 ce 08 00 	vpand  0x8ce(%rip),%xmm2,%xmm2        # 401580 <__dso_handle+0x68>
  400cb1:	00 
  400cb2:	c5 f1 db 0d c6 08 00 	vpand  0x8c6(%rip),%xmm1,%xmm1        # 401580 <__dso_handle+0x68>
  400cb9:	00 
  400cba:	c5 e8 c6 c9 88       	vshufps $0x88,%xmm1,%xmm2,%xmm1
  400cbf:	c5 f9 db c1          	vpand  %xmm1,%xmm0,%xmm0
  400cc3:	77 9b                	ja     400c60 <main+0x740>
  400cc5:	c5 f1 73 d8 08       	vpsrldq $0x8,%xmm0,%xmm1
  400cca:	c5 f1 db c0          	vpand  %xmm0,%xmm1,%xmm0
  400cce:	45 01 e5             	add    %r12d,%r13d
  400cd1:	45 29 e0             	sub    %r12d,%r8d
  400cd4:	c5 f1 73 d8 04       	vpsrldq $0x4,%xmm0,%xmm1
  400cd9:	c5 f1 db c0          	vpand  %xmm0,%xmm1,%xmm0
  400cdd:	c4 e3 79 16 c0 00    	vpextrd $0x0,%xmm0,%eax
  400ce3:	44 21 f0             	and    %r14d,%eax
  400ce6:	45 39 dc             	cmp    %r11d,%r12d
  400ce9:	74 7f                	je     400d6a <main+0x84a>
  400ceb:	49 63 d5             	movslq %r13d,%rdx
  400cee:	c5 fb 10 0d 4a 08 00 	vmovsd 0x84a(%rip),%xmm1        # 401540 <__dso_handle+0x28>
  400cf5:	00 
  400cf6:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400cfb:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400d01:	31 d2                	xor    %edx,%edx
  400d03:	c5 f9 54 05 45 08 00 	vandpd 0x845(%rip),%xmm0,%xmm0        # 401550 <__dso_handle+0x38>
  400d0a:	00 
  400d0b:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400d0f:	0f 97 c2             	seta   %dl
  400d12:	21 d0                	and    %edx,%eax
  400d14:	41 83 f8 01          	cmp    $0x1,%r8d
  400d18:	41 8d 55 01          	lea    0x1(%r13),%edx
  400d1c:	74 4c                	je     400d6a <main+0x84a>
  400d1e:	48 63 d2             	movslq %edx,%rdx
  400d21:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400d26:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400d2c:	31 d2                	xor    %edx,%edx
  400d2e:	c5 f9 54 05 1a 08 00 	vandpd 0x81a(%rip),%xmm0,%xmm0        # 401550 <__dso_handle+0x38>
  400d35:	00 
  400d36:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400d3a:	0f 97 c2             	seta   %dl
  400d3d:	21 d0                	and    %edx,%eax
  400d3f:	41 83 f8 02          	cmp    $0x2,%r8d
  400d43:	41 8d 55 02          	lea    0x2(%r13),%edx
  400d47:	74 21                	je     400d6a <main+0x84a>
  400d49:	48 63 d2             	movslq %edx,%rdx
  400d4c:	c5 fb 10 04 d7       	vmovsd (%rdi,%rdx,8),%xmm0
  400d51:	c4 c1 7b 5c 04 d1    	vsubsd (%r9,%rdx,8),%xmm0,%xmm0
  400d57:	31 d2                	xor    %edx,%edx
  400d59:	c5 f9 54 05 ef 07 00 	vandpd 0x7ef(%rip),%xmm0,%xmm0        # 401550 <__dso_handle+0x38>
  400d60:	00 
  400d61:	c5 f9 2e c8          	vucomisd %xmm0,%xmm1
  400d65:	0f 97 c2             	seta   %dl
  400d68:	21 d0                	and    %edx,%eax
  400d6a:	49 29 da             	sub    %rbx,%r10
  400d6d:	c5 f3 2a 4c 24 1c    	vcvtsi2sdl 0x1c(%rsp),%xmm1,%xmm1
  400d73:	c5 f3 59 0d cd 07 00 	vmulsd 0x7cd(%rip),%xmm1,%xmm1        # 401548 <__dso_handle+0x30>
  400d7a:	00 
  400d7b:	0f 88 60 01 00 00    	js     400ee1 <main+0x9c1>
  400d81:	c4 c1 fb 2a c2       	vcvtsi2sd %r10,%xmm0,%xmm0
  400d86:	c5 f3 5e c0          	vdivsd %xmm0,%xmm1,%xmm0
  400d8a:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
  400d8e:	41 89 c0             	mov    %eax,%r8d
  400d91:	ba 04 00 00 00       	mov    $0x4,%edx
  400d96:	be 0f 00 00 00       	mov    $0xf,%esi
  400d9b:	bf 20 15 40 00       	mov    $0x401520,%edi
  400da0:	b8 01 00 00 00       	mov    $0x1,%eax
  400da5:	49 81 c7 00 0f 00 00 	add    $0xf00,%r15
  400dac:	e8 1f f7 ff ff       	callq  4004d0 <printf@plt>
  400db1:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  400db6:	e8 05 f7 ff ff       	callq  4004c0 <free@plt>
  400dbb:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
  400dc0:	e8 fb f6 ff ff       	callq  4004c0 <free@plt>
  400dc5:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  400dca:	e8 f1 f6 ff ff       	callq  4004c0 <free@plt>
  400dcf:	48 8b bc 24 80 00 00 	mov    0x80(%rsp),%rdi
  400dd6:	00 
  400dd7:	e8 e4 f6 ff ff       	callq  4004c0 <free@plt>
  400ddc:	83 44 24 1c 20       	addl   $0x20,0x1c(%rsp)
  400de1:	48 81 44 24 10 00 04 	addq   $0x400,0x10(%rsp)
  400de8:	00 00 
  400dea:	81 7c 24 1c 20 02 00 	cmpl   $0x220,0x1c(%rsp)
  400df1:	00 
  400df2:	0f 85 58 f7 ff ff    	jne    400550 <main+0x30>
  400df8:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  400dfc:	31 c0                	xor    %eax,%eax
  400dfe:	5b                   	pop    %rbx
  400dff:	41 5c                	pop    %r12
  400e01:	41 5d                	pop    %r13
  400e03:	41 5e                	pop    %r14
  400e05:	41 5f                	pop    %r15
  400e07:	5d                   	pop    %rbp
  400e08:	c3                   	retq   
  400e09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400e10:	48 89 c8             	mov    %rcx,%rax
  400e13:	49 89 fa             	mov    %rdi,%r10
  400e16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e1d:	00 00 00 
  400e20:	c4 c1 7b 10 02       	vmovsd (%r10),%xmm0
  400e25:	49 83 c2 08          	add    $0x8,%r10
  400e29:	48 83 c0 20          	add    $0x20,%rax
  400e2d:	c5 fb 10 78 e0       	vmovsd -0x20(%rax),%xmm7
  400e32:	c5 fb 10 70 e8       	vmovsd -0x18(%rax),%xmm6
  400e37:	c4 e2 c1 99 46 f8    	vfmadd132sd -0x8(%rsi),%xmm7,%xmm0
  400e3d:	c5 fb 11 40 e0       	vmovsd %xmm0,-0x20(%rax)
  400e42:	c5 fb 10 78 f0       	vmovsd -0x10(%rax),%xmm7
  400e47:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400e4d:	c4 e2 c9 99 06       	vfmadd132sd (%rsi),%xmm6,%xmm0
  400e52:	c5 fb 11 40 e8       	vmovsd %xmm0,-0x18(%rax)
  400e57:	c5 fb 10 70 f8       	vmovsd -0x8(%rax),%xmm6
  400e5c:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400e62:	c4 c2 c1 99 00       	vfmadd132sd (%r8),%xmm7,%xmm0
  400e67:	c5 fb 11 40 f0       	vmovsd %xmm0,-0x10(%rax)
  400e6c:	c4 c1 7b 10 42 f8    	vmovsd -0x8(%r10),%xmm0
  400e72:	c4 e2 c9 99 02       	vfmadd132sd (%rdx),%xmm6,%xmm0
  400e77:	c5 fb 11 40 f8       	vmovsd %xmm0,-0x8(%rax)
  400e7c:	4d 39 da             	cmp    %r11,%r10
  400e7f:	75 9f                	jne    400e20 <main+0x900>
  400e81:	e9 04 fd ff ff       	jmpq   400b8a <main+0x66a>
  400e86:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e8d:	00 00 00 
  400e90:	41 b8 3c 00 00 00    	mov    $0x3c,%r8d
  400e96:	45 31 ed             	xor    %r13d,%r13d
  400e99:	41 be 01 00 00 00    	mov    $0x1,%r14d
  400e9f:	e9 8e fd ff ff       	jmpq   400c32 <main+0x712>
  400ea4:	0f 1f 40 00          	nopl   0x0(%rax)
  400ea8:	49 8d 41 20          	lea    0x20(%r9),%rax
  400eac:	48 39 c1             	cmp    %rax,%rcx
  400eaf:	0f 83 6d f7 ff ff    	jae    400622 <main+0x102>
  400eb5:	31 c0                	xor    %eax,%eax
  400eb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400ebe:	00 00 
  400ec0:	49 c7 04 01 00 00 00 	movq   $0x0,(%r9,%rax,1)
  400ec7:	00 
  400ec8:	48 c7 04 01 00 00 00 	movq   $0x0,(%rcx,%rax,1)
  400ecf:	00 
  400ed0:	48 83 c0 08          	add    $0x8,%rax
  400ed4:	48 3d e0 01 00 00    	cmp    $0x1e0,%rax
  400eda:	75 e4                	jne    400ec0 <main+0x9a0>
  400edc:	e9 3e f9 ff ff       	jmpq   40081f <main+0x2ff>
  400ee1:	4c 89 d2             	mov    %r10,%rdx
  400ee4:	41 83 e2 01          	and    $0x1,%r10d
  400ee8:	48 d1 ea             	shr    %rdx
  400eeb:	4c 09 d2             	or     %r10,%rdx
  400eee:	c4 e1 fb 2a c2       	vcvtsi2sd %rdx,%xmm0,%xmm0
  400ef3:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
  400ef7:	e9 8a fe ff ff       	jmpq   400d86 <main+0x866>

0000000000400efc <_start>:
  400efc:	31 ed                	xor    %ebp,%ebp
  400efe:	49 89 d1             	mov    %rdx,%r9
  400f01:	5e                   	pop    %rsi
  400f02:	48 89 e2             	mov    %rsp,%rdx
  400f05:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400f09:	50                   	push   %rax
  400f0a:	54                   	push   %rsp
  400f0b:	49 c7 c0 00 15 40 00 	mov    $0x401500,%r8
  400f12:	48 c7 c1 90 14 40 00 	mov    $0x401490,%rcx
  400f19:	48 c7 c7 20 05 40 00 	mov    $0x400520,%rdi
  400f20:	e8 bb f5 ff ff       	callq  4004e0 <__libc_start_main@plt>
  400f25:	f4                   	hlt    
  400f26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f2d:	00 00 00 

0000000000400f30 <deregister_tm_clones>:
  400f30:	b8 57 20 60 00       	mov    $0x602057,%eax
  400f35:	55                   	push   %rbp
  400f36:	48 2d 50 20 60 00    	sub    $0x602050,%rax
  400f3c:	48 83 f8 0e          	cmp    $0xe,%rax
  400f40:	48 89 e5             	mov    %rsp,%rbp
  400f43:	77 02                	ja     400f47 <deregister_tm_clones+0x17>
  400f45:	5d                   	pop    %rbp
  400f46:	c3                   	retq   
  400f47:	b8 00 00 00 00       	mov    $0x0,%eax
  400f4c:	48 85 c0             	test   %rax,%rax
  400f4f:	74 f4                	je     400f45 <deregister_tm_clones+0x15>
  400f51:	5d                   	pop    %rbp
  400f52:	bf 50 20 60 00       	mov    $0x602050,%edi
  400f57:	ff e0                	jmpq   *%rax
  400f59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f60 <register_tm_clones>:
  400f60:	b8 50 20 60 00       	mov    $0x602050,%eax
  400f65:	55                   	push   %rbp
  400f66:	48 2d 50 20 60 00    	sub    $0x602050,%rax
  400f6c:	48 c1 f8 03          	sar    $0x3,%rax
  400f70:	48 89 e5             	mov    %rsp,%rbp
  400f73:	48 89 c2             	mov    %rax,%rdx
  400f76:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400f7a:	48 01 d0             	add    %rdx,%rax
  400f7d:	48 d1 f8             	sar    %rax
  400f80:	75 02                	jne    400f84 <register_tm_clones+0x24>
  400f82:	5d                   	pop    %rbp
  400f83:	c3                   	retq   
  400f84:	ba 00 00 00 00       	mov    $0x0,%edx
  400f89:	48 85 d2             	test   %rdx,%rdx
  400f8c:	74 f4                	je     400f82 <register_tm_clones+0x22>
  400f8e:	5d                   	pop    %rbp
  400f8f:	48 89 c6             	mov    %rax,%rsi
  400f92:	bf 50 20 60 00       	mov    $0x602050,%edi
  400f97:	ff e2                	jmpq   *%rdx
  400f99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400fa0 <__do_global_dtors_aux>:
  400fa0:	80 3d a5 10 20 00 00 	cmpb   $0x0,0x2010a5(%rip)        # 60204c <_edata>
  400fa7:	75 11                	jne    400fba <__do_global_dtors_aux+0x1a>
  400fa9:	55                   	push   %rbp
  400faa:	48 89 e5             	mov    %rsp,%rbp
  400fad:	e8 7e ff ff ff       	callq  400f30 <deregister_tm_clones>
  400fb2:	5d                   	pop    %rbp
  400fb3:	c6 05 92 10 20 00 01 	movb   $0x1,0x201092(%rip)        # 60204c <_edata>
  400fba:	f3 c3                	repz retq 
  400fbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400fc0 <frame_dummy>:
  400fc0:	48 83 3d 58 0e 20 00 	cmpq   $0x0,0x200e58(%rip)        # 601e20 <__JCR_END__>
  400fc7:	00 
  400fc8:	74 1e                	je     400fe8 <frame_dummy+0x28>
  400fca:	b8 00 00 00 00       	mov    $0x0,%eax
  400fcf:	48 85 c0             	test   %rax,%rax
  400fd2:	74 14                	je     400fe8 <frame_dummy+0x28>
  400fd4:	55                   	push   %rbp
  400fd5:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  400fda:	48 89 e5             	mov    %rsp,%rbp
  400fdd:	ff d0                	callq  *%rax
  400fdf:	5d                   	pop    %rbp
  400fe0:	e9 7b ff ff ff       	jmpq   400f60 <register_tm_clones>
  400fe5:	0f 1f 00             	nopl   (%rax)
  400fe8:	e9 73 ff ff ff       	jmpq   400f60 <register_tm_clones>
  400fed:	0f 1f 00             	nopl   (%rax)

0000000000400ff0 <naive>:
  400ff0:	55                   	push   %rbp
  400ff1:	48 89 e5             	mov    %rsp,%rbp
  400ff4:	41 57                	push   %r15
  400ff6:	41 56                	push   %r14
  400ff8:	41 55                	push   %r13
  400ffa:	41 54                	push   %r12
  400ffc:	53                   	push   %rbx
  400ffd:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  401001:	48 83 c4 08          	add    $0x8,%rsp
  401005:	85 d2                	test   %edx,%edx
  401007:	89 7c 24 f4          	mov    %edi,-0xc(%rsp)
  40100b:	89 54 24 b4          	mov    %edx,-0x4c(%rsp)
  40100f:	48 89 4c 24 a8       	mov    %rcx,-0x58(%rsp)
  401014:	0f 84 67 02 00 00    	je     401281 <naive+0x291>
  40101a:	48 63 c6             	movslq %esi,%rax
  40101d:	41 89 f6             	mov    %esi,%r14d
  401020:	4d 89 c5             	mov    %r8,%r13
  401023:	48 c1 e0 03          	shl    $0x3,%rax
  401027:	4d 89 cc             	mov    %r9,%r12
  40102a:	c7 44 24 b8 00 00 00 	movl   $0x0,-0x48(%rsp)
  401031:	00 
  401032:	48 89 44 24 e0       	mov    %rax,-0x20(%rsp)
  401037:	45 31 ff             	xor    %r15d,%r15d
  40103a:	c7 44 24 bc 00 00 00 	movl   $0x0,-0x44(%rsp)
  401041:	00 
  401042:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401048:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40104c:	85 c0                	test   %eax,%eax
  40104e:	0f 84 0c 02 00 00    	je     401260 <naive+0x270>
  401054:	48 63 54 24 b8       	movslq -0x48(%rsp),%rdx
  401059:	48 8b 7c 24 a8       	mov    -0x58(%rsp),%rdi
  40105e:	4c 89 e0             	mov    %r12,%rax
  401061:	48 8d 3c d7          	lea    (%rdi,%rdx,8),%rdi
  401065:	49 63 d7             	movslq %r15d,%rdx
  401068:	49 8d 74 d5 00       	lea    0x0(%r13,%rdx,8),%rsi
  40106d:	41 8d 57 01          	lea    0x1(%r15),%edx
  401071:	48 89 7c 24 d8       	mov    %rdi,-0x28(%rsp)
  401076:	48 63 d2             	movslq %edx,%rdx
  401079:	48 89 74 24 e8       	mov    %rsi,-0x18(%rsp)
  40107e:	49 8d 7c d5 00       	lea    0x0(%r13,%rdx,8),%rdi
  401083:	41 8d 57 02          	lea    0x2(%r15),%edx
  401087:	48 63 d2             	movslq %edx,%rdx
  40108a:	48 89 7c 24 c8       	mov    %rdi,-0x38(%rsp)
  40108f:	49 8d 74 d5 00       	lea    0x0(%r13,%rdx,8),%rsi
  401094:	41 8d 57 03          	lea    0x3(%r15),%edx
  401098:	48 63 d2             	movslq %edx,%rdx
  40109b:	48 89 74 24 c0       	mov    %rsi,-0x40(%rsp)
  4010a0:	31 f6                	xor    %esi,%esi
  4010a2:	49 8d 7c d5 00       	lea    0x0(%r13,%rdx,8),%rdi
  4010a7:	48 89 7c 24 d0       	mov    %rdi,-0x30(%rsp)
  4010ac:	31 ff                	xor    %edi,%edi
  4010ae:	e9 64 01 00 00       	jmpq   401217 <naive+0x227>
  4010b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4010b8:	48 8b 5c 24 e8       	mov    -0x18(%rsp),%rbx
  4010bd:	83 fa 01             	cmp    $0x1,%edx
  4010c0:	b9 01 00 00 00       	mov    $0x1,%ecx
  4010c5:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  4010c9:	c4 e2 f9 a9 08       	vfmadd213sd (%rax),%xmm0,%xmm1
  4010ce:	c5 fb 11 08          	vmovsd %xmm1,(%rax)
  4010d2:	74 4c                	je     401120 <naive+0x130>
  4010d4:	48 8b 5c 24 c8       	mov    -0x38(%rsp),%rbx
  4010d9:	83 fa 02             	cmp    $0x2,%edx
  4010dc:	b1 02                	mov    $0x2,%cl
  4010de:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  4010e2:	c4 e2 f9 a9 48 08    	vfmadd213sd 0x8(%rax),%xmm0,%xmm1
  4010e8:	c5 fb 11 48 08       	vmovsd %xmm1,0x8(%rax)
  4010ed:	74 31                	je     401120 <naive+0x130>
  4010ef:	48 8b 5c 24 c0       	mov    -0x40(%rsp),%rbx
  4010f4:	83 fa 04             	cmp    $0x4,%edx
  4010f7:	b1 03                	mov    $0x3,%cl
  4010f9:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  4010fd:	c4 e2 f9 a9 48 10    	vfmadd213sd 0x10(%rax),%xmm0,%xmm1
  401103:	c5 fb 11 48 10       	vmovsd %xmm1,0x10(%rax)
  401108:	75 16                	jne    401120 <naive+0x130>
  40110a:	48 8b 5c 24 d0       	mov    -0x30(%rsp),%rbx
  40110f:	b1 04                	mov    $0x4,%cl
  401111:	c5 fb 10 0b          	vmovsd (%rbx),%xmm1
  401115:	c4 e2 f9 a9 48 18    	vfmadd213sd 0x18(%rax),%xmm0,%xmm1
  40111b:	c5 fb 11 48 18       	vmovsd %xmm1,0x18(%rax)
  401120:	44 39 f2             	cmp    %r14d,%edx
  401123:	0f 84 dc 00 00 00    	je     401205 <naive+0x215>
  401129:	44 89 f3             	mov    %r14d,%ebx
  40112c:	41 89 d1             	mov    %edx,%r9d
  40112f:	29 d3                	sub    %edx,%ebx
  401131:	41 89 db             	mov    %ebx,%r11d
  401134:	89 5c 24 f0          	mov    %ebx,-0x10(%rsp)
  401138:	41 c1 eb 02          	shr    $0x2,%r11d
  40113c:	42 8d 1c 9d 00 00 00 	lea    0x0(,%r11,4),%ebx
  401143:	00 
  401144:	85 db                	test   %ebx,%ebx
  401146:	74 4b                	je     401193 <naive+0x1a3>
  401148:	c5 fb 12 d0          	vmovddup %xmm0,%xmm2
  40114c:	49 c1 e1 03          	shl    $0x3,%r9
  401150:	31 d2                	xor    %edx,%edx
  401152:	4e 8d 14 08          	lea    (%rax,%r9,1),%r10
  401156:	4c 03 4c 24 e8       	add    -0x18(%rsp),%r9
  40115b:	45 31 c0             	xor    %r8d,%r8d
  40115e:	c4 e3 6d 18 d2 01    	vinsertf128 $0x1,%xmm2,%ymm2,%ymm2
  401164:	c4 c1 79 10 0c 11    	vmovupd (%r9,%rdx,1),%xmm1
  40116a:	41 83 c0 01          	add    $0x1,%r8d
  40116e:	c4 c3 75 18 4c 11 10 	vinsertf128 $0x1,0x10(%r9,%rdx,1),%ymm1,%ymm1
  401175:	01 
  401176:	c4 c2 ed a8 0c 12    	vfmadd213pd (%r10,%rdx,1),%ymm2,%ymm1
  40117c:	c4 c1 7d 29 0c 12    	vmovapd %ymm1,(%r10,%rdx,1)
  401182:	48 83 c2 20          	add    $0x20,%rdx
  401186:	45 39 d8             	cmp    %r11d,%r8d
  401189:	72 d9                	jb     401164 <naive+0x174>
  40118b:	01 d9                	add    %ebx,%ecx
  40118d:	39 5c 24 f0          	cmp    %ebx,-0x10(%rsp)
  401191:	74 72                	je     401205 <naive+0x215>
  401193:	8d 14 0f             	lea    (%rdi,%rcx,1),%edx
  401196:	45 8d 04 0f          	lea    (%r15,%rcx,1),%r8d
  40119a:	48 63 d2             	movslq %edx,%rdx
  40119d:	4d 63 c0             	movslq %r8d,%r8
  4011a0:	49 8d 14 d4          	lea    (%r12,%rdx,8),%rdx
  4011a4:	c4 81 7b 10 4c c5 00 	vmovsd 0x0(%r13,%r8,8),%xmm1
  4011ab:	c4 e2 f9 a9 0a       	vfmadd213sd (%rdx),%xmm0,%xmm1
  4011b0:	c5 fb 11 0a          	vmovsd %xmm1,(%rdx)
  4011b4:	8d 51 01             	lea    0x1(%rcx),%edx
  4011b7:	41 39 d6             	cmp    %edx,%r14d
  4011ba:	74 49                	je     401205 <naive+0x215>
  4011bc:	44 8d 04 3a          	lea    (%rdx,%rdi,1),%r8d
  4011c0:	44 01 fa             	add    %r15d,%edx
  4011c3:	83 c1 02             	add    $0x2,%ecx
  4011c6:	48 63 d2             	movslq %edx,%rdx
  4011c9:	41 39 ce             	cmp    %ecx,%r14d
  4011cc:	4d 63 c0             	movslq %r8d,%r8
  4011cf:	c4 c1 7b 10 4c d5 00 	vmovsd 0x0(%r13,%rdx,8),%xmm1
  4011d6:	4f 8d 04 c4          	lea    (%r12,%r8,8),%r8
  4011da:	c4 c2 f9 a9 08       	vfmadd213sd (%r8),%xmm0,%xmm1
  4011df:	c4 c1 7b 11 08       	vmovsd %xmm1,(%r8)
  4011e4:	74 1f                	je     401205 <naive+0x215>
  4011e6:	8d 14 0f             	lea    (%rdi,%rcx,1),%edx
  4011e9:	44 01 f9             	add    %r15d,%ecx
  4011ec:	48 63 c9             	movslq %ecx,%rcx
  4011ef:	48 63 d2             	movslq %edx,%rdx
  4011f2:	49 8d 14 d4          	lea    (%r12,%rdx,8),%rdx
  4011f6:	c5 fb 10 1a          	vmovsd (%rdx),%xmm3
  4011fa:	c4 c2 e1 99 44 cd 00 	vfmadd132sd 0x0(%r13,%rcx,8),%xmm3,%xmm0
  401201:	c5 fb 11 02          	vmovsd %xmm0,(%rdx)
  401205:	48 83 c6 01          	add    $0x1,%rsi
  401209:	48 03 44 24 e0       	add    -0x20(%rsp),%rax
  40120e:	44 01 f7             	add    %r14d,%edi
  401211:	39 74 24 f4          	cmp    %esi,-0xc(%rsp)
  401215:	74 49                	je     401260 <naive+0x270>
  401217:	45 85 f6             	test   %r14d,%r14d
  40121a:	74 e9                	je     401205 <naive+0x215>
  40121c:	48 89 c1             	mov    %rax,%rcx
  40121f:	48 8b 5c 24 d8       	mov    -0x28(%rsp),%rbx
  401224:	44 89 f2             	mov    %r14d,%edx
  401227:	83 e1 1f             	and    $0x1f,%ecx
  40122a:	48 c1 e9 03          	shr    $0x3,%rcx
  40122e:	48 f7 d9             	neg    %rcx
  401231:	c5 fb 10 04 f3       	vmovsd (%rbx,%rsi,8),%xmm0
  401236:	83 e1 03             	and    $0x3,%ecx
  401239:	44 39 f1             	cmp    %r14d,%ecx
  40123c:	41 0f 47 ce          	cmova  %r14d,%ecx
  401240:	41 83 fe 04          	cmp    $0x4,%r14d
  401244:	0f 86 6e fe ff ff    	jbe    4010b8 <naive+0xc8>
  40124a:	85 c9                	test   %ecx,%ecx
  40124c:	75 42                	jne    401290 <naive+0x2a0>
  40124e:	31 d2                	xor    %edx,%edx
  401250:	31 c9                	xor    %ecx,%ecx
  401252:	e9 d2 fe ff ff       	jmpq   401129 <naive+0x139>
  401257:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40125e:	00 00 
  401260:	83 44 24 bc 01       	addl   $0x1,-0x44(%rsp)
  401265:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401269:	45 01 f7             	add    %r14d,%r15d
  40126c:	01 44 24 b8          	add    %eax,-0x48(%rsp)
  401270:	8b 44 24 b4          	mov    -0x4c(%rsp),%eax
  401274:	39 44 24 bc          	cmp    %eax,-0x44(%rsp)
  401278:	0f 85 ca fd ff ff    	jne    401048 <naive+0x58>
  40127e:	c5 f8 77             	vzeroupper 
  401281:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  401285:	5b                   	pop    %rbx
  401286:	41 5c                	pop    %r12
  401288:	41 5d                	pop    %r13
  40128a:	41 5e                	pop    %r14
  40128c:	41 5f                	pop    %r15
  40128e:	5d                   	pop    %rbp
  40128f:	c3                   	retq   
  401290:	89 ca                	mov    %ecx,%edx
  401292:	e9 21 fe ff ff       	jmpq   4010b8 <naive+0xc8>
  401297:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40129e:	00 00 

00000000004012a0 <kernel>:
  4012a0:	85 d2                	test   %edx,%edx
  4012a2:	0f 84 d9 01 00 00    	je     401481 <kernel+0x1e1>
  4012a8:	55                   	push   %rbp
  4012a9:	8d 42 ff             	lea    -0x1(%rdx),%eax
  4012ac:	48 89 e5             	mov    %rsp,%rbp
  4012af:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  4012b3:	48 c1 e0 05          	shl    $0x5,%rax
  4012b7:	48 83 c4 10          	add    $0x10,%rsp
  4012bb:	49 8d 44 00 20       	lea    0x20(%r8,%rax,1),%rax
  4012c0:	c4 c1 7d 28 81 c0 01 	vmovapd 0x1c0(%r9),%ymm0
  4012c7:	00 00 
  4012c9:	c4 41 7d 28 31       	vmovapd (%r9),%ymm14
  4012ce:	c4 41 7d 28 69 20    	vmovapd 0x20(%r9),%ymm13
  4012d4:	c4 41 7d 28 61 40    	vmovapd 0x40(%r9),%ymm12
  4012da:	c4 41 7d 28 59 60    	vmovapd 0x60(%r9),%ymm11
  4012e0:	c4 41 7d 28 91 80 00 	vmovapd 0x80(%r9),%ymm10
  4012e7:	00 00 
  4012e9:	c4 41 7d 28 89 a0 00 	vmovapd 0xa0(%r9),%ymm9
  4012f0:	00 00 
  4012f2:	c4 41 7d 28 81 c0 00 	vmovapd 0xc0(%r9),%ymm8
  4012f9:	00 00 
  4012fb:	c4 c1 7d 28 b9 e0 00 	vmovapd 0xe0(%r9),%ymm7
  401302:	00 00 
  401304:	c4 c1 7d 28 b1 00 01 	vmovapd 0x100(%r9),%ymm6
  40130b:	00 00 
  40130d:	c4 c1 7d 28 a9 20 01 	vmovapd 0x120(%r9),%ymm5
  401314:	00 00 
  401316:	c4 c1 7d 28 a1 40 01 	vmovapd 0x140(%r9),%ymm4
  40131d:	00 00 
  40131f:	c4 c1 7d 28 99 60 01 	vmovapd 0x160(%r9),%ymm3
  401326:	00 00 
  401328:	c4 c1 7d 28 91 80 01 	vmovapd 0x180(%r9),%ymm2
  40132f:	00 00 
  401331:	c4 c1 7d 28 89 a0 01 	vmovapd 0x1a0(%r9),%ymm1
  401338:	00 00 
  40133a:	c5 fd 29 44 24 d0    	vmovapd %ymm0,-0x30(%rsp)
  401340:	c4 62 7d 19 39       	vbroadcastsd (%rcx),%ymm15
  401345:	49 83 c0 20          	add    $0x20,%r8
  401349:	48 83 c1 78          	add    $0x78,%rcx
  40134d:	c4 c1 7d 28 40 e0    	vmovapd -0x20(%r8),%ymm0
  401353:	c4 62 85 b8 f0       	vfmadd231pd %ymm0,%ymm15,%ymm14
  401358:	c4 41 7d 29 31       	vmovapd %ymm14,(%r9)
  40135d:	c4 62 7d 19 79 90    	vbroadcastsd -0x70(%rcx),%ymm15
  401363:	c4 62 85 b8 e8       	vfmadd231pd %ymm0,%ymm15,%ymm13
  401368:	c4 41 7d 29 69 20    	vmovapd %ymm13,0x20(%r9)
  40136e:	c4 62 7d 19 79 98    	vbroadcastsd -0x68(%rcx),%ymm15
  401374:	c4 62 85 b8 e0       	vfmadd231pd %ymm0,%ymm15,%ymm12
  401379:	c4 41 7d 29 61 40    	vmovapd %ymm12,0x40(%r9)
  40137f:	c4 62 7d 19 79 a0    	vbroadcastsd -0x60(%rcx),%ymm15
  401385:	c4 62 85 b8 d8       	vfmadd231pd %ymm0,%ymm15,%ymm11
  40138a:	c4 41 7d 29 59 60    	vmovapd %ymm11,0x60(%r9)
  401390:	c4 62 7d 19 79 a8    	vbroadcastsd -0x58(%rcx),%ymm15
  401396:	c4 62 85 b8 d0       	vfmadd231pd %ymm0,%ymm15,%ymm10
  40139b:	c4 41 7d 29 91 80 00 	vmovapd %ymm10,0x80(%r9)
  4013a2:	00 00 
  4013a4:	c4 62 7d 19 79 b0    	vbroadcastsd -0x50(%rcx),%ymm15
  4013aa:	c4 62 85 b8 c8       	vfmadd231pd %ymm0,%ymm15,%ymm9
  4013af:	c4 41 7d 29 89 a0 00 	vmovapd %ymm9,0xa0(%r9)
  4013b6:	00 00 
  4013b8:	c4 62 7d 19 79 b8    	vbroadcastsd -0x48(%rcx),%ymm15
  4013be:	c4 62 85 b8 c0       	vfmadd231pd %ymm0,%ymm15,%ymm8
  4013c3:	c4 41 7d 29 81 c0 00 	vmovapd %ymm8,0xc0(%r9)
  4013ca:	00 00 
  4013cc:	c4 62 7d 19 79 c0    	vbroadcastsd -0x40(%rcx),%ymm15
  4013d2:	c4 e2 85 b8 f8       	vfmadd231pd %ymm0,%ymm15,%ymm7
  4013d7:	c4 c1 7d 29 b9 e0 00 	vmovapd %ymm7,0xe0(%r9)
  4013de:	00 00 
  4013e0:	c4 62 7d 19 79 c8    	vbroadcastsd -0x38(%rcx),%ymm15
  4013e6:	c4 e2 85 b8 f0       	vfmadd231pd %ymm0,%ymm15,%ymm6
  4013eb:	c4 c1 7d 29 b1 00 01 	vmovapd %ymm6,0x100(%r9)
  4013f2:	00 00 
  4013f4:	c4 62 7d 19 79 d0    	vbroadcastsd -0x30(%rcx),%ymm15
  4013fa:	c4 e2 85 b8 e8       	vfmadd231pd %ymm0,%ymm15,%ymm5
  4013ff:	c4 c1 7d 29 a9 20 01 	vmovapd %ymm5,0x120(%r9)
  401406:	00 00 
  401408:	c4 62 7d 19 79 d8    	vbroadcastsd -0x28(%rcx),%ymm15
  40140e:	c4 e2 85 b8 e0       	vfmadd231pd %ymm0,%ymm15,%ymm4
  401413:	c4 c1 7d 29 a1 40 01 	vmovapd %ymm4,0x140(%r9)
  40141a:	00 00 
  40141c:	c4 62 7d 19 79 e0    	vbroadcastsd -0x20(%rcx),%ymm15
  401422:	c4 e2 85 b8 d8       	vfmadd231pd %ymm0,%ymm15,%ymm3
  401427:	c4 c1 7d 29 99 60 01 	vmovapd %ymm3,0x160(%r9)
  40142e:	00 00 
  401430:	c4 62 7d 19 79 e8    	vbroadcastsd -0x18(%rcx),%ymm15
  401436:	c4 e2 85 b8 d0       	vfmadd231pd %ymm0,%ymm15,%ymm2
  40143b:	c4 c1 7d 29 91 80 01 	vmovapd %ymm2,0x180(%r9)
  401442:	00 00 
  401444:	c4 62 7d 19 79 f0    	vbroadcastsd -0x10(%rcx),%ymm15
  40144a:	c4 e2 85 b8 c8       	vfmadd231pd %ymm0,%ymm15,%ymm1
  40144f:	c4 c1 7d 29 89 a0 01 	vmovapd %ymm1,0x1a0(%r9)
  401456:	00 00 
  401458:	c4 62 7d 19 79 f8    	vbroadcastsd -0x8(%rcx),%ymm15
  40145e:	49 39 c0             	cmp    %rax,%r8
  401461:	c4 62 fd a8 7c 24 d0 	vfmadd213pd -0x30(%rsp),%ymm0,%ymm15
  401468:	c5 7d 29 7c 24 d0    	vmovapd %ymm15,-0x30(%rsp)
  40146e:	c4 41 7d 29 b9 c0 01 	vmovapd %ymm15,0x1c0(%r9)
  401475:	00 00 
  401477:	0f 85 c3 fe ff ff    	jne    401340 <kernel+0xa0>
  40147d:	c5 f8 77             	vzeroupper 
  401480:	c9                   	leaveq 
  401481:	f3 c3                	repz retq 
  401483:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40148a:	00 00 00 
  40148d:	0f 1f 00             	nopl   (%rax)

0000000000401490 <__libc_csu_init>:
  401490:	41 57                	push   %r15
  401492:	41 89 ff             	mov    %edi,%r15d
  401495:	41 56                	push   %r14
  401497:	49 89 f6             	mov    %rsi,%r14
  40149a:	41 55                	push   %r13
  40149c:	49 89 d5             	mov    %rdx,%r13
  40149f:	41 54                	push   %r12
  4014a1:	4c 8d 25 68 09 20 00 	lea    0x200968(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  4014a8:	55                   	push   %rbp
  4014a9:	48 8d 2d 68 09 20 00 	lea    0x200968(%rip),%rbp        # 601e18 <__init_array_end>
  4014b0:	53                   	push   %rbx
  4014b1:	4c 29 e5             	sub    %r12,%rbp
  4014b4:	31 db                	xor    %ebx,%ebx
  4014b6:	48 c1 fd 03          	sar    $0x3,%rbp
  4014ba:	48 83 ec 08          	sub    $0x8,%rsp
  4014be:	e8 cd ef ff ff       	callq  400490 <_init>
  4014c3:	48 85 ed             	test   %rbp,%rbp
  4014c6:	74 1e                	je     4014e6 <__libc_csu_init+0x56>
  4014c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4014cf:	00 
  4014d0:	4c 89 ea             	mov    %r13,%rdx
  4014d3:	4c 89 f6             	mov    %r14,%rsi
  4014d6:	44 89 ff             	mov    %r15d,%edi
  4014d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4014dd:	48 83 c3 01          	add    $0x1,%rbx
  4014e1:	48 39 eb             	cmp    %rbp,%rbx
  4014e4:	75 ea                	jne    4014d0 <__libc_csu_init+0x40>
  4014e6:	48 83 c4 08          	add    $0x8,%rsp
  4014ea:	5b                   	pop    %rbx
  4014eb:	5d                   	pop    %rbp
  4014ec:	41 5c                	pop    %r12
  4014ee:	41 5d                	pop    %r13
  4014f0:	41 5e                	pop    %r14
  4014f2:	41 5f                	pop    %r15
  4014f4:	c3                   	retq   
  4014f5:	90                   	nop
  4014f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4014fd:	00 00 00 

0000000000401500 <__libc_csu_fini>:
  401500:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401504 <_fini>:
  401504:	48 83 ec 08          	sub    $0x8,%rsp
  401508:	48 83 c4 08          	add    $0x8,%rsp
  40150c:	c3                   	retq   
