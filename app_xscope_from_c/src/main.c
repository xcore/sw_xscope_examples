#include <xscope.h>
#include <stdlib.h>
#include <math.h>

int main (void) {
  float i = 0;
  float value = 0;

  xscope_register(10, \
                  XSCOPE_CONTINUOUS, "Sin 1", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 2", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 3", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 4", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 5", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 6", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 7", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 8", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 9", XSCOPE_FLOAT, "Value", \
                  XSCOPE_CONTINUOUS, "Sin 10", XSCOPE_FLOAT, "Value");

  for (i = 0; i < 40; i+=0.01) {
    value = sin(i);
    xscope_probe_data(0, value * 100);
    value = sin(i);
    xscope_probe_data(1, value * 90);
    value = sin(i);
    xscope_probe_data(2, value * 80);
    value = sin(i);
    xscope_probe_data(3, value * 70);
    value = sin(i);
    xscope_probe_data(4, value * 60);
    value = sin(i);
    xscope_probe_data(5, value * 50);
    value = sin(i);
    xscope_probe_data(6, value * 40);
    value = sin(i);
    xscope_probe_data(7, value * 30);
    value = sin(i);
    xscope_probe_data(8, value * 20);
    value = sin(i);
    xscope_probe_data(9, value * 10);
  }

  return 0;
}

