#include <cpctelera.h>

//////////////////////////////////////////////////////////////////
// wait4OneKey
//    Waits till the user presses a key, and waits until no other key is pressed
//
//
// Returns:
//    void
//
void wait4OneKey()
{
	// wait for any previous key presses to clear first
	while (cpct_isAnyKeyPressed());

	//then wait for any key press
	while (!cpct_isAnyKeyPressed());

    return;
}