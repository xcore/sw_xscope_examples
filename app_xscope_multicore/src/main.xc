#include <xscope.h>
#include <xs1.h>

void output_data_1(unsigned int value) {
  xscope_probe_cpu_data(0, value);
  // Send to output port
}

void output_data_2(unsigned int value) {
  xscope_probe_cpu_data(1, value);
  // Send to output port
}

void do_output_loop(unsigned int multiplier) {
  for (int i = 0; i < 100; i++) {
    output_data_1(i*multiplier);
    output_data_2(i*2*multiplier);
  }
}

int main (void) {

   xscope_register(2,
				   XSCOPE_CONTINUOUS, "Continuous Value 1", XSCOPE_UINT, "Value",
				   XSCOPE_CONTINUOUS, "Continuous Value 2", XSCOPE_UINT, "Value");


   par {
	 do_output_loop(1);
	 do_output_loop(3);
   }

   return 0;
}
