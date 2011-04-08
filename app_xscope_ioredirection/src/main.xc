#include <xscope.h>
#include <xs1.h>
#include <stdio.h>

int main (void) {
   int i = 0;

   xscope_register(0, 0, "", 0, "");

   xscope_config_io(XSCOPE_IO_BASIC);

   for (i = 0; i < 10; i++) {
     printf("value of i is %d\n", i);
   }

   xscope_config_io(XSCOPE_IO_TIMED);

   for (i = 0; i < 10; i++) {
     printf("value of i is %d\n", i);
   }

   return 0;
}
