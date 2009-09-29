all: gtkmathview.so

gtkmathview.c: gtkmathview.defs gtkmathview.override
	pygobject-codegen-2.0 -p gtkmathview -o gtkmathview.override \
	gtkmathview.defs > $@

CFLAGS = `pkg-config --cflags gtk+-2.0 pygtk-2.0 gtkmathview-libxml2` \
	-I/usr/include/python2.6/ -I.
LDFLAGS = `pkg-config --libs gtk+-2.0 pygtk-2.0 gtkmathview-libxml2`

gtkmathview.so: gtkmathview.o gtkmathviewmodule.o
	$(CC) $(LDFLAGS) -shared $^ -o $@
