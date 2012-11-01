#include <xscope.h>
#include <platform.h>

void wait(int delay){
  timer t;
  int i;
  t :> i;
  t when timerafter(i + delay) :> i;
}

void output_data_1(unsigned int value) {
  xscope_probe_data(0, value);
}

void output_data_2(unsigned int value) {
  xscope_probe_data(1, value);
}

void core_0_func(chanend sync) {
  xscope_register(2,
	    		   XSCOPE_CONTINUOUS, "Continuous Value 1", XSCOPE_UINT, "Value",
				   XSCOPE_CONTINUOUS, "Continuous Value 2", XSCOPE_UINT, "Value");

  sync <: 1;

  for (int i = 0; i < 100; i++) {
	wait(10000);
    output_data_1(i*i);
  }
}

void core_1_func(chanend sync) {
  unsigned tmp;

  sync :> tmp;

  for (int i = 0; i < 100; i++) {
	wait(10000);
	output_data_2(i*i*2);
  }
}

int main (void) {
   chan sync;

   par {
     on stdcore[0]: core_0_func(sync);
     on stdcore[1]: core_1_func(sync);
   }

   return 0;
}
