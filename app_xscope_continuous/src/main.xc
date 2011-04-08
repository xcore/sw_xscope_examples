#include <xscope.h>
#include <xs1.h>

void output_data_1(unsigned int value) {
  xscope_probe_data(0, value);
  // Send to output port
}

void output_data_2(unsigned int value) {
  xscope_probe_data(1, value);
  // Send to output port
}

int main (void) {
   int i = 0;

   xscope_register(2,
				   XSCOPE_CONTINUOUS, "Continuous Value 1", XSCOPE_UINT, "Value",
				   XSCOPE_CONTINUOUS, "Continuous Value 2", XSCOPE_UINT, "Value");

   for (i = 0; i < 100; i++) {
	 output_data_1(i*i);
	 output_data_2(i*i*2);
   }

   return 0;
}
