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
111: Instruction <= 32'b00010001010000000000000000000111; // ['', ['beq', '$t2', '$zero', 'noload']]
112: Instruction <= 32'b00010010101000000000000000000100; // ['', ['beq', '$s5', '$zero', 'loads0']]
113: Instruction <= 32'b00010110110000000000000000000101; // ['', ['bne', '$s6', '$zero', 'noload']]
114: Instruction <= 32'b10001101000100010000000000011100; // ['', ['lw', '$s1', '28($t0)']]
115: Instruction <= 32'b00100010001101100000000000000000; // ['', ['addi', '$s6', '$s1', '0']]
116: Instruction <= 32'b00001000000000000000000001110111; // ['', ['j', 'noload']]
117: Instruction <= 32'b10001101000100000000000000011100; // ['loads0', ['lw', '$s0', '28($t0)']]
118: Instruction <= 32'b00100010000101010000000000000000; // ['', ['addi', '$s5', '$s0', '0']]
119: Instruction <= 32'b10001101000010010000000000010100; // ['noload', ['lw', '$t1', '20($t0)']]
120: Instruction <= 32'b00000000000100010110000100000010; // ['', ['srl', '$t4', '$s1', '4']]
121: Instruction <= 32'b00110001001010100000000100000000; // ['', ['andi', '$t2', '$t1', '0x0100']]
122: Instruction <= 32'b00010001010000000000000000000010; // ['', ['beq', '$t2', '$zero', 'target1']]
123: Instruction <= 32'b00100000000010110000001000000000; // ['', ['addi', '$t3', '$zero', '0x0200']]
124: Instruction <= 32'b00001000000000000000000010001001; // ['', ['j', 'finish']]
125: Instruction <= 32'b00110001001010100000001000000000; // ['target1', ['andi', '$t2', '$t1', '0x0200']]
126: Instruction <= 32'b00010001010000000000000000000011; // ['', ['beq', '$t2', '$zero', 'target2']]
127: Instruction <= 32'b00100000000010110000010000000000; // ['', ['addi', '$t3', '$zero', '0x0400']]
128: Instruction <= 32'b00110010000011000000000000001111; // ['', ['andi', '$t4', '$s0', '0x000F']]
129: Instruction <= 32'b00001000000000000000000010001001; // ['', ['j', 'finish']]
130: Instruction <= 32'b00110001001010100000010000000000; // ['target2', ['andi', '$t2', '$t1', '0x0400']]
131: Instruction <= 32'b00010001010000000000000000000011; // ['', ['beq', '$t2', '$zero', 'target3']]
132: Instruction <= 32'b00100000000010110000100000000000; // ['', ['addi', '$t3', '$zero', '0x0800']]
133: Instruction <= 32'b00000000000100000110000100000010; // ['', ['srl', '$t4', '$s0', '4']]
134: Instruction <= 32'b00001000000000000000000010001001; // ['', ['j', 'finish']]
135: Instruction <= 32'b00100000000010110000000100000000; // ['target3', ['addi', '$t3', '$zero', '0x0100']]
136: Instruction <= 32'b00110010001011000000000000001111; // ['', ['andi', '$t4', '$s1', '0x000F']]
137: Instruction <= 32'b00000000000011000110000010000000; // ['finish', ['sll', '$t4', '$t4', '2']]
138: Instruction <= 32'b10001101100011010000000000000000; // ['', ['lw', '$t5', '0($t4)']]
139: Instruction <= 32'b00000001101010110111000000100000; // ['', ['add', '$t6', '$t5', '$t3']]
140: Instruction <= 32'b10101101000011100000000000010100; // ['', ['sw', '$t6', '20($t0)']]
141: Instruction <= 32'b10001101000010010000000000001000; // ['', ['lw', '$t1', '8($t0)']]
142: Instruction <= 32'b00100000000010100000000000000010; // ['', ['addi', '$t2', '$zero', '0x0002']]
143: Instruction <= 32'b00000001001010100101100000100101; // ['', ['or', '$t3', '$t1', '$t2']]
144: Instruction <= 32'b10101101000010110000000000001000; // ['', ['sw', '$t3', '8($t0)']]
145: Instruction <= 32'b10001111101010000000000000000000; // ['', ['lw', '$t0', '0($sp)']]
146: Instruction <= 32'b10001111101010010000000000000100; // ['', ['lw', '$t1', '4($sp)']]
147: Instruction <= 32'b10001111101010100000000000001000; // ['', ['lw', '$t2', '8($sp)']]
148: Instruction <= 32'b10001111101010110000000000001100; // ['', ['lw', '$t3', '12($sp)']]
149: Instruction <= 32'b10001111101011000000000000010000; // ['', ['lw', '$t4', '16($sp)']]
150: Instruction <= 32'b10001111101011010000000000010100; // ['', ['lw', '$t5', '20($sp)']]
151: Instruction <= 32'b10001111101011100000000000011000; // ['', ['lw', '$t6', '24($sp)']]
152: Instruction <= 32'b00100011101111010000000000011100; // ['', ['addi', '$sp', '$sp', '28']]
153: Instruction <= 32'b00000011010000000000000000001000; // ['', ['jr', '$k0']]
