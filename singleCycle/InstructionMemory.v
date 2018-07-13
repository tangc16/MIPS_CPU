
module InstructionMemory(Address, Instruction);
	input [31:0] Address;
	output reg [31:0] Instruction;
	
	always @(*)
	    case (Address[9:2])
			0: Instruction <= 32'b00001000000000000000000000010000; // jump to normal入口，第一条jal，然后跳到前面，最后一条jr使得最高位清零
			1: Instruction <= 32'b00001000000000000000000001100000; //jump to Interrupt
			15: Instruction <= 32'b00000011111000000000000000001000;//	jr $ra, $ra中存着17地址
			
			
			16: Instruction <= 32'b000011_00000000000000000000001111;// jal 15
17: Instruction <= 32'b00111100000011010100000000000000; // ['', ['lui', '$t5', '0x4000']]
18: Instruction <= 32'b10101101101000000000000000001000; // ['', ['sw', '$zero', '8($t5)']]
19: Instruction <= 32'b00111100000011001111111111111111; // ['', ['lui', '$t4', '0xffff']]
20: Instruction <= 32'b00100000000011001110000000000000; // ['', ['addi', '$t4', '$zero', '0xe000']]
21: Instruction <= 32'b10101101101011000000000000000000; // ['', ['sw', '$t4', '0($t5)']]
22: Instruction <= 32'b00000000000000000111000000100111; // ['', ['nor', '$t6', '$zero', '$zero']]
23: Instruction <= 32'b10101101101011100000000000000100; // ['', ['sw', '$t6', '4($t5)']]
24: Instruction <= 32'b00100000000011000000000000000011; // ['', ['addi', '$t4', '$zero', '0x0003']]
25: Instruction <= 32'b10101101101011000000000000001000; // ['', ['sw', '$t4', '8($t5)']]
26: Instruction <= 32'b00000000000100000100000000101010; // ['loop', ['slt', '$t0', '$zero', '$s0']]
27: Instruction <= 32'b00000000000100010100100000101010; // ['', ['slt', '$t1', '$zero', '$s1']]
28: Instruction <= 32'b00000001000010010101000000100100; // ['', ['and', '$t2', '$t0', '$t1']]
29: Instruction <= 32'b00010101010000000000000000000011; // ['', ['bne', '$t2', '$zero', 'target']]
30: Instruction <= 32'b00000010000000001001000000100000; // ['', ['add', '$s2', '$s0', '$zero']]
31: Instruction <= 32'b00001000000000000000000000011010; // ['', ['j', 'loop']]
32: Instruction <= 32'b00000000000000000000000000000000; // ['', ['sll', '$zero', '$zero', '0']]
33: Instruction <= 32'b00000010001000001001100000100000; // ['target', ['add', '$s3', '$s1', '$zero']]
34: Instruction <= 32'b00000010010100110101100000101010; // ['compare', ['slt', '$t3', '$s2', '$s3']]
35: Instruction <= 32'b00010001011000000000000000000100; // ['', ['beq', '$t3', '$zero', 's2greater']]
36: Instruction <= 32'b00000000000000000000000000000000; // ['', ['sll', '$zero', '$zero', '0']]
37: Instruction <= 32'b00000010010000000110000000100000; // ['', ['add', '$t4', '$s2', '$zero']]
38: Instruction <= 32'b00000010011000001001000000100000; // ['', ['add', '$s2', '$s3', '$zero']]
39: Instruction <= 32'b00000001100000001001100000100000; // ['', ['add', '$s3', '$t4', '$zero']]
40: Instruction <= 32'b00000010010100111010000000100010; // ['s2greater', ['sub', '$s4', '$s2', '$s3']]
41: Instruction <= 32'b00010010100000000000000000000101; // ['', ['beq', '$s4', '$zero', 'finish']]
42: Instruction <= 32'b00000000000000000000000000000000; // ['', ['sll', '$zero', '$zero', '0']]
43: Instruction <= 32'b00000010011000001001000000100000; // ['', ['add', '$s2', '$s3', '$zero']]
44: Instruction <= 32'b00000010100000001001100000100000; // ['', ['add', '$s3', '$s4', '$zero']]
45: Instruction <= 32'b00001000000000000000000000100010; // ['', ['j', 'compare']]
46: Instruction <= 32'b00000000000000000000000000000000; // ['', ['sll', '$zero', '$zero', '0']]
47: Instruction <= 32'b00111100000011010100000000000000; // ['finish', ['lui', '$t5', '0x4000']]
48: Instruction <= 32'b10101101101100110000000000011000; // ['', ['sw', '$s3', '24($t5)']]
49: Instruction <= 32'b10101101101100110000000000001100; // ['', ['sw', '$s3', '12($t5)']]
50: Instruction <= 32'b00001000000000000000000000110011; // ['', ['j', 'Exit']]
51: Instruction <= 32'b00111100000010000100000000000000; // ['Exit', ['lui', '$t0', '0x4000']]
52: Instruction <= 32'b10001101000010010000000000100000; // ['', ['lw', '$t1', '32($t0)']]
53: Instruction <= 32'b00100000000010100000000000001000; // ['', ['addi', '$t2', '$zero', '8']]
54: Instruction <= 32'b00000001001010100100100000100100; // ['', ['and', '$t1', '$t1', '$t2']]
55: Instruction <= 32'b00010101001000001111111111100010; // ['', ['bne', '$t1', '$zero', 'loop']]
56: Instruction <= 32'b00001000000000000000000000110011; // ['', ['j', 'Exit']]


