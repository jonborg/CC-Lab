/*
 * cclab1_private.h
 *
 * Code generation for model "cclab1".
 *
 * Model version              : 1.28
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Wed Oct 26 10:22:20 2016
 *
 * Target selection: rtwin.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86/Pentium
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_cclab1_private_h_
#define RTW_HEADER_cclab1_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include "zero_crossing_types.h"

/* Used by FromWorkspace Block: '<Root>/From Workspace' */
#ifndef rtInterpolate
# define rtInterpolate(v1,v2,f1,f2)    (((v1)==(v2))?((double)(v1)): (((f1)*((double)(v1)))+((f2)*((double)(v2)))))
#endif

#ifndef rtRound
# define rtRound(v)                    ( ((v) >= 0) ? floor((v) + 0.5) : ceil((v) - 0.5) )
#endif
#endif                                 /* RTW_HEADER_cclab1_private_h_ */
