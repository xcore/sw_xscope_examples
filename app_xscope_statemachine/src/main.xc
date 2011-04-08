#include <xs1.h>
#include <xscope.h>

void wait(int delay){
  timer t;
  int i;
  t :> i;
  t when timerafter(i + delay) :> i;
}
unsigned int current_state = 1;

void change_state(unsigned int new_state) {

	current_state = new_state;
    xscope_probe_data(0, current_state);

	switch (new_state) {
	  case 1:
		wait(10000);
		break;
	  case 2:
		wait(40000);
		break;
	  case 3:
		wait(70000);
		break;
	  case 4:
		wait(100000);
		break;
	  case 5:
		wait(20000);
		break;
	  default:
		break;
	}
}

int main (void) {

  xscope_register(1, XSCOPE_STATEMACHINE, "State Transitions", XSCOPE_UINT, "State");

  for (int i = 0; i < 5; i++) {
    change_state(2);
    change_state(3);
    change_state(4);
    change_state(3);
    change_state(5);
    change_state(1);
    change_state(3);
    change_state(2);
    change_state(1);
    change_state(4);
  }

  return 0;
}
