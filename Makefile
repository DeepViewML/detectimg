OBJS := detect_app.o
LIBS := -lvaal

%.o : %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) 

detect_app: $(OBJS)
	dpkg -L libvaal
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)


install: detect_app
	mkdir -p $(WORKDIR)
	cp detect_app $(WORKDIR)/


clean:
	rm -f *.o
	rm -f detect_app
