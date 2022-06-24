*&---------------------------------------------------------------------*
*&  Include           Z_CONTROLO_DE_VOOS_SO
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF SCREEN 9999 AS SUBSCREEN.
SELECTION-SCREEN BEGIN OF BLOCK bloco1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS s_carrid FOR spfli-carrid NO INTERVALS.
SELECT-OPTIONS s_connid FOR spfli-connid NO INTERVALS.
SELECT-OPTIONS s_cityfr FOR spfli-cityfrom NO INTERVALS.
SELECT-OPTIONS s_cityto FOR spfli-cityto NO INTERVALS.

SELECTION-SCREEN: END OF BLOCK bloco1.
SELECTION-SCREEN: END OF SCREEN 9999.
