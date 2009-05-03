#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0501  // For AddVectoredExceptionHandler

#ifndef UNICODE
#define UNICODE
#endif

#include <windows.h>

typedef char F_SYMBOL;

#define FACTOR_OS_STRING "winnt"
#define FACTOR_DLL L"factor.dll"
#define FACTOR_DLL_NAME "factor.dll"

void c_to_factor_toplevel(CELL quot);
long exception_handler(PEXCEPTION_POINTERS pe);
void open_console(void);