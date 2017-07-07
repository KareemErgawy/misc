
reverse.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 40          	sub    $0x40,%rsp
   8:	48 89 f8             	mov    %rdi,%rax
   b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  12:	00 
  13:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  17:	48 89 f7             	mov    %rsi,%rdi
  1a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  1e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  22:	e8 00 00 00 00       	callq  27 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x27>
  27:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  2f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  33:	0f 83 d3 00 00 00    	jae    10c <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x10c>
  39:	e9 00 00 00 00       	jmpq   3e <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3e>
  3e:	31 c0                	xor    %eax,%eax
  40:	88 c1                	mov    %al,%cl
  42:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  46:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
  4a:	88 4d cf             	mov    %cl,-0x31(%rbp)
  4d:	0f 83 19 00 00 00    	jae    6c <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x6c>
  53:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
  57:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  5b:	e8 00 00 00 00       	callq  60 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x60>
  60:	0f be 08             	movsbl (%rax),%ecx
  63:	83 f9 20             	cmp    $0x20,%ecx
  66:	0f 94 c2             	sete   %dl
  69:	88 55 cf             	mov    %dl,-0x31(%rbp)
  6c:	8a 45 cf             	mov    -0x31(%rbp),%al
  6f:	a8 01                	test   $0x1,%al
  71:	0f 85 05 00 00 00    	jne    7c <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x7c>
  77:	e9 16 00 00 00       	jmpq   92 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x92>
  7c:	e9 00 00 00 00       	jmpq   81 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x81>
  81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  85:	48 83 c0 01          	add    $0x1,%rax
  89:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8d:	e9 ac ff ff ff       	jmpq   3e <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3e>
  92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  96:	89 c1                	mov    %eax,%ecx
  98:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  9b:	31 c0                	xor    %eax,%eax
  9d:	88 c1                	mov    %al,%cl
  9f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  a3:	48 3b 55 f0          	cmp    -0x10(%rbp),%rdx
  a7:	88 4d ce             	mov    %cl,-0x32(%rbp)
  aa:	0f 83 19 00 00 00    	jae    c9 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc9>
  b0:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
  b4:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  b8:	e8 00 00 00 00       	callq  bd <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xbd>
  bd:	0f be 08             	movsbl (%rax),%ecx
  c0:	83 f9 20             	cmp    $0x20,%ecx
  c3:	0f 95 c2             	setne  %dl
  c6:	88 55 ce             	mov    %dl,-0x32(%rbp)
  c9:	8a 45 ce             	mov    -0x32(%rbp),%al
  cc:	a8 01                	test   $0x1,%al
  ce:	0f 85 05 00 00 00    	jne    d9 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xd9>
  d4:	e9 16 00 00 00       	jmpq   ef <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xef>
  d9:	e9 00 00 00 00       	jmpq   de <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xde>
  de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  e2:	48 83 c0 01          	add    $0x1,%rax
  e6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  ea:	e9 ac ff ff ff       	jmpq   9b <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x9b>
  ef:	8b 75 ec             	mov    -0x14(%rbp),%esi
  f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  f6:	48 83 e8 01          	sub    $0x1,%rax
  fa:	89 c1                	mov    %eax,%ecx
  fc:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
 100:	89 ca                	mov    %ecx,%edx
 102:	e8 29 00 00 00       	callq  130 <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii>
 107:	e9 1f ff ff ff       	jmpq   2b <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2b>
 10c:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
 110:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
 114:	e8 00 00 00 00       	callq  119 <_Z12reverseWordsNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x119>
 119:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 11d:	48 83 c4 40          	add    $0x40,%rsp
 121:	5d                   	pop    %rbp
 122:	c3                   	retq   
 123:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
 12a:	84 00 00 00 00 00 

0000000000000130 <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii>:
 130:	55                   	push   %rbp
 131:	48 89 e5             	mov    %rsp,%rbp
 134:	48 83 ec 20          	sub    $0x20,%rsp
 138:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 13c:	89 75 f4             	mov    %esi,-0xc(%rbp)
 13f:	89 55 f0             	mov    %edx,-0x10(%rbp)
 142:	8b 45 f4             	mov    -0xc(%rbp),%eax
 145:	3b 45 f0             	cmp    -0x10(%rbp),%eax
 148:	0f 8d 65 00 00 00    	jge    1b3 <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x83>
 14e:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 152:	48 63 75 f4          	movslq -0xc(%rbp),%rsi
 156:	e8 00 00 00 00       	callq  15b <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x2b>
 15b:	8a 08                	mov    (%rax),%cl
 15d:	88 4d ef             	mov    %cl,-0x11(%rbp)
 160:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 164:	48 63 75 f0          	movslq -0x10(%rbp),%rsi
 168:	e8 00 00 00 00       	callq  16d <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x3d>
 16d:	8a 08                	mov    (%rax),%cl
 16f:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 173:	48 63 75 f4          	movslq -0xc(%rbp),%rsi
 177:	88 4d ee             	mov    %cl,-0x12(%rbp)
 17a:	e8 00 00 00 00       	callq  17f <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x4f>
 17f:	8a 4d ee             	mov    -0x12(%rbp),%cl
 182:	88 08                	mov    %cl,(%rax)
 184:	8a 4d ef             	mov    -0x11(%rbp),%cl
 187:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
 18b:	48 63 75 f0          	movslq -0x10(%rbp),%rsi
 18f:	88 4d ed             	mov    %cl,-0x13(%rbp)
 192:	e8 00 00 00 00       	callq  197 <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x67>
 197:	8a 4d ed             	mov    -0x13(%rbp),%cl
 19a:	88 08                	mov    %cl,(%rax)
 19c:	8b 55 f4             	mov    -0xc(%rbp),%edx
 19f:	83 c2 01             	add    $0x1,%edx
 1a2:	89 55 f4             	mov    %edx,-0xc(%rbp)
 1a5:	8b 55 f0             	mov    -0x10(%rbp),%edx
 1a8:	83 c2 ff             	add    $0xffffffff,%edx
 1ab:	89 55 f0             	mov    %edx,-0x10(%rbp)
 1ae:	e9 8f ff ff ff       	jmpq   142 <_Z11reverseWordRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEii+0x12>
 1b3:	48 83 c4 20          	add    $0x20,%rsp
 1b7:	5d                   	pop    %rbp
 1b8:	c3                   	retq   
