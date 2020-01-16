//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <stdio.h>
#include <cpctelera.h>
#include <stdlib.h>
#include "defines.h"
#include "text/text.h"
#include "util/util.h"

// Global Constants
const TWaypoint wp[WP_NUMBER] = {{1,1}, {10,100}, {40,180}, {70,100}};
// Máscara de transparencia
cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);

//Global Variables
u8 pause;
u8 g_nInterrupt; // Manage Interrupt
u32 i_time;

// ********************************************************************************
/// <summary>
/// myInterruptHandler
/// Interruphandler that subsitutes the default one. Includes calls for reading the keyboard and playing music, if activated
/// Returns:
/// void
/// </summary>
/// <created>johnlobo,21/08/2019</created>
/// <changed>johnlobo,21/08/2019</changed>
// ********************************************************************************
void myInterruptHandler()
{
    i_time++;

    if (++g_nInterrupt == 6)
    {
        cpct_scanKeyboard_f();
        g_nInterrupt = 0;
    }
}

void eraseCharacter(TCharacter *c){
    u8* pvmem;
    u8 x,y;
    //Normalize coordinates
    x=c->px >> 8;
    y=c->py >> 8;
    //Erase character
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), CH_WIDTH, CH_HEIGHT);
}

void printCharacter(TCharacter *c){
    u8* pvmem;
    u8 x, y;
    
    //Normalize coordinates
    //x= c->x / SCALE_FACTOR;
    x = c->x >> 8;
    y = c->y >> 8;
    //Print body
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    cpct_drawSolidBox (pvmem, cpct_px2byteM0 (CH_COLOR, CH_COLOR), CH_WIDTH, CH_HEIGHT);
    //Print head
    if (c->dir<32){
        x = x + 4;
        y = y + 2;
    } else if (c->dir<64){
        x = x + 4;
        y = y;
    } else if (c->dir<96){
        x = x + 2;
        y = y;
    } else if (c->dir<128){
        x = x;
        y = y;
    } else if (c->dir<160){
        x = x;
        y = y+2;
    } else if (c->dir<196){
        x = x;
        y = y+4;
    } else if (c->dir<228){
        x = x+2;
        y = y+4;
    } else{
        x = x+4;
        y = y+4;
    }
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    cpct_drawSolidBox (pvmem, cpct_px2byteM0 (14, 14), 2, 2);
}

void printWayPoints(){
    u8* pvmem;
    u8 i;
    for (i=0; i<4; i++){
        pvmem = cpct_getScreenPtr(CPCT_VMEM_START, wp[i].x, wp[i].y);
        cpct_drawSolidBox (pvmem, cpct_px2byteM0 (WP_COLOR, WP_COLOR), WP_WIDTH, WP_HEIGHT);
    }
}

void eraseDebugInfo(){
    u8 *pvmem;
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 50, 0);
    cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), 29, 80);    
}

void printDebugInfo(TCharacter *c){
    char auxTxt[20];
    
    sprintf(auxTxt, "X %1d", c->x >> 8);
    drawText(auxTxt, 50, 0, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "Y %1d", c->y >> 8);
    drawText(auxTxt, 50, 8, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
    sprintf(auxTxt, "DIR %1d", c->dir);
    drawText(auxTxt, 50, 16, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
    sprintf(auxTxt, "ACC %1d", c->a);
    drawText(auxTxt, 50, 24, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "VX %1d", c->vx);
    drawText(auxTxt, 50, 32, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "VY %1d", c->vx);
    drawText(auxTxt, 50, 40, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "T %1d", c->target);
    drawText(auxTxt, 50, 48, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "TX %1d", wp[c->target].x);
    drawText(auxTxt, 50, 56, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    sprintf(auxTxt, "TY %1d", wp[c->target].y);
    drawText(auxTxt, 50, 64, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
    wait4OneKey();
    eraseDebugInfo();
}

void getCharacterInput(TCharacter *c){
    
    if (cpct_isKeyPressed(Key_O)){
        c->dir = c->dir + 32;
    }
    if (cpct_isKeyPressed(Key_P)){
        c->dir = c->dir - 32;
    }
    if (cpct_isKeyPressed(Key_Q)){
        c->a = c->a + 1;
    }
    if ((cpct_isKeyPressed(Key_A)) && (c->a > 0)){
        c->a = c->a - 1;
    }
    //Toogle motion
    if (cpct_isKeyPressed(Key_Space)){
        if (c->motion){
            c->motion = 0;
            c->a = 0;
        } else {
            c->motion = 1;
            c->a = 2;
        }
    }
    //pause
    if (cpct_isKeyPressed(Key_D)){
        printDebugInfo(c);
    }
        
}

void motionUpdate(TCharacter *c){
    u8 xc,yc,xwp,ywp;
    
    //c->a = 1;
    
    xc = c->x >> 8;
    yc = c->y >> 8;

   
    if ((abs(xc - wp[c->target].x) < 2) && (abs(yc - wp[c->target].y) < 2)){
        //waypoint reached
        c->target = ((c->target+1) % WP_NUMBER);
    }
    xwp = wp[c->target].x;
    ywp = wp[c->target].y;
    if (xwp < xc){
        if (ywp < yc){
            c->dir = 96;
        } else if (ywp > yc){
            c->dir = 160;
        } else 
            c->dir = 128;
    } else if (xwp > xc){
        if (ywp < yc){
            c->dir = 32;
        } else if (ywp > yc){
            c->dir = 224;
        } else 
            c->dir = 0;
    } else if (ywp < yc){
            c->dir = 64;
    } else 
         c->dir = 192;
}

void updateCharacter(TCharacter *c){
    //Motion update
    if (c->motion)
        motionUpdate(c);
    //Velocity update
    //c->vx = c->vx + (c->a * cosine(c->dir * DIR_STEP));
    //c->vy = c->vy - (c->a * sine(c->dir * DIR_STEP));
    c->vx = (c->a * cosine(c->dir * DIR_STEP));
    c->vy = - (c->a * sine(c->dir * DIR_STEP));
/*    
    //Friction
    if (c->vx > 10){
        c->vx = c-> vx -10;
    } else{
        c->vx = 0;
    }
    if (c->vy > 10){
        c->vy = c-> vy -10;
    } else{
        c->vy = 0;
    }
    */
    //Position update
    c->x = c->x + c->vx;
    c->y = c->y + c->vy;
    //Acceleration reset
    //c->a = 0;
 
}


void init(TCharacter *c){
    // Change the interruptions table
    g_nInterrupt = 0; // Manage Interrupt
    i_time = 0;
    cpct_setInterruptHandler((void*) myInterruptHandler);
    cpct_setVideoMode(0);
    
    c->x = 20 << 8;
    c->px = c->x ;
    c->y = 20 << 8;
    c->py = c->y;
    c->vx = 0;
    c->vy = 0;
    c->a = 0;
    c->dir = 0;
    c->motion = 0;
    c->target = 0;
      
    printWayPoints();
    
    pause = 0;
}


void main(void) {
    // Local Variables
    TCharacter c;
    
    init(&c);

    printCharacter(&c);

   // Loop forever
   while (1){    

        cpct_waitHalts(5);
        getCharacterInput(&c);
        updateCharacter(&c);
        eraseCharacter(&c);
        printCharacter(&c);
        c.px = c.x;
        c.py = c.y;
   }
}
