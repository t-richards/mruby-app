CFLAGS := -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -DMRB_USE_RATIONAL -DMRB_USE_COMPLEX
LDFLAGS := -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now

all:
	mrbc -Bapp app.rb
	$(CC) $(CFLAGS) -lm $(LDFLAGS) main.c /usr/lib/libmruby.a -o main
