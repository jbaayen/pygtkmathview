#include <pygobject.h>

void trayicon_register_classes (PyObject *d);
extern PyMethodDef gtkmathview_functions[];

DL_EXPORT(void)
initgtkmathview(void)
{
    PyObject *m, *d;

    init_pygobject ();

    m = Py_InitModule ("gtkmathview", gtkmathview_functions);
    d = PyModule_GetDict (m);

    gtkmathview_register_classes (d);

    if (PyErr_Occurred ()) {
        Py_FatalError ("can't initialise module gtkmathview");
    }
}