96: Instruction <= 32'b00100011101111011111111111100100; // ['', ['addi', '$sp', '$sp', '-28']]
97: Instruction <= 32'b10101111101011100000000000011000; // ['', ['sw', '$t6', '24($sp)']]
98: Instruction <= 32'b10101111101011010000000000010100; // ['', ['sw', '$t5', '20($sp)']]
99: Instruction <= 32'b10101111101011000000000000010000; // ['', ['sw', '$t4', '16($sp)']]
100: Instruction <= 32'b10101111101010110000000000001100; // ['', ['sw', '$t3', '12($sp)']]
101: Instruction <= 32'b10101111101010100000000000001000; // ['', ['sw', '$t2', '8($sp)']]
102: Instruction <= 32'b10101111101010010000000000000100; // ['', ['sw', '$t1', '4($sp)']]
103: Instruction <= 32'b10101111101010000000000000000000; // ['', ['sw', '$t0', '0($sp)']]
104: Instruction <= 32'b00111100000010000100000000000000; // ['', ['lui', '$t0', '0x4000']]
105: Instruction <= 32'b10001101000010010000000000001000; // ['', ['lw', '$t1', '8($t0)']]
106: Instruction <= 32'b00100000000010101111111111111001; // ['', ['addi', '$t2', '$zero', '0xFFF9']]
107: Instruction <= 32'b00000001001010100100100000100100; // ['', ['and', '$t1', '$t1', '$t2']]
108: Instruction <= 32'b10101101000010010000000000001000; // ['', ['sw', '$t1', '8($t0)']]
109: Instruction <= 32'b10001101000010010000000000100000; // ['', ['lw', '$t1', '32($t0)']]
110: Instruction <= 32'b00110001001010100000000000001000; // ['', ['andi', '$t2', '$t1', '0x0008']]
111: Instruction <= 32'b00010001010000000000000000000100; // ['', ['beq', '$t2', '$zero', 'noload']]
112: Instruction <= 32'b00010010000000000000000000000010; // ['', ['beq', '$s0', '$zero', 'loads0']]
113: Instruction <= 32'b10001101000100010000000000011100; // ['', ['lw', '$s1', '28($t0)']]
114: Instruction <= 32'b00001000000000000000000001110100; // ['', ['j', 'noload']]
115: Instruction <= 32'b10001101000100000000000000011100; // ['loads0', ['lw', '$s0', '28($t0)']]
116: Instruction <= 32'b10001101000010010000000000010100; // ['noload', ['lw', '$t1', '20($t0)']]
117: Instruction <= 32'b00000000000100010110000100000010; // ['', ['srl', '$t4', '$s1', '4']]
118: Instruction <= 32'b00110001001010100000000100000000; // ['', ['andi', '$t2', '$t1', '0x0100']]
119: Instruction <= 32'b00010001010000000000000000000010; // ['', ['beq', '$t2', '$zero', 'target1']]
120: Instruction <= 32'b00100000000010110000001000000000; // ['', ['addi', '$t3', '$zero', '0x0200']]
121: Instruction <= 32'b00001000000000000000000010000110; // ['', ['j', 'finish']]
122: Instruction <= 32'b00110001001010100000001000000000; // ['target1', ['andi', '$t2', '$t1', '0x0200']]
123: Instruction <= 32'b00010001010000000000000000000011; // ['', ['beq', '$t2', '$zero', 'target2']]
124: Instruction <= 32'b00100000000010110000010000000000; // ['', ['addi', '$t3', '$zero', '0x0400']]
125: Instruction <= 32'b00110010000011000000000000001111; // ['', ['andi', '$t4', '$s0', '0x000F']]
126: Instruction <= 32'b00001000000000000000000010000110; // ['', ['j', 'finish']]
127: Instruction <= 32'b00110001001010100000010000000000; // ['target2', ['andi', '$t2', '$t1', '0x0400']]
128: Instruction <= 32'b00010001010010010000000000000011; // ['', ['beq', '$t2', '$t1', 'target3']]
129: Instruction <= 32'b00100000000010110000100000000000; // ['', ['addi', '$t3', '$zero', '0x0800']]
130: Instruction <= 32'b00000000000100000110000100000010; // ['', ['srl', '$t4', '$s0', '4']]
131: Instruction <= 32'b00001000000000000000000010000110; // ['', ['j', 'finish']]
132: Instruction <= 32'b00100000000010110000000100000000; // ['target3', ['addi', '$t3', '$zero', '0x0100']]
133: Instruction <= 32'b00110010001011000000000000001111; // ['', ['andi', '$t4', '$s1', '0x000F']]
134: Instruction <= 32'b10001101100011010000000000000000; // ['finish', ['lw', '$t5', '0($t4)']]
135: Instruction <= 32'b00000001101010110111000000100000; // ['', ['add', '$t6', '$t5', '$t3']]
136: Instruction <= 32'b10101101000011100000000000010100; // ['', ['sw', '$t6', '20($t0)']]
137: Instruction <= 32'b10001101000010010000000000001000; // ['', ['lw', '$t1', '8($t0)']]
138: Instruction <= 32'b00100000000010100000000000000010; // ['', ['addi', '$t2', '$zero', '0x0002']]
139: Instruction <= 32'b00000001001010100101100000100101; // ['', ['or', '$t3', '$t1', '$t2']]
140: Instruction <= 32'b10101101000010110000000000001000; // ['', ['sw', '$t3', '8($t0)']]
141: Instruction <= 32'b10001111101010000000000000000000; // ['', ['lw', '$t0', '0($sp)']]
142: Instruction <= 32'b10001101001010010000000000000100; // ['', ['lw', '$t1', '4($t1)']]
143: Instruction <= 32'b10001111101010100000000000001000; // ['', ['lw', '$t2', '8($sp)']]
144: Instruction <= 32'b10001111101010110000000000001100; // ['', ['lw', '$t3', '12($sp)']]
145: Instruction <= 32'b10001111101011000000000000010000; // ['', ['lw', '$t4', '16($sp)']]
146: Instruction <= 32'b10001111101011010000000000010100; // ['', ['lw', '$t5', '20($sp)']]
147: Instruction <= 32'b10001111101011100000000000011000; // ['', ['lw', '$t6', '24($sp)']]
148: Instruction <= 32'b00100011101111010000000000011100; // ['', ['addi', '$sp', '$sp', '28']]
149: Instruction <= 32'b00000011010000000000000000001000; // ['', ['jr', '$k0']]

