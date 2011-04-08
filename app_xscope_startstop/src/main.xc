#include <xs1.h>
#include <xscope.h>

void wait(int delay){
  timer t;
  int i;
  t :> i;
  t when timerafter(i + delay) :> i;
}

void function_1(void) {
  xscope_probe(0);
  // Do Something
  wait(150000);
  xscope_probe(0);
}

void function_2(void) {
  xscope_probe(1);
  // Do Something
  wait(500000);
  xscope_probe(1);
}

void function_3(void) {
  xscope_probe(2);
  // Do Something
  wait(50000);
  xscope_probe(2);
}

void function_4(void) {
  xscope_probe(3);
  // Do Something
  wait(240000);
  xscope_probe(3);
}

int main (void) {
   int i = 0;

   xscope_register(4,\
		           XSCOPE_STARTSTOP, "Function 1", XSCOPE_UINT, "Units",\
		           XSCOPE_STARTSTOP, "Function 2", XSCOPE_UINT, "Units",\
		           XSCOPE_STARTSTOP, "Function 3", XSCOPE_UINT, "Units",\
		           XSCOPE_STARTSTOP, "Function 4", XSCOPE_UINT, "Units");

   for (i = 1; i < 10; i++) {
	 function_1();
	 function_2();
	 function_3();
	 function_4();
   }

   return 0;
}
