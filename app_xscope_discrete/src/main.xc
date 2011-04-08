#include <xs1.h>
#include <xscope.h>

void wait(int delay){
  timer t;
  int i;
  t :> i;
  t when timerafter(i + delay) :> i;
}
unsigned int memory_used = 0;

void allocate_memory(unsigned int size) {
	memory_used += size;
	xscope_probe_data(0, memory_used);
}

int main (void) {
   int i = 0;

   xscope_register(1, XSCOPE_DISCRETE, "Memory Allocated", XSCOPE_UINT, "Bytes");

   for (i = 1; i < 10; i++) {
     // Do something
     wait(1000);
     // Allocate memory
     allocate_memory(i*100);
   }

   return 0;
}