/*160: Instruction <= 32'b00111100000010000100000000000000; // ['Exit', ['lui', '$t0', '0x4000']]
161: Instruction <= 32'b10001101000010010000000000100000; // ['', ['lw', '$t1', '32($t0)']]
162: Instruction <= 32'b00100000000010100000000000001000; // ['', ['addi', '$t2', '$zero', '8']]
163: Instruction <= 32'b00000001001010100100100000100100; // ['', ['and', '$t1', '$t1', '$t2']]
164: Instruction <= 32'b00010101001000001111111101110101; // ['', ['bne', '$t1', '$zero', 'loop']]
165: Instruction <= 32'b00100010011011110000000000000000; // ['', ['addi', '$t7', '$s3', '0']]
166: Instruction <= 32'b00100000000011100000000000001111; // ['', ['addi', '$t6', '$zero', '0x000f']]
167: Instruction <= 32'b00000001110011110111000000100100; // ['', ['and', '$t6', '$t6', '$t7']]
168: Instruction <= 32'b00001100000000000000000011000110; // ['', ['jal', 'BCD']]
169: Instruction <= 32'b00111100000011100000000000000001; // ['', ['lui', '$t6', '1']]
170: Instruction <= 32'b00000000010011100001000000100000; // ['', ['add', '$v0', '$v0', '$t6']]
171: Instruction <= 32'b00111100000010000100000000000000; // ['', ['lui', '$t0', '0x4000']]
172: Instruction <= 32'b10101101000000100000000000010100; // ['', ['sw', '$v0', '20($t0)']]
173: Instruction <= 32'b00100000000011100000000011110000; // ['', ['addi', '$t6', '$zero', '0x00f0']]
174: Instruction <= 32'b00000001110011110111000000100100; // ['', ['and', '$t6', '$t6', '$t7']]
175: Instruction <= 32'b00000000000011100111000100000010; // ['', ['srl', '$t6', '$t6', '4']]
176: Instruction <= 32'b00001100000000000000000011000110; // ['', ['jal', 'BCD']]
177: Instruction <= 32'b00111100000011100000000000000010; // ['', ['lui', '$t6', '2']]
178: Instruction <= 32'b00000000010011100001000000100000; // ['', ['add', '$v0', '$v0', '$t6']]
179: Instruction <= 32'b00111100000010000100000000000000; // ['', ['lui', '$t0', '0x4000']]
180: Instruction <= 32'b10101101000000100000000000010100; // ['', ['sw', '$v0', '20($t0)']]
181: Instruction <= 32'b00100000000011100000111100000000; // ['', ['addi', '$t6', '$zero', '0x0f00']]
182: Instruction <= 32'b00000001110011110111000000100100; // ['', ['and', '$t6', '$t6', '$t7']]
183: Instruction <= 32'b00000000000011100111001000000010; // ['', ['srl', '$t6', '$t6', '8']]
184: Instruction <= 32'b00001100000000000000000011000110; // ['', ['jal', 'BCD']]
185: Instruction <= 32'b00111100000011100000000000000100; // ['', ['lui', '$t6', '4']]
186: Instruction <= 32'b00000000010011100001000000100000; // ['', ['add', '$v0', '$v0', '$t6']]
187: Instruction <= 32'b00111100000010000100000000000000; // ['', ['lui', '$t0', '0x4000']]
188: Instruction <= 32'b10101101000000100000000000010100; // ['', ['sw', '$v0', '20($t0)']]
189: Instruction <= 32'b00100000000011101111000000000000; // ['', ['addi', '$t6', '$zero', '0xf000']]
190: Instruction <= 32'b00000001110011110111000000100100; // ['', ['and', '$t6', '$t6', '$t7']]
191: Instruction <= 32'b00000000000011100111001100000010; // ['', ['srl', '$t6', '$t6', '12']]
192: Instruction <= 32'b00001100000000000000000011000110; // ['', ['jal', 'BCD']]
193: Instruction <= 32'b00111100000011100000000000001000; // ['', ['lui', '$t6', '8']]
194: Instruction <= 32'b00000000010011100001000000100000; // ['', ['add', '$v0', '$v0', '$t6']]
195: Instruction <= 32'b00111100000010000100000000000000; // ['', ['lui', '$t0', '0x4000']]
196: Instruction <= 32'b10101101000000100000000000010100; // ['', ['sw', '$v0', '20($t0)']]
197: Instruction <= 32'b00001000000000000000000010100000; // ['', ['j', 'Exit']]
198: Instruction <= 32'b00010001110000000000000000011110; // ['BCD', ['beq', '$t6', '$zero', 'Disp0']]
199: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
200: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp1']]
201: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
202: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp2']]
203: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
204: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp3']]
205: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
206: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp4']]
207: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
208: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp5']]
209: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
210: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp6']]
211: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
212: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp7']]
213: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
214: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp8']]
215: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
216: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Disp9']]
217: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
218: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispa']]
219: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
220: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispb']]
221: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
222: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispc']]
223: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
224: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispd']]
225: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
226: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispe']]
227: Instruction <= 32'b00100001110011100000000000000001; // ['', ['addi', '$t6', '$t6', '-1']]
228: Instruction <= 32'b00010001110000000000000000011110; // ['', ['beq', '$t6', '$zero', 'Dispf']]
229: Instruction <= 32'b00100000000000100000000011000000; // ['Disp0', ['addi', '$v0', '$zero', '0xC0']]
230: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
231: Instruction <= 32'b00100000000000100000000011111001; // ['Disp1', ['addi', '$v0', '$zero', '0xf9']]
232: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
233: Instruction <= 32'b00100000000000100000000010100100; // ['Disp2', ['addi', '$v0', '$zero', '0xa4']]
234: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
235: Instruction <= 32'b00100000000000100000000010110000; // ['Disp3', ['addi', '$v0', '$zero', '0xb0']]
236: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
237: Instruction <= 32'b00100000000000100000000010011001; // ['Disp4', ['addi', '$v0', '$zero', '0x99']]
238: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
239: Instruction <= 32'b00100000000000100000000010010010; // ['Disp5', ['addi', '$v0', '$zero', '0x92']]
240: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
241: Instruction <= 32'b00100000000000100000000010000010; // ['Disp6', ['addi', '$v0', '$zero', '0x82']]
242: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
243: Instruction <= 32'b00100000000000100000000011111000; // ['Disp7', ['addi', '$v0', '$zero', '0xf8']]
244: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
245: Instruction <= 32'b00100000000000100000000010000000; // ['Disp8', ['addi', '$v0', '$zero', '0x80']]
246: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
247: Instruction <= 32'b00100000000000100000000010010000; // ['Disp9', ['addi', '$v0', '$zero', '0x90']]
248: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
249: Instruction <= 32'b00100000000000100000000010001000; // ['Dispa', ['addi', '$v0', '$zero', '0x88']]
250: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
251: Instruction <= 32'b00100000000000100000000010000011; // ['Dispb', ['addi', '$v0', '$zero', '0x83']]
252: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
253: Instruction <= 32'b00100000000000100000000011000110; // ['Dispc', ['addi', '$v0', '$zero', '0xc6']]
254: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
255: Instruction <= 32'b00100000000000100000000010100001; // ['Dispd', ['addi', '$v0', '$zero', '0xa1']]
256: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
257: Instruction <= 32'b00100000000000100000000010000110; // ['Dispe', ['addi', '$v0', '$zero', '0x86']]
258: Instruction <= 32'b00000011111000000000000000001000; // ['', ['jr', '$ra']]
259: Instruction <= 32'b00100000000000100000000010001110; // ['Dispf', ['addi', '$v0', '$zero', '0x8e']]
*/
			default: Instruction <= 32'h00000000;
		endcase
		
endmodule
