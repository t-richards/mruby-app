#include <stdlib.h>
#include <mruby.h>
#include <mruby/irep.h>
#include "app.c"

int main(void)
{
  mrb_state *mrb = mrb_open();
  if (!mrb) {
    puts("error initializing mruby");
    return EXIT_FAILURE;
  }
  mrb_value result = mrb_load_irep(mrb, app);
  if (mrb->exc)
  {
    mrb_p(mrb, mrb_obj_value(mrb->exc));
    mrb->exc = 0;
  }
  mrb_close(mrb);
  return EXIT_SUCCESS;
}
