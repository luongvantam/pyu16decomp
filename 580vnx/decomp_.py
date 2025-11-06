# Usage: python 580vnx/decomp_.py "./hex_ropchain/<input_hex.txt>" "./asm_ropchain/<output.asm>"
import os
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from libdecompiler import get_disas, get_commands, decompile

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: python 580vnx/decomp_.py "./hex_ropchain/<input_hex.txt>" "./asm_ropchain/<output.asm>"')
        sys.exit()

inp, outp = sys.argv[1:3]

if not os.path.exists(inp):
    print(f"Input not found: {inp}")
    sys.exit()

start_ram = 0xD000
end_ram = 0xF000
model = "580vnx"

disas = get_disas(f'{model}/disas.txt')
gadgets = get_commands(f'{model}/gadgets.txt')
labels = get_commands(f'{model}/labels.txt')

output = decompile(inp, outp, disas, gadgets, labels, start_ram, end_ram)

os.makedirs(os.path.dirname(outp) or '.', exist_ok=True)
with open(outp, 'w', encoding='utf-8') as w:
    w.write(''.join(output))