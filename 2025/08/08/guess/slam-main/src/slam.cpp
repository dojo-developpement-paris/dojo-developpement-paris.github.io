#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mos6502.h"
#include "ram.h"

#define CHAR_OUT 0x00FF
#define CHAR_IN  0x00FE
#define TRACE    0x00FC
#define BANK     0x00FA
#define EXITCODE 0x00F9
#define MAX_BUFFER 8192

#define BANK_SIZE 0x4000
#define BANK_BASE 0x4000
#define BANK_MAX 0x20

uint16_t origin = 0x0200;

uint8_t memory[0x10000];
uint8_t banks[BANK_MAX][BANK_SIZE];
uint8_t bank = 0;

char key_buffer[MAX_BUFFER];
int key_pos = 0;
int key_max = 0;
int line_read = 0;
int eof = 0;

void init_memory() {
    unsigned index;
    for(index = 0; index < BANK_MAX; index++) {
        unsigned judex;
        for(judex = 0; judex < BANK_SIZE; judex++) {
            banks[index][judex] = 0;
        }
    }
    for(index = 0; index < 0x10000; memory[index++] = 0);
    for(index = 0; index < BINARY_SIZE; index++) {
        memory[index+origin] = binary[index];
    }
    memory[0xFFFC] = origin & 0x00FF;
    memory[0xFFFD] = origin >> 8;
}

void ReadFromSpecialPort(uint16_t address) {
    switch(address) {
        case CHAR_IN:
            memory[address] = 0;
            if (key_pos < key_max) {
                memory[address] = (uint8_t)key_buffer[key_pos++];
            } else if (!eof) {
                fgets(key_buffer, MAX_BUFFER, stdin);
                eof = feof(stdin);
                if(!eof) {
                    key_max = strlen(key_buffer);
                    key_pos = 0;
                    memory[address] = (uint8_t)key_buffer[key_pos++];
                }
            }
            break;
    }
}

uint8_t WriteToSpecialPort(uint16_t address, uint8_t value) {
    uint8_t default_value = value;
    switch(address) {
        case EXITCODE:
            exit(value);
            break;
        case BANK: {
                       uint8_t new_bank = value & 0b00011111;
                       if (new_bank != memory[BANK]) {
                           memory[BANK] = new_bank;
                       }
                       default_value = new_bank;
                   }
            break; 
        case CHAR_OUT:
            putchar(value);
            break;
    }
    return default_value;
}

void ClockCycle(mos6502 *mpu) {
    if (mpu->GetPC() == 0x0000) {
        exit(0);
    }
}

uint8_t MemoryRead(uint16_t address) {
    ReadFromSpecialPort(address);
    if (address >= BANK_BASE && address < BANK_BASE+BANK_SIZE) {
        uint16_t index = address - BANK_BASE;
        uint8_t bank = memory[BANK];
        uint8_t value = banks[bank][index];
        return value;
    }
    return memory[address];
}

void MemoryWrite(uint16_t address, uint8_t value) {
    if (address >= BANK_BASE && address < BANK_BASE+BANK_SIZE) {
        uint16_t index = address - BANK_BASE;
        uint8_t bank = memory[BANK];
        banks[bank][index] = value;
    }
    uint8_t default_value = WriteToSpecialPort(address, value);
    memory[address] = default_value;
}

int main(int argc, char *argv[]) {
    mos6502 mpu = mos6502(MemoryRead, MemoryWrite, ClockCycle);
    init_memory();
    mpu.Reset();
    mpu.RunEternally();
    return 2;
}
