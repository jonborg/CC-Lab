/*
 * cclab1_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&cclab1_B.FromWorkspace), 0, 0, 3 }
  ,

  { (char_T *)(&cclab1_DW.FromWorkspace_PWORK.TimePtr), 11, 0, 5 },

  { (char_T *)(&cclab1_DW.FromWorkspace_IWORK.PrevIndex), 10, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  3U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&cclab1_P.AnalogOutput_FinalValue), 0, 0, 6 },

  { (char_T *)(&cclab1_P.AnalogOutput_Channels), 6, 0, 7 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  2U,
  rtPTransitions
};

/* [EOF] cclab1_dt.h */
