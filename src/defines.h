#ifndef _DEFINES_H_
#define _DEFINES_H_

//Global defines
#define DIR_STEP 1.4
#define SCALE_FACTOR 256
//Character DATA
#define CH_COLOR 3
#define CH_WIDTH 6
#define CH_HEIGHT 6
//Waypoints DATA
#define WP_NUMBER 4
#define WP_COLOR 1
#define WP_WIDTH 2
#define WP_HEIGHT 4
// FOR TEXT
#define COLORTXT_WHITE 0
#define COLORTXT_YELLOW 1
#define COLORTXT_ORANGE 2
#define COLORTXT_BLUE 3
#define COLORTXT_RED 4
#define COLORTXT_MAUVE 5

#define TRANSPARENT 1
#define OPAQUE 0

#define NORMALHEIGHT 1
#define DOUBLEHEIGHT 2

//Global structs
typedef struct {
    u8 x, y;
} TWaypoint;

typedef struct {
    u16 x, y;
    u16 px, py;
    u16 vx, vy;
    i16 a;
    u8 dir;
    u8 motion;
    u8 target;
} TCharacter;

// Declare am_tablatrans, which is defined in game.c, and used in more places
cpctm_declareMaskTable(g_tablatrans);

#endif