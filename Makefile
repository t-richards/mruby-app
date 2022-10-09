# Selectively borrowed from `mruby-config --cflags`
CFLAGS := -std=gnu99 -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -flto=auto -DMRB_USE_RATIONAL -DMRB_USE_COMPLEX

all:
	mrbc -Bapp app.rb
	$(CC) $(CFLAGS) -lm main.c /usr/lib/libmruby.a -o main
