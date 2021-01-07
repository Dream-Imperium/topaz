#include "topaz.h"

void arl_init(arl_t *arl)
{
	arl->fd = -1;
}

void arl_cleanup(arl_t *arl)
{
	(void) arl;
}

void arl_setup(arl_t *arl, const char *filepath)
{
	(void) arl;
	(void) filepath;
}

bool arl_handle(arl_t *arl)
{ 
	(void) arl;
	return false;
}

